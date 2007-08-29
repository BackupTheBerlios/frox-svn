unit PBMess;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons;

type
  TPBMessage = class(TForm)
    Bevel1: TBevel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    o1: TLabeledEdit;
    o2: TLabeledEdit;
    o3: TLabeledEdit;
    o4: TLabeledEdit;
    n1: TLabeledEdit;
    n2: TLabeledEdit;
    n3: TLabeledEdit;
    n4: TLabeledEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    procedure FillEntry(id: integer);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    lastResult: integer;
  end;

var
  PBMessage: TPBMessage;

implementation
uses main;
{$R *.dfm}

procedure TPBMessage.FillEntry(id :integer);
begin
   o1.text:= phonebook[id].name;
   o2.text:= phonebook[id].number;
   o3.text:= phonebook[id].short;
   o4.text:= phonebook[id].vanity;
   exit;
end;

procedure TPBMessage.BitBtn1Click(Sender: TObject);
begin
  lastResult:= 1;
  ModalResult:= 1;
end;

procedure TPBMessage.BitBtn2Click(Sender: TObject);
begin
  lastResult:= 2;
  ModalResult:= 2;
end;

end.
