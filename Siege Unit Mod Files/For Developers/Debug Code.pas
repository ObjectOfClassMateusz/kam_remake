//cmowla (for debugging)  Unit module must "use" SysUtils to use this!
procedure Write_To_File(aLogErrorMsgCC, filePathC: string);
var fl: TextFile;
begin
//  If gGameParams.IsMapEditor Then Exit; //Must "use" KM_GameParams if it's not already used.
  AssignFile(fl, filePathC);
  If FileExists(filePathC) = False Then Rewrite(fl);
  Append(fl);
  WriteLn(fl, aLogErrorMsgCC);
  CloseFile(fl);
end; 



Write_To_File('-------------------', 'C:\Users\Chris\Desktop\Notes.txt');




//raise Exception.Create(''); //Requires KM_Crashreport


fIgnoreConsistencyCheckErrors := False; //Set to True if you want to view "broken" replays