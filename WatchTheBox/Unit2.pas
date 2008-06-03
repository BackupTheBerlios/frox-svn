unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls, Buttons, jpeg, dialogs;

type
  TCallIn = class(TForm)
    info2: TLabel;
    info3: TLabel;
    Bevel1: TBevel;
    Date: TLabel;
    BitBtn1: TBitBtn;
    topbox: TCheckBox;
    Panel: TPanel;
    Bright: TButton;
    Bleft: TButton;
    Calltype: TLabel;
    info4: TLabel;
    duration: TLabel;
    Timer: TTimer;
    durationTimer: TTimer;
    Image1: TImage;
    reject: TBitBtn;
    number: TLabel;
    procedure rejectClick(Sender: TObject);
    procedure durationTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
    procedure BleftClick(Sender: TObject);
    procedure BrightClick(Sender: TObject);
    procedure topboxClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure showCall(p: integer; setpos: integer);
    procedure CreateParams(var Params : TCreateParams); override;
  private
    { Private-Deklarationen }
     procedure WMNCHitTest(var M: TWMNCHitTest);
      message wm_NCHitTest;
   var CallID : integer;
  public
    Call: string;

    { Public-Deklarationen }
  end;

var
  CallIn: TCallIn;

implementation
uses tools, main, Strutils, shellapi;
{$R *.dfm}

function EnumProcess(hHwnd: HWND): string; stdcall;
var
  pPid : DWORD;
  title, ClassName : string;
begin
  //if the returned value in null the
  //callback has failed, so set to false and exit.
  if (hHwnd=NULL) then
  begin
    result := '';
  end
  else
  begin
    //additional functions to get more
    //information about a process.
    //get the Process Identification number.
    GetWindowThreadProcessId(hHwnd,pPid);
    //set a memory area to receive
    //the process class name
    SetLength(ClassName, 255);
    //get the class name and reset the
    //memory area to the size of the name
    SetLength(ClassName,
              GetClassName(hHwnd,
                           PChar(className),
                           Length(className)));
    SetLength(title, 255);
    //get the process title; usually displayed
    //on the top bar in visible process
    SetLength(title, GetWindowText(hHwnd, PChar(title), Length(title)));
    //Display the process information
    //by adding it to a list box
    Result := title;
  end;
end;

//den Desktop zum Mainform machen, damt das Fenster nicht mit LCXP weggeblendet wird
procedure TCallIn.CreateParams(var Params : TCreateParams);
begin
  inherited CreateParams(Params);
  Params.WndParent := GetDesktopWindow;
  Params.Caption:='CallInfo';
end;

procedure TCallIn.WMNCHitTest (var M: TWMNCHitTest);
begin
  inherited;
  if M.Result = htClient then
    M.Result := htCaption;
end;

procedure SetFormPosition;
var h              : HWnd;
    Taskbar        : TRect;
    Twidth, THeight: integer;
begin
H:= FindWindow('Shell_TrayWnd', nil);
if H<>0 then
begin
      GetWindowRect(H, Taskbar);
      TWidth := Taskbar.right - Taskbar.Left;
      THeight:= Taskbar.Bottom - Taskbar.Top;

      if TWidth > THeight then
      begin //Taskbar ist oben oder unten)
        if Taskbar.Bottom = Screen.Height then
        begin
         Callin.top  := Taskbar.Top  - Callin.Height;
         CallIn.Left := Screen.Width - CallIn.Width;
        end
        else
        if Taskbar.Top = 0 then
        begin
         Callin.top  := Taskbar.Bottom +1;
         CallIn.Left := Screen.Width - CallIn.Width;
        end;
      end //Taskbar ist rechts oder links)
      else
      begin
       if taskbar.left = 0 then
       begin
        Callin.top := Screen.height - Callin.Height;
        callin.Left:= TWidth + 1;
       end
       else
       if Taskbar.right = screen.width then
       begin
        Callin.top := Screen.height - Callin.Height;
        callin.Left:= Taskbar.left - Callin.width;
       end;
      end;
