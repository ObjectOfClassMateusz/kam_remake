unit KM_GUICommonGameOptions;
{$I KaM_Remake.inc}
interface
uses
   Classes, SysUtils,
   KM_GUICommonOptions,
   KM_Controls, KM_CommonTypes, KM_GUICommonKeys;

type
  TKMGUICommonGameOptions = class
  private
    fGUICommonOptions: TKMGUICommonOptions;

    procedure CloseClick;
  protected
    PopUpPanel_Settings: TKMPopUpPanel;
    Panel_Settings: TKMPanel;
  public
    constructor Create(aParent: TKMPanel; aOnKeysUpdated: TEvent);
    destructor Destroy; override;

    property GUICommonOptions: TKMGUICommonOptions read fGUICommonOptions;

    procedure Refresh;
    procedure Show;
    procedure Hide;
    function Visible: Boolean;
  end;


implementation
uses
  KM_GameSettings, KM_ResTexts, KM_ResFonts, KM_InterfaceGame, KM_Music, KM_Sound, KM_Game, KM_GameParams,
  KM_GameTypes, KM_RenderUI, KM_InterfaceTypes,
  KM_Resource;


{ TKMMapEdMenuQuit }
constructor TKMGUICommonGameOptions.Create(aParent: TKMPanel; aOnKeysUpdated: TEvent);
const
  W_PNL = 600;
  H_PNL = 510;
begin
  inherited Create;

  PopUpPanel_Settings := TKMPopUpPanel.Create(aParent.MasterParent, W_PNL, H_PNL, gResTexts[TX_MENU_SETTINGS], pubgitYellow, False, False);
  PopUpPanel_Settings.HandleCloseKey := True;
  PopUpPanel_Settings.CapOffsetY := -5;

  Panel_Settings := TKMPanel.Create(PopUpPanel_Settings.ItemsPanel, 0, 0, W_PNL, H_PNL);

  fGUICommonOptions := TKMGUICommonOptions.Create(Panel_Settings, guiOptGame, CloseClick, aOnKeysUpdated);

  PopUpPanel_Settings.Hide;
end;


destructor TKMGUICommonGameOptions.Destroy;
begin
  fGUICommonOptions.Free;

  inherited;
end;


procedure TKMGUICommonGameOptions.CloseClick;
begin
  PopUpPanel_Settings.Hide;
end;


procedure TKMGUICommonGameOptions.Refresh;
begin
  fGUICommonOptions.Refresh;
end;


procedure TKMGUICommonGameOptions.Hide;
begin
  PopUpPanel_Settings.Hide;
end;


procedure TKMGUICommonGameOptions.Show;
begin
  Refresh;
  PopUpPanel_Settings.Show;
  PopUpPanel_Settings.Focus; // To be able to handle KeyUp
end;


function TKMGUICommonGameOptions.Visible: Boolean;
begin
  Result := PopUpPanel_Settings.Visible;
end;


end.
