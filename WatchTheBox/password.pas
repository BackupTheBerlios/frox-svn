unit password;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls;

type
  TPWForm = class(TForm)
    PWEdit: TEdit;
    savePwd: TCheckBox;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    passlabel: TLabel;
    BitBtn2: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SendPW;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  PWForm: TPWForm;

implementation
uses main, tools, HttpProt;

{$R *.dfm}

procedure TPWForm.SendPW;
var  Data: string;
     pw  : string;
begin
  pw:= decode(sett.ReadString('FritzBox', 'binaries', ''), mykey);
  Data:= 'login:command/password='+pw+'&';
  Data:= Data + 'Submit=Submit';
  Form1.httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);
end;

procedure TPWForm.BitBtn1Click(Sender: TObject);
var  Data: string;
begin
  Data:= 'login:command/password='+pwedit.text+'&';
  Data:= Data + 'Submit=Submit';
  Form1.httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);
  // Wrong Password please reenter!
  if Form1.CheckForPassword then
  begin
    pwedit.Text := '';
    savePWD.Checked := false;
    exit;
  end;


  if savePWD.Checked then
  begin
    sett.writeBool('FritzBox', 'useBin', savePWD.Checked);
    sett.writeString('FritzBox', 'binaries', encode(PwEdit.text, mykey));
  end else
  begin
    sett.DeleteKey('FritzBox', 'useBin');
    sett.DeleteKey('FritzBox', 'binaries');
  end;
  PWForm.close;
end;

procedure TPWForm.FormCreate(Sender: TObject);
begin
  savePWD.Checked := sett.readBool('FritzBox', 'useBin', false);
  if savePWD.checked then
  begin
    PWEdit.Text:= decode(sett.ReadString('FritzBox','binaries',''), mykey);
    BitBtn1.Click
  end;
end;

end.