end;
end;

procedure TCallIn.showCall(p: integer; setpos: integer);
var image, MCEMessageParams, MCEMessagePath : string;
    top, right, left: integer;
    cres: boolean;
    e: extended;
    i : integer;
begin
      right:= 0;
      if setpos = 0 then right := callin.left + callin.width;
      if p >= length(ActiveCalls) then p:=0;
      if length(ActiveCalls)=0 then exit;
      callID:= p;
      CallType.caption:= ActiveCalls[p].typ;
      info2.caption   := ActiveCalls[p].name;
      info3.caption   := ActiveCalls[p].MSN;
      info4.caption   := ActiveCalls[p].ConnID;
      date.caption    := ActiveCalls[p].date;

      number.Caption := '';
      if (ActiveCalls[p].Cbc = '') then
      begin
        cres := TextToFloat(PChar(ActiveCalls[p].name), e, fvExtended);
        if not cres then
          number.Caption := 'Number: '+ ActiveCalls[p].Rufnummer
      end else
        number.Caption := 'Number: '+ ActiveCalls[p].Klarnummer+' / Cbc: '+ActiveCalls[p].Cbc;

      if (info2.caption = '') then
      begin
        info2.caption := 'unknown';
        number.Caption := '';
      end;

      // Leider kommt es bei kurzen Namen oder Nummern immer zu einem Darstellungsfehler,
      // also machen wir das Ganze dann einfach etwas länger.
      for i := length(info2.Caption) to 17 do
        info2.Caption := info2.Caption + ' ';

      if ActiveCalls[p].typ = 'outgoing call' then
         info3.caption   := ActiveCalls[p].Nebenstelle+'@'+ActiveCalls[p].MSN;
      duration.caption:= '';
      if ActiveCalls[p].start > 0 then
       duration.caption:= Format('%ds',[round(gettickcount/1000 - ActiveCalls[p].start/1000)]);

      durationTimer.Enabled:= true;
      callin.Constraints.MaxWidth:= screen.Width;

      //Anruferbild laden
      image:= sett.readString('Images', ActiveCalls[p].name, '');
      if (image <> '') and FileExists(image) then
      begin
       Image1.Picture.LoadFromFile(image);
       image1.Visible:= true;
       image1.Width:= 102;
       callin.Width:= callin.Constraints.MinWidth + Image1.width;
       info2.Left := 120;
       info3.left := 120;
       number.left := 120;
       topbox.left:= 120;
      end
      else
      begin
       image1.Visible:= false;
       image1.Width:= 0;
       callin.Width := callin.Constraints.MinWidth;
       info2.Left := 18;
       info3.left := 18;
       number.left := 18;
       topbox.left:= 18;
      end;

      Callin.ClientWidth:= image1.Width + 50 + info2.Canvas.TextWidth(info2.Caption) + date.canvas.textwidth(date.caption);
      panel.left := image1.width + 1;
      panel.width:= Callin.ClientWidth - image1.width - 3;

      if setpos <> 0 then
      begin
       top  := sett.Readinteger('Call','top' ,-1);
       left := sett.Readinteger('Call','right',-1)- self.width;

       if (left < 0) or (top < 0)
          or sett.ReadBool('Call','forgetpos',false)
          or (Screen.Width-self.width < left)
          or (Screen.height-self.height < top)
        then
         SetFormPosition
       else
       begin
         CallIn.Left    := left;
         CallIn.top     := top;
       end;
       If EnumProcess (GetForegroundWindow) <> 'Windows Media Center' then
         AlwaysOnTop(Callin.Handle,callin.Left,callin.top, callin.width, callin.height, true)
       else begin
         if sett.ReadBool('FritzBox','MCEMessageUse',false) then
         begin
           // Use Spyn Doctors MCEMessage to notify call.
           // While it is not as versatile as original notifier, it looks a lot more
           // slick, than forcing Media Center to the background.
           MCEMessageParams :=
           // TITLE
           '"'+ActiveCalls[p].typ+'(#'+ActiveCalls[p].ConnID+')'+'"'+
           ' '+
           // TEXT
           '"'+info2.caption+'                 '+date.caption+'\r\n'+
           number.caption+'\r\n'+
           info3.Caption+'"'+
           ' '+
           // TIMEOUT
           sett.ReadString ('FritzBox','CloseTime','15')+
           ' '+
           // MODAL
           '0';
           // IMAGEPATH
           if image <> '' then MCEMessageParams := MCEMessageParams +' '+ image;
           MCEMessagePath := sett.ReadString('FritzBox','MCEMessagePath','mcemessage.exe');
           ShellExecute(Application.Handle, 'open', PChar(MCEMessagePath), PChar(MCEMessageParams), nil, SW_HIDE);

           // display normal notifier anyway
           AlwaysOnTop(Callin.Handle,callin.Left,callin.top, callin.width, callin.height, true);
         end else
         begin
           // As Spyn Doctors MCEMessage is not to be used, force Media Center to background.
           ShowWindow(GetForegroundWindow,SW_HIDE);
           SetForegroundWindow(Callin.Handle);
           AlwaysOnTop(Callin.Handle,callin.Left,callin.top, callin.width, callin.height, true);
         end;
       end;

      end
      else
      begin
       Callin.left:= right - CallIn.width;
      end;

      sett.Writeinteger('Call','left',CallIn.Left);
      sett.Writeinteger('Call','right',CallIn.Left + Callin.width);
      sett.Writeinteger('Call','top' ,CallIn.top);
