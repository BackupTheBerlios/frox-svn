program WatchTheBox;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  main in 'main.pas' {Form1},
  Unit2 in 'Unit2.pas' {CallIn},
  statistics in 'statistics.pas' {stats},
  tools in 'tools.pas',
  settings in 'settings.pas' {Form3},
  password in 'password.pas' {PWForm},
  CallManagement in 'CallManagement.pas',
  PBMess in 'PBMess.pas' {PBMessage};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'WatchTheBox';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tstats, stats);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TPWForm, PWForm);
  Application.CreateForm(TPBMessage, PBMessage);
  Application.Run;
end.
