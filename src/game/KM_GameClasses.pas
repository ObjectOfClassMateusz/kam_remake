unit KM_GameClasses;
interface
uses
  KM_Minimap,
  KM_CommonClasses;

type
  //MP Game local data, which should not be transfered over net (for different reasons described below)
  TKMGameMPLocalData = class
  private
    fLastReplayTick: Cardinal; //we can't put it into game, since this tick could be different for every player and we will get different save files CRC
    fStartLoc: Integer; //Starting loc is used to check if we are allowed to load minimap. F.e. we do not need to load minimap if we changed loc to other after back to lobby
    fMinimap: TKMMinimap; //Minimap could be unique for each player, then we can't save it to game it too
    procedure LoadHeader(aLoadStream: TKMemoryStreamBinary);
    procedure LoadMinimap(aLoadStream: TKMemoryStreamBinary; aMinimap: TKMMinimap);
  public
    constructor Create; overload;
    constructor Create(aLastReplayTick: Cardinal; aStartLoc: Integer; aMinimap: TKMMinimap); overload;

    property LastReplayTick: Cardinal read fLastReplayTick write fLastReplayTick;

    procedure Save(aSaveStream: TKMemoryStream);
    procedure Load(aLoadStream: TKMemoryStreamBinary; aMinimap: TKMMinimap = nil);

    procedure SaveToFile(aFilePath: String);
    function LoadFromFile(aFilePath: String): Boolean;
  end;

implementation
uses
  SysUtils,
  KM_Defaults;


constructor TKMGameMPLocalData.Create;
begin
  Create(0, -1, nil);
end;


constructor TKMGameMPLocalData.Create(aLastReplayTick: Cardinal; aStartLoc: Integer; aMinimap: TKMMinimap);
begin
  inherited Create;

  fLastReplayTick := aLastReplayTick;
  fStartLoc := aStartLoc;
  fMinimap := aMinimap;
end;


procedure TKMGameMPLocalData.Save(aSaveStream: TKMemoryStream);
begin
  aSaveStream.Write(fLastReplayTick);
  aSaveStream.Write(fStartLoc);
  if fMinimap <> nil then
    fMinimap.SaveToStream(aSaveStream);
end;


procedure TKMGameMPLocalData.Load(aLoadStream: TKMemoryStreamBinary; aMinimap: TKMMinimap = nil);
begin
  LoadHeader(aLoadStream);
  LoadMinimap(aLoadStream, aMinimap);
end;


procedure TKMGameMPLocalData.LoadHeader(aLoadStream: TKMemoryStreamBinary);
begin
  aLoadStream.Read(fLastReplayTick);
  aLoadStream.Read(fStartLoc);
end;


procedure TKMGameMPLocalData.LoadMinimap(aLoadStream: TKMemoryStreamBinary; aMinimap: TKMMinimap);
begin
  if aMinimap <> nil then
    aMinimap.LoadFromStream(aLoadStream);
end;


procedure TKMGameMPLocalData.SaveToFile(aFilePath: String);
var
  SaveStream: TKMemoryStreamBinary;
begin
  SaveStream := TKMemoryStreamBinary.Create;
  try
    Save(SaveStream);
    SaveStream.SaveToFile(aFilePath);
  finally
    SaveStream.Free;
  end;
end;


function TKMGameMPLocalData.LoadFromFile(aFilePath: String): Boolean;
var
  LoadStream: TKMemoryStreamBinary;
  ChoosenStartLoc: Integer;
begin
  Result := False;
  if FileExists(aFilePath) then
  begin
    LoadStream := TKMemoryStreamBinary.Create;
    try
      LoadStream.LoadFromFile(aFilePath);
      ChoosenStartLoc := fStartLoc;
      LoadHeader(LoadStream);

      if (ChoosenStartLoc = LOC_ANY) // for not MP game, f.e.
        or (ChoosenStartLoc = LOC_SPECTATE) // allow to see minimap for spectator loc
        or (fStartLoc = ChoosenStartLoc) then // allow, if we was on the same loc
      begin
        LoadMinimap(LoadStream, fMinimap);
        Result := True;
      end;
    finally
      LoadStream.Free;
    end;
  end;
end;


end.