end;

procedure TCallIn.BitBtn1Click(Sender: TObject);
begin
  CallIn.close;
  Form1.ToolButton6.Enabled := true;
end;

procedure TCallIn.topboxClick(Sender: TObject);
begin
  AlwaysOnTop(Callin.Handle, callin.Left,callin.top, callin.width, callin.height, topbox.Checked);
end;

procedure TCallIn.BrightClick(Sender: TObject);
begin
 if CallID+1 < length(ActiveCalls) then ShowCall(CallID+1, 0)
 else
 if CallID+1 >= length(ActiveCalls) then ShowCall(0, 0)
end;

procedure TCallIn.BleftClick(Sender: TObject);
begin
 if CallID-1 > -1 then ShowCall(CallID-1,0)
 else
 if CallID-1 = -1 then ShowCall(length(ActiveCalls),0)
end;

procedure TCallIn.TimerTimer(Sender: TObject);
begin
  CallIn.close;
  Form1.ToolButton6.Enabled := true;
end;

procedure TCallIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
sett.Writeinteger('Call','left',CallIn.Left);
sett.Writeinteger('Call','right',CallIn.Left + Callin.width);
sett.Writeinteger('Call','top' ,CallIn.top);
durationTimer.Enabled:= false;
CallIn.Release;
CallIn:= nil;
end;

procedure TCallIn.FormCreate(Sender: TObject);
begin
if sett.ReadBool('FritzBox','CloseTimer',false) then
 begin
  timer.Interval:= sett.ReadInteger('FritzBox','CloseTime',15) * 1000;
  timer.Enabled:= true;
 end;
 //reject.Visible:= form1.telnet.IsConnected;
 reject.Visible := false;
end;


procedure TCallIn.durationTimerTimer(Sender: TObject);
begin
 if (( CallID >= 0  ) and (CallID < length(ActiveCalls))
    and (ActiveCalls[CallID].start > 0))
  then
       duration.caption:= Format('%ds',[round(gettickcount/1000 - ActiveCalls[CallID].start/1000)]);
end;

procedure TCallIn.rejectClick(Sender: TObject);
begin
  // Form1.restarttelefon.Click;
end;

end.
