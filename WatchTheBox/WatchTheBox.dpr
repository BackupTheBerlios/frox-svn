program WatchTheBox;

uses
  Forms,
  main in 'main.pas' {Form1},
  Unit2 in 'Unit2.pas' {CallIn},
  statistics in 'statistics.pas' {stats},
  tools in 'tools.pas',
  settings in 'settings.pas' {Form3},
  password in 'password.pas' {PWForm},
  CallManagement in 'CallManagement.pas',
  PBMess in 'PBMess.pas' {PBMessage},
  Windows;

{$R *.res}

var
  ExtendedStyle : Integer;

begin
  Application.Initialize;
  Application.Title := 'WatchTheBox';
  // Hide Taskbar Entry (will hide the Taskbar Entry for the Notification Window)
  ExtendedStyle := GetWindowLong(Application.Handle, GWL_EXSTYLE);
  SetWindowLong(Application.Handle, GWL_EXSTYLE, ExtendedStyle OR WS_EX_TOOLWINDOW AND NOT WS_EX_APPWINDOW);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tstats, stats);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TPBMessage, PBMessage);
  Application.Run;
end.
