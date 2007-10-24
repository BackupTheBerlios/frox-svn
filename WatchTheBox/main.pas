unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  IpHlpApi,IpIfConst,IpRtrMib,ipFunctions,iptypes, ExtCtrls, StrUtils,
  scktcomp, CoolTrayIcon, ComCtrls, Buttons, inifiles, HttpProt, Menus, ImgList,
  Gauges, BomeOneInstance, ToolWin, winsock, TnCnx;

type

  TTraffic = Record
      StartOfPeriod: TDateTime;
      TotalIn: Cardinal;
      TotalOut: Cardinal;
      todayU,thisweekU, thismonthU : Cardinal;
      todayD,thisweekD, thismonthD : Cardinal;
      DateofToday: TDateTime;
      Price: real;
  end;

  TPerson = Record
      Name     : string;
      Number   : string;
      short    : string;
      vanity   : string;
      No       : integer;
      important: boolean;
   end;

   TCaller = Record
      Date            : string;
      typ             : string;
      ConnID          : string;
      Rufnummer       : string;
      Nebenstelle     : string;
      MSN             : string;
      Dauer           : string;
      Name            : string;
      Start           : cardinal;
    end;

  type TFilterArray = array[1..3] of boolean;

  TForm1 = class(TForm)
    Timer: TTimer;
    Tray: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    searchNumber: TMenuItem;
    PopupMenu2: TPopupMenu;
    pbdelete: TMenuItem;
    ReloadPhonebook: TMenuItem;
    reloadCallerList: TMenuItem;
    PageControl1: TPageControl;
    Tab1: TTabSheet;
    Label8: TLabel;
    Label9: TLabel;
    LimitLabel: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    viewstats: TBitBtn;
    Tab2: TTabSheet;
    CallerList: TListView;
    Tab3: TTabSheet;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList2: TImageList;
    ToolButton2: TToolButton;
    Status: TStatusBar;
    error: TLabel;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    EdtPrice: TEdit;
    Image1: TImage;
    Gauge1: TGauge;
    Label1: TLabel;
    reset: TButton;
    Website: TLabel;
    ToolButton9: TToolButton;
    OneInstance: TBomeOneInstance;
    SocketConnect: TTimer;
    addtoPhonebook: TMenuItem;
    N1: TMenuItem;
    ImgDlg: TOpenDialog;
    N2: TMenuItem;
    pbaddpicture: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    deleteitem: TMenuItem;
    ToolButton10: TToolButton;
    vcfimport: TToolButton;
    wakeup: TTimer;
    searchpanel: TGroupBox;
    PBsearch: TLabeledEdit;
    sname: TRadioButton;
    snumber: TRadioButton;
    ToolButton11: TToolButton;
    GroupBox1: TGroupBox;
    PhoneBookList: TListView;
    PBadd: TButton;
    PBimportant: TCheckBox;
    PBClear: TButton;
    PBShort: TComboBox;
    sendtoBox: TCheckBox;
    N3: TMenuItem;
    Dial1: TMenuItem;
    Fon11: TMenuItem;
    Fon21: TMenuItem;
    Fon31: TMenuItem;
    S0Bus1: TMenuItem;
    Hangupbutton: TToolButton;
    N4: TMenuItem;
    Dial2: TMenuItem;
    Fon12: TMenuItem;
    Fon22: TMenuItem;
    Fon32: TMenuItem;
    S01: TMenuItem;
    Tab4: TTabSheet;
    Button2: TButton;
    Button3: TButton;
    telnet: TTnCnx;
    restarttelefon: TButton;
    Button5: TButton;
    TelnetLog: TMemo;
    Label5: TLabel;
    Label6: TLabel;
    StartupTimer: TTimer;
    WaitForReconnect: TTimer;
    pbdelpicture: TMenuItem;
    PBName: TLabeledEdit;
    PBNumber: TLabeledEdit;
    PBVanity: TLabeledEdit;
    Label7: TLabel;
    procedure PBNumberKeyPress(Sender: TObject; var Key: Char);
    procedure pbdelpictureClick(Sender: TObject);
    procedure WaitForReconnectTimer(Sender: TObject);
    procedure StartupTimerTimer(Sender: TObject);
    procedure telnetDataAvailable(Sender: TTnCnx; Buffer: Pointer;
      Len: Integer);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure telnetSessionClosed(Sender: TTnCnx; Error: Word);
    procedure telnetSendLoc(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure restarttelefonClick(Sender: TObject);
    procedure telnetDisplay(Sender: TTnCnx; Str: string);
    procedure telnetSessionConnected(Sender: TTnCnx; Error: Word);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Fon12Click(Sender: TObject);
    procedure HangupbuttonClick(Sender: TObject);
    procedure Fon11Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ToolButton11Click(Sender: TObject);
    procedure PBsearchChange(Sender: TObject);
    procedure PBsearchChangeBackwards;
    procedure wakeupTimer(Sender: TObject);
    procedure sendtoBoxClick(Sender: TObject);
    procedure vcfimportClick(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure deleteitemClick(Sender: TObject);
    procedure pbaddpictureClick(Sender: TObject);
    procedure addtoPhonebookClick(Sender: TObject);
    procedure searchNumberClick(Sender: TObject);
    procedure SocketConnectTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ToolButton9Click(Sender: TObject);
    procedure WebsiteClick(Sender: TObject);
    procedure WebsiteMouseLeave(Sender: TObject);
    procedure WebsiteMouseEnter(Sender: TObject);
    procedure resetClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure PBClearClick(Sender: TObject);
    procedure PhonebookListColumnClick(Sender: TObject; Column: TListColumn);
    procedure PhonebookListCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure PhoneBookListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure PBaddClick(Sender: TObject);
    procedure reloadCallerListClick(Sender: TObject);
    Procedure LoadPhonebookFromFile;
    Procedure LoadCallersFromFile();
    procedure ReloadPhonebookClick(Sender: TObject);
    procedure pbdeleteClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure viewstatsClick(Sender: TObject);
    procedure TrayMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);

    procedure TimerTimer(Sender: TObject);
    procedure Socketconn(Sender: TObject; Socket: TCustomWinSocket);
    procedure SocketErr(Sender:TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: integer);
    Procedure SocketMessage(Sender: TObject; Socket: TCustomWinSocket);
    Procedure DocData(sender: TObject; Buffer: Pointer; len: integer);
    Procedure ParseCallList(s:TStream; filter: TFilterArray; LoadedFromBox: Boolean;Sender: TObject);
    procedure FillPhonebook;
    procedure PBShortFill;
    Procedure StartMySocket;
    Procedure StopMySocket;
    function  AskForUpdate: boolean;
    Procedure UpdatePhonebook;
    procedure httpget(URL: string; var str: TStringStream);
    procedure httppost(URL,Data: string);
    procedure SaveTrafficData;
    procedure ReverseLookUp(Call: TCaller);
    procedure WMPowerBroadcast(var Msg: TMessage); message WM_POWERBROADCAST;
    procedure HangUpFritzBox();
  private
    { Private-Deklarationen }
    PBselected: integer;
    unsaved_Phonebook: boolean;
    SocketConnected: boolean;
  public
    { Public-Deklarationen }
  end;

const mykey = 'Ein sehr langer KEY, den jeder beim Zählen von 12345 versteht';

var
  Form1              : TForm1;
  sett               : TMemInifile;
  MySocket             : TClientSocket;
  PhoneBook          : array of TPerson;
  PhoneBook_new      : array of TPerson;
  ActiveCalls        : array of TCaller;
  BoxAdress          : string;
  Phonebookliste     : TListitems;
  CallerListe        : TListitems;
  NetworkDevice      : integer;
  TData              : TTraffic;
  offsetIN, offsetOUT: cardinal;
  TIN, TOUT          : cardinal;
  LastIN, LastOUT    : cardinal;
  ColumnToSort       : Integer;
  LastSorted         : Integer;
  SortDir            : Integer;
  OldName, OldNumber : string; //for changes of the actual selected name
  CallByCall         : TStringList;
implementation
uses RegExpr, Unit2, statistics, settings, DateUtils, shellapi, tools, password,
     CallManagement, PBMess;

{$R arrows.res}

Procedure TForm1.WMPowerBroadcast(var Msg: TMessage);
begin
wakeup.Enabled:= true;
end;

procedure TForm1.SocketConnectTimer(Sender: TObject);
begin //versuche alle 5 s mit der FritzBox zu Verbinden
 SocketConnect.enabled:= false;
 if sett.ReadBool('FritzBox','useMonitor',false) then
     StartMySocket; //Fritz!Box Listener started
end;

procedure TForm1.StartMySocket;
begin
 SocketConnected  := false;
 MySocket.Host    := sett.readstring('Fritzbox','IP','192.168.178.1');
 MySocket.Port    := sett.ReadInteger('FritzBox','Port',1012);
 try
   MySocket.Open;
 except
  status.SimpleText:= 'Connection refused. Check your firewall.';
 end; 
end;

procedure tForm1.SocketConn(Sender: TObject; Socket: TCustomWinSocket);
begin
 Status.Simpletext:= 'Fritz!Box connected';
 SocketConnected  := true;
end;

procedure TForm1.SocketErr(Sender:TObject; Socket: TCustomWinSocket; ErrorEvent: TErrorEvent; var ErrorCode: integer);
begin
 If ErrorCode <> 0 then
 begin
    Status.Simpletext:= 'Could not connect to your Fritz!Box';
    SocketConnected  := false;
    SocketConnect.enabled:= true;
    ErrorCode:= 0;
 end;
end;

procedure TForm1.StopMySocket;
begin
 try
  if SocketConnected then MySocket.Close;
 except
 end;
end;

procedure filterCbc(var number: string);
var t: string;
    cnt,i: integer;
begin
 if (CallByCall.count >0) then
      for i:= 0 to CallByCall.count-1 do
      begin
       t:= CallByCall.Strings[i];
       if (t[1] = '#') or (length(t) = 0) then continue; //ignore comments
       cnt:= length(t);
       while AnsiEndsStr('*',t) do delete(t,length(t),1);

       if AnsiStartsStr(t, number) then delete(number,1,cnt) //CallByCallNummer löschen
      end;
end;

function CompleteNumber(number:string): string;
var City, Country: string;
begin
 City   := sett.ReadString('FritzBox','CityCode', '');
 Country:= sett.ReadString('FritzBox','CountryCode', '');

 if (length(City) > 0) and (City[1]='0') then delete(City,1,1); //führende Null löschen

 if AnsiStartsText('00', number) or AnsiStartsText('+', number)
 then //wenn Country-Code schon enthalten
  begin
    if AnsiStartsText('+', number) then
    begin
      delete(number,1,1);     //+ löschen
      number:= '00'+number;  //+ durch 00 ersetzen
    end;
  end
 else //City Code schon enthalten
 if AnsiStartsText('0', number) then
  begin
   delete(number,1,1);    //die führende Null löschen
   number:= Country+number;  //Landesvorwahl anfügen
  end
 else //keine Vorwahl angegeben -> volle Ergänzung
 begin
   number:= Country+City+number;
 end;

 Result:= number;
end;

function findnames(number: string; return : integer): string;
var i: integer;
    t: string;
    vgl: string;
begin
 if (return=1) then
   Result:= number
   else Result:= '';

 t:= number;
 filterCbc(t);

 if length(PhoneBook) > 0 then
 for i:= 0 to length(PhoneBook)-1 do
 begin
  vgl:= Phonebook[i].number;
  vgl:= CompleteNumber(vgl);
  t  := CompleteNumber(t);
//  showmessage(t + ' ' + vgl);
  if t = vgl then
  begin                      // enthalten ist
    Result:= Phonebook[i].name;
    break;
  end
  else
  if AnsiEndsText('-0',vgl) then //Zentralen-Rufnummer erkennen
  begin
   if length(vgl) > 2 then
     delete(vgl,length(vgl)-1,2);
//    showmessage(vgl + ' '+t);
   if AnsiStartsText(vgl,t) then
    begin                      // enthalten ist
      Result:= Phonebook[i].name;
      break;
    end;
  end;

 end;
 if (length(Result) > 0) and (Result[1] = '!') then delete(Result,1,1);
end;

procedure ShowNotification(reallyShow: boolean; CallType: string);
begin

if (CallType = 'incoming') then
begin
 Form1.Tray.IconIndex:= 4;
 form1.tray.Tag:= 1;
end;

 if (not sett.ReadBool('FritzBox','NotifyOnlyInTray',false) or ReallyShow)
 and not assigned(CallIN) then
 begin
   Application.CreateForm(TCallIn, CallIn);
   Callin.ShowCall(0,1);
   CallIn.Show;
 end;
end;

procedure TForm1.ReverseLookUp(Call: TCaller);
var reverseAdress  : string;
    CityCode       : string;
    searchstring   : string;
    enabled        : boolean; 
begin
   CityCode      := sett.ReadString('FritzBox','CityCode', '');
   reverseAdress := sett.ReadString('FritzBox','reverse', '');
   enabled       := sett.ReadBool('FritzBox','reverse_enabled', true);

   searchstring := Call.Rufnummer;
   if enabled and (reverseAdress <> '') then
     if (Call.Rufnummer <> '') and (Call.Name = Call.Rufnummer) then
       begin
        if ((searchstring[1] <> '0') and (searchstring[1] <> '+')) then searchstring:= Citycode+searchstring;
        reverseAdress:= AnsiReplaceStr(reverseAdress, '%NUMBER%',searchstring);
        Shellexecute( handle, nil, Pchar(reverseadress), nil, nil, SW_SHOWMaximized);
       end;
end;

Procedure TForm1.SocketMessage(Sender: TObject; Socket: TCustomWinSocket);
var m    : string;
    s    : TStringlist;
    r    : TRegExpr;
    Call : TCaller;
    count: integer;
    f : textfile;
begin
 m:= Socket.ReceiveText;
 r:= TRegExpr.Create;
 r.Expression:= ';';

 if Paramstr(1) = '-debug' then
 begin
  if not fileexists(ExtractFilepath(paramstr(0))+'monitor_messages.txt') then
  begin
    AssignFile(f, ExtractFilepath(paramstr(0))+'monitor_messages.txt');
    rewrite(f);
    Closefile(f);
  end;
  AssignFile(f, ExtractFilepath(paramstr(0))+'monitor_messages.txt');
   append(f);
   Write(f, m);
  CloseFile(f);
 end;
  
if AnsiContainsStr(m,';RING;')  or AnsiContainsStr(m,';DISCONNECT;') or AnsiContainsStr(m,';CALL;')or AnsiContainsStr(m,';CONNECT;')then
 begin
  s:= TStringlist.Create;
  r.Split(m,s);
  //CallIn.Date.Caption:=  s.Strings[0];
 //Eingehende Anrufe: datum;RING;ConnectionID;Anrufer-Nr;Angerufene-Nummer;
  if s.strings[1] = 'RING' then
    begin
      Call.typ        := 'Incoming Call';
      Call.Date       := s.Strings[0];
      Call.ConnID     := s.strings[2];
      Call.Rufnummer  := s.strings[3];
      Call.Name       := FindNames(s.strings[3],1);
      Call.Nebenstelle:= '';
      Call.MSN        := s.strings[4];
      Call.Dauer      := '';
      Call.Start      :=  0;
      if (sett.Readbool('FritzBox','OneMSN',false)=false)
         or
       ( (sett.Readbool('FritzBox','OneMSN',false)=true and (Call.MSN = sett.ReadString('FritzBox','MSN',''))))
      then
      begin
        count:= AddACall(Call);
        if count = 1 then ShowNotification(False, 'incomming');
        if assigned(CallIn) then
          Callin.ShowCall(count - 1,0);
        ReverseLookUp(Call);
      end;
    end
   else
//Ausgehende Anrufe: datum;CALL;ConnectionID;Nebenstelle;GenutzteNummer;AngerufeneNummer;
  if (sett.ReadBool('FritzBox','monout',true) and (s.strings[1] = 'CALL')) then
    begin

      Call.typ        := 'Outgoing Call';
      Call.Date       := s.Strings[0];
      Call.ConnID     := s.strings[2];
      Call.Rufnummer  := s.strings[5];
      Call.Name       := FindNames(s.strings[5],1);
      Call.Nebenstelle:= s.strings[3];
      Call.MSN        := s.strings[4];
      Call.Dauer      := '';
      Call.Start      :=  0;

      if (sett.Readbool('FritzBox','OneMSN',false)= false)
         or
         (sett.Readbool('FritzBox','OneMSN',false)=true and (Call.MSN = sett.ReadString('FritzBox','MSN','')))
      then
      begin
        count := AddACall(Call);
        if Count = 1 then ShowNotification(false, 'outgoing');
        if assigned(CallIn) then
          Callin.ShowCall(count -1,0);
        ReverseLookUp(Call);
      end;
    end
   else
//Ende der Verbindung: datum;DISCONNECT;ConnectionID;dauerInSekunden;
  if (s.strings[1] = 'DISCONNECT') then //  if (s.strings[1] = 'DISCONNECT') and (s.strings[2] = ConnectionID) then CallIn.Hide;
    begin
      Call.Date       := s.Strings[0];
      Call.ConnID     := s.strings[2];
      Call.Dauer      := s.strings[3];;
      count:=  RemoveACall(Call);
      if assigned(CallIn) then 
        if Count > 0 then Callin.ShowCall(0,0);  //den ersten Anruf zeigen, wenn der letzte wegfällt

      if sett.ReadBool('FritzBox','AutoClose',true) and (count = 0)
          then
          begin
            tray.IconIndex:=0;
            tray.Tag:=0;
            if assigned(callIn) then CallIn.close;         //Fenster schließen, wenn alle Anrufe beendet sind
            if sett.ReadBool('FritzBox','LoadListAutomatically',false)
              then ReloadCallerlistClick(ToolButton1); //Liste neuladen
          end;
    end
  else
 //Zustandegekommene Verbindung: datum;CONNECT;ConnectionID;Nebenstelle;Nummer;
  if (s.strings[1] = 'CONNECT') then
   begin
      Hangupbutton.Visible:= false;
      Call.Date       := s.Strings[0];
      Call.ConnID     := s.strings[2];
      Call.Nebenstelle:= s.strings[3];
      Call.Rufnummer     := s.strings[3];
      Call.Start      := getTickCount;
      count := StartAConnection(Call);
      if assigned(callIn) then
        CallIn.ShowCall(count,0);
   end;

  s.free;
 end;
 r.free;
end;

Procedure TForm1.DocData(sender: TObject; Buffer: Pointer; len: integer);
begin
 with sender as THttpCli do
  status.simpletext:= inttostr(RcvdCount) + ' bytes received.';
end;

procedure TForm1.httpget(URL: string; var str: TStringStream);
var Http: THttpCli;
begin
  if BoxAdress = '' then exit;
  tray.IconIndex:= 6;
  tray.tag:= 99;
  Http := THttpCli.Create(nil);
  http.OnDocData := Form1.DocData;
  with Http do
  begin
    Name := 'Http';
    ProxyPort := '80';
    Agent := 'Mozilla/4.0 (compatible; ICS)';
    Accept := 'image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*';
    NoCache := true;
    ContentTypePost := 'application/x-www-form-urlencoded';
    MultiThreaded := False;
    RequestVer := '1.0';
    FollowRelocation := True;
    LocationChangeMaxCount := 5;
    BandwidthLimit := 10000;
    BandwidthSampling := 1000;
    Options := [];
  end;

  http.URL:= URL;
  http.RcvdStream:= TStringStream.Create('');
  try
    http.get;
    http.RcvdStream.Position:= 0;
    str.CopyFrom(http.RcvdStream,http.RcvdStream.size);
  except
   on ESocketError do
     status.SimpleText:= 'Http error. Check your firewall.';
  end;



  http.RcvdStream.free;
  http.RcvdStream:= nil;

  http.Free;
  tray.IconIndex:= 0;
  tray.tag:= 0;
end;

procedure TForm1.httppost(URL,Data: string);
var Http: THttpCli;
begin
  Http := THttpCli.Create(nil);
  http.OnDocData := Form1.DocData;
  tray.IconIndex:= 6;
  tray.tag:= 99;
  with Http do
  begin
    Name := 'Http';
    LocalAddr := BoxAdress;
    ProxyPort := '80';
    Agent := 'Mozilla/4.0 (compatible; ICS)';
    Accept := 'image/gif, image/x-xbitmap, image/jpeg, image/pjpeg, */*';
    NoCache := true;
    ContentTypePost := 'application/x-www-form-urlencoded';
    MultiThreaded := False;
    RequestVer := '1.0';
    FollowRelocation := True;
    LocationChangeMaxCount := 5;
    BandwidthLimit := 10000;
    BandwidthSampling := 1000;
    Options := [];
//    SocksAuthentication := socksNoAuthentication;
  end;

  Http.SendStream := TMemoryStream.Create;
  Http.SendStream.Write(Data[1], Length(Data));
  Http.SendStream.Seek(0, 0);
  Http.RcvdStream := TMemoryStream.Create;
  Http.URL := URL;
  try
    Http.Post;
  except
    on ESocketError do
         status.SimpleText:= 'Http error. Check your firewall.';
  end;

  http.RcvdStream.Free;
  http.RcvdStream:= nil;
  http.Free;
  tray.IconIndex:= 0;
  tray.tag:= 0;
end;

function CheckForPassword: boolean;
var str: TStringStream;
begin
str:= TStringStream.Create('');
form1.httpget('http://'+BoxAdress+'/cgi-bin/webcm?getpage=../html/index.html', str);
str.Position:=0;
if ansicontainstext(str.DataString,'login:command/password')
then
  Result:= true
else
  Result:= false;

str.Free;
end;

procedure GetSessionTraffic(var Tin, Tout:Cardinal);
var
  IfTable: PMIB_IFTABLE;
  dwSize: Cardinal;
  i: Integer;
  index: word;
begin
  IfTable := nil;
  dwSize := 0;
  ZeroMemory(@IfTable, sizeof(IfTable));
  try
    VVGetIfTable(IfTable, dwSize, TRUE);
    if IfTable <> nil then
    begin

    index:= Networkdevice; //form3.device.tag;                     //dwIndex muss vorher festgelegt werden und mit index verglichen werden
     for i := 0 to IfTable.dwNumEntries - 1 do
      begin
           if IfTable.table[i].dwType <> MIB_IF_TYPE_LOOPBACK then
            if iftable.table[i].dwIndex = index then
            begin
              TIn := IfTable.table[i].dwInOctets;
              TOut:= IfTable.table[i].dwOutOctets
            end;
      end;
    end;
  finally
    Freemem(IfTable);
  end;
end;

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
var f: TFileStream;
    c: integer;
begin

  unsaved_phonebook := false;

  PBSelected        := -1;
  PhonebookListe    := Tlistitems.Create(PhonebookList);
  CallerListe       := Tlistitems.Create(CallerList);
  CallbyCall        := TStringList.Create;
  if fileexists(ExtractFilePath(Paramstr(0))+ 'CallbyCall.txt') then
      CallByCall.LoadFromFile(ExtractFilePath(Paramstr(0))+ 'CallbyCall.txt');
      
 if Paramcount > 0 then
  for c:= 0 to Paramcount do
    if ParamStr(c)='-OnlyIncoming' then //zeige in der Anrufliste nur eingehende Gespräche an
    begin
     Toolbutton5.Down         := false;
     Toolbutton5.Enabled      := false;
     Toolbutton5.Indeterminate:= true;
     break;
    end;

  sett:= TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'settings.cfg');

  Timer.Enabled   := sett.ReadBool('Traffic','enabled',false);
  tab1.tabvisible := sett.ReadBool('Traffic','enabled',false);
  if tab1.Visible then
    PageControl1.ActivePage:= tab1
  else
    PageControl1.ActivePage:= tab2;

  NetWorkDevice:= Sett.ReadInteger('Traffic','Device',0);
  BoxAdress    := sett.ReadString('FritzBox','IP','192.168.178.1');

  Application.ShowMainForm:= not sett.Readbool('program','minimized',false); //Mainform nicht anzeigen
  Phonebooklist.Height:= tab3.height - groupbox1.height;
  Form1.Left   := sett.Readinteger('MainForm','left',0);
  Form1.top    := sett.Readinteger('MainForm','top',0);
  Form1.width  := sett.Readinteger('MainForm','width',464);
  Form1.height := sett.Readinteger('MainForm','height',404);

  //Sortiertypen und Spaltenbreiten festlegen
  for c:= 0 to CallerList.Columns.Count-1 do
  begin
   CallerList.Column[c].tag:= 5; //string
   CallerList.Column[c].AutoSize:= false;

   if sett.Readinteger( 'CallList','Col'+inttostr(c),-1) > 0 then
     Callerlist.Column[c].Width:= sett.Readinteger( 'CallList','Col'+inttostr(c),-1);
  end;

  for c:= 0 to phonebooklist.Columns.Count-1 do
  begin
   phonebooklist.Column[c].tag:= 5; //string
   phonebooklist.Column[c].AutoSize:= false; //string
   if sett.Readinteger( 'PhonebookList','Col'+inttostr(c),-1) > 0 then
     Phonebooklist.Column[c].Width:= sett.Readinteger( 'PhonebookList','Col'+inttostr(c),-1);
  end;

  Callerlist.Columns[1].Tag := 3; //Date/time
  phonebooklist.Columns[4].Width:= 0;   //Spalte ausblenden

 if fileexists(ExtractFilePath(ParamStr(0)) + 'traffic.dat') then
    begin
     f:= TFileStream.Create(ExtractFilePath(ParamStr(0)) + 'traffic.dat',fmOpenRead);
      f.Read(TData, sizeof(TData));
     f.Free;
    end
   else
   begin
    TData.TotalIn      := 0;
    TData.TotalOut     := 0;
    TData.todayD       := 0;
    TData.thisweekD    := 0;
    TData.thismonthD   := 0;
    TData.todayU       := 0;
    TData.thisweekU    := 0;
    TData.thismonthU   := 0;
    TData.DateofToday  := now;
    TData.StartofPeriod:= now;
    TData.Price        := 0.0;
    sett.writeDate('Traffic','DateofReset', dateof(now));
    sett.writeinteger('Traffic','lastReset',monthof(now));
    Status.Simpletext  := 'Click on the hammer icon to open the settings window.';
   end;

 TIn      := 0;
 TOut     := 0;
 OffSetIN := 0;                             //Offset bestimmen
 OffSetOUT:= 0;
 GetSessionTraffic(OffsetIN,OffsetOUT);

 edit1.Text:= '0';
 edit2.Text:= '0';
 edit3.Text:= inttostr(TData.TotalIn);
 edit4.Text:= inttostr(TData.TotalOut);

 tab2.tabvisible:= sett.ReadBool('FritzBox','useMonitor',false);
 tab3.tabvisible:= sett.ReadBool('FritzBox','useMonitor',false);
 tab4.tabvisible:= sett.ReadBool('FritzBox','useMonitor',false);

 LoadPhonebookFromFile;
 LoadCallersFromFile();

 if tab1.Visible then
   PageControl1.ActivePageIndex:= 0
 else
 if tab2.Visible then
   PageControl1.ActivePageIndex:= 1;

 PageControl1Change(self);

 MySocket          := TClientSocket.Create(self);
 MySocket.OnError  := SocketErr;
 MySocket.OnConnect:= SocketConn;
 MySocket.OnRead   := SocketMessage;

 try
  if sett.ReadBool('FritzBox','useMonitor',false) then
      StartMySocket; //Fritz!Box Listener started
  startuptimer.Enabled:= true;
 except
  status.SimpleText:= 'Connection Error';
 end;  

end;

procedure TForm1.SaveTrafficData;
var f: TFileStream;
    Tc: TTraffic;
begin
  Tc := TData;
  f:= TFileStream.Create(ExtractFilePath(ParamStr(0)) + 'traffic.dat',fmCreate);
   Tc.TotalIn :=  TData.TotalIn  + TIn-OffsetIN;  //Summe abspeichern
   Tc.TotalOut:=  TData.TotalOut + TOut-OffsetOUT;
   f.Write(Tc, sizeof(Tc));
  f.Free;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var i: integer;
begin
  canclose:= false;
  //mit der neuen lokalen Telefonnummerverwaltung eigentlich unnötig
//  if unsaved_phonebook then AskforUpdate;

  SaveTrafficData;

  sett.WriteInteger( 'MainForm','left'  ,Form1.Left);
  sett.Writeinteger( 'MainForm','top'   ,Form1.top);
  sett.Writeinteger( 'MainForm','width' ,Form1.width);
  sett.Writeinteger( 'MainForm','height',Form1.height);
  for i:= 0 to Callerlist.Columns.Count-1 do
    sett.Writeinteger( 'CallList','Col'+inttostr(i),Callerlist.Column[i].Width);

  for i:= 0 to Phonebooklist.Columns.Count-1 do
    sett.Writeinteger( 'PhonebookList','Col'+inttostr(i),Phonebooklist.Column[i].Width);
    
  sett.UpdateFile;
  canclose:= true;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if telnet.isconnected then telnet.close;
  sett.Free;
  CallByCall.Free;
  MySocket.Free;
//  Phonebookliste.Free;
//  Callerliste.Free;

end;

procedure MakeArrowsBlink(diffIn, DiffOut: longint; threshold: integer);
begin
if form1.tray.Tag = 0 then
with form1 do
  if (diffIN > threshold) and (diffOut > threshold)
    then tray.IconIndex:= 3
  else
  if (diffIN < threshold) and (diffOut > threshold)
    then tray.IconIndex:= 2
  else
  if (diffIN > threshold) and (diffOut < threshold)
    then tray.IconIndex:= 1
  else
  if (diffIN < threshold) and (diffOut < threshold)
    then tray.IconIndex:= 0;
end;

Procedure DoReset;
var f: textfile;
begin
   form1.Status.Simpletext:= 'Resetting statistics ... ';

   assignfile(f,'log.tsv');
   if fileexists('log.tsv')
     then append(f)
     else
     begin
         rewrite(f);
        writeln(f, 'date' +#9+ 'kB in' +#9+ 'kb out' +#9+ 'price');
     end;

   TData.TotalIn :=  TData.TotalIn  + TIn-OffsetIN;  //Summe abspeichern
   TData.TotalOut:=  TData.TotalOut + TOut-OffsetOUT;
   writeln(f, DateTostr(now) + #9 + Format('%.2f',[TData.TotalIn/1024]) + #9 + Format('%.2f',[TData.TotalOut/1024]) +#9 +Format('%.4f',[TData.Price]));
   closefile(f);

   GetSessionTraffic(OffsetIN,OffsetOUT);
   TData.TotalIn  := 0;
   TData.TotalOut := 0;
   TData.Price:= 0;
   TIn        := 0;
   TOut       := 0;

   sett.writeinteger('Traffic','lastReset',monthof(now));
   sett.writeDate('Traffic','DateofReset', dateof(now));
   sett.UpdateFile;
   form1.Status.Simpletext:= 'log file log.tsv updated.'
end;

procedure ResetData;
begin
  if ( (dayof(now) >  sett.ReadInteger('Traffic','PeriodStart',1))
     and
       (monthof(now) > sett.Readinteger('Traffic','lastReset',0))
     )
     then DoReset;
end;

function DaysLeft(start: integer): integer;
var next: TDate;
begin
 if dayof(now) < start then
   next:= EncodeDate(yearof(now),monthof(now),start)
 else
   next:= EncodeDate(yearof(now),monthof(incmonth(now,1)),start);

 Result:= daysbetween(now, next);
end;

procedure TForm1.TimerTimer(Sender: TObject);
var inCurrent, outCurrent: cardinal;
    ULDL, VUnit, PUnit   : byte;
    limitreached         : boolean;
    limit                : cardinal;
    diff                 : Extended;
    AllIn, AllOut        : Real;
    PricePerUnit         : Real;
    PStart               : integer;
begin
  limitreached:= false;
  try
   GetSessionTraffic(TIn,Tout);
  except
   Tin := 0;
   Tout:= 0;
  end;

  inCurrent   := TIn-OffsetIN;
  outCurrent  := TOut-OffsetOUT;

  MakeArrowsBlink(inCurrent-LastIN, outCurrent-LastOut, 25);

  tray.hint:= 'WatchTheBox' +#13#10 +
              Format('in: %.2f kb/s',[(inCurrent-LastIn)/1024])  + #13#10+
              Format('out: %.2f kb/s',[(OutCurrent-LastOut)/1024]);

  if tray.Tag = 2 then
    tray.hint:= tray.hint + #13#10#13#10+'There are missed calls.'
  else
  if tray.Tag = 1 then
    tray.hint:= tray.hint + #13#10#13#10+'There are active calls.';

  LastIN:= inCurrent;
  LastOut:= OutCurrent;

  edit1.text  := Format('%.2f MB', [inCurrent / 1024 / 1024]);
  edit2.text  := Format('%.2f MB', [outCurrent / 1024 / 1024]);

  allIn       := (TData.TotalIn + inCurrent ) / 1024 / 1024; //in MB
  allOut      := (TData.TotalOut+ outCurrent) / 1024 / 1024;

  edit3.text  := Format('%.2f MB', [allIn]);
  edit4.text  := Format('%.2f MB', [allOut]);

  if (allIn=0.0) and (allOut=0.0) then exit;

  uldl        := sett.ReadInteger('Traffic','VolumeMode',0); //0: both, 1: DL, 2: UL
  VUnit       := sett.ReadInteger('Traffic','VolumeUnit',0); //0: MB, 1GB
  PUnit       := sett.ReadInteger('Traffic','PriceUnit',0); //0: MB, 1GB
  limit       := sett.ReadInteger('Traffic','VolumeLimit',0); //in der Einheit VUnit
  PricePerUnit:= sett.ReadFloat('Traffic','Price',0.0);

  if vUnit = 1 then  //in Gigabyte umrechnen
  begin
   allIn  := allIn / 1024;
   allOut := allOut/ 1024;
  end;
  diff:= 0;
  case uldl of
  0: if limit <= allIn + allOut then
      begin limitreached:= true; diff:= allIn  + allOut - limit; end;
  1: if limit <= allIn then
      begin limitreached:= true; diff:= allIn  - limit; end;
  2: if limit <= allOut then
      begin limitreached:= true; diff:= allOut - limit; end;
  end;

  if (not limitreached) and (limit > 0) then
    Gauge1.Progress:= round((AllIn + Allout)*100/limit)
  else
  if (limitreached) and (limit > 0) then
    Gauge1.Progress:= round((AllIn + Allout)*100/limit)
  else
  if limit=0 then Gauge1.Progress:= 0;

    PStart:= sett.ReadInteger('Traffic','PeriodStart',1) +1;
    label1.caption:= 'Days left : ' + inttostr(Daysleft(PStart));

  if limitreached then
  begin
    case PUnit of
    0: //MB
      if VUnit = 0 then //diff ist in MB
        TData.Price:=(diff * PricePerUnit)
      else              //diff ist in GB
        TData.Price:=(diff *1024* PricePerUnit);
    1: //GB
      if VUnit = 0 then //diff ist in MB
        TData.Price:=(diff /1024 * PricePerUnit)
      else              //diff ist in GB
      TData.Price:= (diff * PricePerUnit);
    end;
    if limit > 0 then limitlabel.Caption:= 'Your limit ist reached !';
  end
  else
    limitlabel.caption:= '';

   edtprice.text:= Format('%.4m',[TData.Price]);

   timer.Tag:= timer.tag + 1;
   if (timer.tag = 600) then
   begin
    SaveTrafficData; timer.Tag:= 0;
   end;

   ResetData;

   Case tray.IconIndex of
     4: tray.IconIndex:= 5;
     5: tray.IconIndex:= 4;
   end;
end;

procedure TForm1.TrayMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Tray.Iconindex>3 then
 begin
  case (tray.Tag) of
   1: ShowNotification(true,'none'); //Anruf
   2: begin                   //verpasster Anruf in der Vergangenheit
       Tray.ShowMainForm;
       PageControl1.ActivePageIndex:= 1;
      end;
  end;
  tray.Tag:= 0;
 end
 else
 Tray.ShowMainForm;
end;

procedure DeleteOtherMSN(SL: TStringlist);
var i: integer;
    r: TregExpr;
    s: TStringlist;
    msn: string;
begin
msn := sett.ReadString('FritzBox','MSN', '');
r:= TRegExpr.Create;
r.Expression:= ';';

s:= TStringlist.Create;
 for i:= sl.count-1 downto 0 do
 begin
  s.Clear;
  r.Split(sl.strings[i],s);
  //Format: Typ;Datum;Name;Rufnummer;Nebenstelle;Eigene Rufnummer;Dauer
  if s.count = 7 then
   if not Ansicontainsstr(s.strings[5],msn) then Sl.Delete(i);

 end;
s.free;
r.Free;
end;

procedure TForm1.ParseCallList(s:TStream; filter: TFilterArray; LoadedFromBox: Boolean; Sender: TObject);
var data: string;
    r      : TRegExpr;
    SL, CL : TStringList;
    sla,slb: TStringList;
    OldData: TStringList;
    i,j    : integer;
    sep    : string;
    liItem : TListItem;
    oldcount: integer;
    temp   : string;
    start  : integer;
begin
 Callerliste.Clear;
 SL:= TSTringlist.Create;
 SLa:= TSTringlist.Create;
 SLb:= TSTringlist.Create;
 CL:= TSTringlist.Create;

 s.Position:= 0;
 Data:= (s as TstringStream).ReadString(s.size);
 r:= TRegExpr.Create;
 r.Expression:= #10;
 r.Split(Data,SL);

 //wenn MSN vorgegeben, dann die Einträge mit anderen MSN löschen
 if sett.Readbool('FritzBox','OneMSN',false) then DeleteOtherMSN(SL);

 //daten, die lokal gespeichert sind, aber nicht mehr auf der Box liegen an die Datei anhängen
 if loadedFromBox then
 begin
  OldData:= TStringList.Create;
  if fileexists(ExtractFilePath(ParamStr(0))+'anrufliste.csv') then
       OldData.LoadFromFile(ExtractFilePath(ParamStr(0))+'anrufliste.csv');

 //wenn MSN vorgegeben, dann die anderen MSN löschen
  if sett.Readbool('FritzBox','OneMSN',false) then DeleteOtherMSN(OldData);

  sla.AddStrings(OldData);
  oldcount:= OldData.Count;
  if oldcount > 0 then
  begin
    Olddata.Delete(0); //die Beschreibungszeilen löschen
    Olddata.Delete(0);
  end;
    //die letzten Leerzeichen löschen
    while (SL.strings[sl.count-1]='') do sl.delete(sl.count-1);

    for j:= 0 to olddata.count-1 do
     if (SL.IndexOf(OldData.Strings[j])= -1) then
      SL.Append(OldData.Strings[j]);

  slb.addstrings(sl);
  SL.SaveToFile(ExtractFilePath(ParamStr(0))+'anrufliste.csv'); //speichert dummerweise mit Windowszeilenende
  OldData.Free;
//-----------------------------------------------------------------------------
  //Alles Löschen, was kein einkommender Anruf war -> Alte Liste
  for j:= sla.count-1 downto 0 do
    if (StartsStr('2;', sla.strings[j])=false) then SLa.Delete(j);

  //Alles Löschen, was kein einkommender Anruf war -> neue Liste
   for j:= slb.count-1 downto 0 do
    if (StartsStr('2;', slb.strings[j])=false) then SLb.Delete(j);

   if (sender = nil) then
     if (slb.count > sla.count) then
      begin tray.tag:= 2; tray.iconindex:= 4; end;

 end;
 sla.free;
 slb.free;

 if sl.Count > 1 then
 begin
   sl.Strings[0]:= AnsireplaceStr(sl.strings[0], #13,''); //Windowszeilenende killen
   r.Expression:= 'sep=(.*)';
   if r.Exec(sl.strings[0]) then
   begin
     sep:= r.Replace(sl.strings[0],'$1',true);
     start:= 2;
   end
   else
   begin
     sep:= ';';
     start:= 1;
   end;
   r.Expression:= sep;

   for i:= start to sl.count -1 do
   begin //die zweite Zeile ist die Beschreibungszeile, daher erst beim index 2 beginnen
    sl.Strings[i]:= AnsireplaceStr(sl.strings[i], #13,''); //das leidige Windows_Zeilenende killen
    cl.Clear;
    r.Split(sl.strings[i],cl);
    if cl.Count = 7 then
    //Daten filtern
     if  ((filter[1] and ((strtoint(cl.strings[0]))=1)) //einkommende rufe
       or (filter[2] and ((strtoint(cl.strings[0]))=2)) //verpasste Rufe
       or (filter[3] and ((strtoint(cl.strings[0]))=3)))//abgehende
     then
     begin
      liItem := CallerListe.Add;
      liItem.Caption := '';
      liitem.ImageIndex:= strtoint(cl.strings[0])+1;
      cl.Delete(0);
      cl.Append(inttostr(liitem.ImageIndex));
//      Namen suchen
      if ((cl.strings[1]='') and (cl.strings[2]<>'')) then cl.strings[1]:= findnames(cl.strings[2],0);

      if (length(cl.strings[1]) > 0) then
        if cl.strings[1][1] ='!' then
        begin
          temp:= cl.strings[1];
          delete(temp,1,1);
          cl.strings[1]:= temp;
        end;

      liItem.SubItems:=cl;
      end;
   end;
 end;

SL.Free;
CL.Free;
end;

function isinphonebook(number: string): integer;
var i: integer;
begin
 Result:= -1;
 for i:= 0 to length(phonebook)-1 do
  if (number = phonebook[i].number) then
  begin
    Result:= i;
    break;
  end;
end;

function equal(l: integer; nam, num, sho, van: string): boolean;
begin
 Result:= false;
 if (l > -1) then
 if ((phonebook[l].Name = nam)
    and (phonebook[l].number  = num)
    and (phonebook[l].short   = sho)
    and (phonebook[l].vanity =  van))
    then Result:= True else Result:= false;
end;

function equal_b(l: integer; nam, num, van: string): boolean;
begin
 Result:= false;
 if (l > -1) then
 if ((phonebook[l].Name = nam)
    and (phonebook[l].number  = num)
    and (phonebook[l].vanity =  van))
    then Result:= True else Result:= false;
end;

function ParsePhoneBook(s:TStream): boolean;
var data: string;
    r: TRegExpr;
    SL: TStringList;
    i: integer;
    len, res: integer;
    nnam, nnum, nvan, nshort: string;
begin
 Result:=false;
 s.Position:= 0;

 SL:= TSTringlist.Create;

 Data:= (s as TstringStream).ReadString(s.size);
 r:= TRegExpr.Create;
 r.Expression:= #10;
 r.Split(Data,SL);

 r.Expression:= '.*TrFon\(\"(.*)\", \"(.*)\", \"(.*)\", \"(.*)\"\).*';
 for i:=0 to SL.Count-1 do
  if r.Exec(SL.strings[i]) then
  begin
    Result:= true;

    res   := 0;
    nnam  := r.Replace(SL.strings[i],'$1',true);
    nnum  := r.Replace(SL.strings[i],'$2',true);
    nvan  := r.Replace(SL.strings[i],'$4',true);
    nshort:= r.Replace(SL.strings[i],'$3',true);

    nnam   := AnsireplaceStr(nnam, '&auml;','ä');
    nnam   := AnsireplaceStr(nnam, '&ouml;','ö');
    nnam   := AnsireplaceStr(nnam, '&uuml;','ü');
    nnam   := AnsireplaceStr(nnam, '&Auml;','Ä');
    nnam   := AnsireplaceStr(nnam, '&Ouml;','Ö');
    nnam   := AnsireplaceStr(nnam, '&Uuml;','Ü');
    nnam   := AnsireplaceStr(nnam, '&szlig;','ß');
    nnam   := AnsireplaceStr(nnam, '&eacute;','é');

    //Prüfen ob die Nummer schon existiert
    len:= isinPhoneBook(r.Replace(SL.strings[i],'$2',true));

    if equal(len, nnam, nnum, nshort, nvan) then continue;

    //wenn im Telefonbuch
     if (len > -1) then
        if not PBMessage.CheckBox1.Checked then //wenn letzte Entscheidung
        begin
          PBMessage.FillEntry(len);
          PBMessage.n1.text:= nnam;
          PBMessage.n2.text:= nnum;
          PBMessage.n3.text:= PBMessage.o3.text;
          PBMessage.n4.text:= PBMessage.o4.text;
          res:= PBMessage.ShowModal; //1 alten behalten, 2 Neueintrag an der Stelle
          if res = 2 then
          begin
           nnam:= PBMessage.n1.text;
           nnum:= PBMessage.n2.text;
           nvan:= PBMessage.n4.text;
          end;
        end
        else res:= PBMessage.lastResult;

      // wenn noch nicht im Phonebook, dann eintragen
   if (res <> 1) then
   begin
    //Array um einen Platz verlängern
    if (len = -1) then
    begin
     setlength(Phonebook, length(Phonebook)+1);
     len:= Length(phonebook) -1;
    end;

    Phonebook[len].Name   := nnam;
    Phonebook[len].Number := nnum;
    Phonebook[len].short  := nshort;
    Phonebook[len].vanity := nvan;
    Phonebook[len].No     := len;
   end;
  end;
  PBMessage.CheckBox1.Checked:= false;

 r.Free;
 SL.Free;
end;

function SavePhoneBook(): boolean;
var  f: Tfilestream;
     b: string;
     i: integer;
begin
 f:= TFileStream.Create(ExtractFilepath(Paramstr(0))+'phonebook.csv',fmcreate);
 Result:=false;
 for i:=0 to (Length(phonebook) -1) do
  begin
    b:= Phonebook[i].Name  +';'+ Phonebook[i].Number + ';'
      + Phonebook[i].short +';'+ Phonebook[i].vanity +#13#10;
    f.Write(b[1],length(b));
  end;
 f.free;
end;


procedure TForm1.viewstatsClick(Sender: TObject);
begin
 stats.show;
end;

//löscht unbenutzte Einträge für die Bildanzeige
procedure CheckImageEntries;
var sl     : TStringList;
    i,j    : integer;
    found  : boolean;
    compare: string;
    changes: boolean;
begin
 changes:= false;
 if length(phonebook) = 0 then exit;

 sl:= TStringList.Create;

 sett.ReadSection('Images', sl);
 for i:= 0 to sl.Count-1 do
 begin
  found:= false;

  for j:= 0 to length(phonebook)-1 do
  begin
   compare:= phonebook[j].name;
   if compare[1]='!' then Delete(Compare,1,1);
   if (sl.Strings[i] = compare) then
   begin
    found:= true;
    break;
   end;
  end;

  if not found then
  begin
    sett.DeleteKey('Images',sl.Strings[i]);
    changes:= true;
  end;

 end;
 sl.Free;
 if changes then sett.UpdateFile;
end;

procedure TForm1.FillPhonebook;
var CL: TStringList;
    i: integer;
    liItem: TListItem;
begin
 PhoneBookListe.Clear;
 cl:= TStringlist.Create;

   for i:= 0 to length(Phonebook) -1 do
   begin
      cl.Clear;

      cl.Add(Phonebook[i].Number);
      cl.Add(Phonebook[i].Short);
      cl.Add(Phonebook[i].vanity);
      cl.Add(inttostr(Phonebook[i].no));

      liItem := Phonebookliste.Add;
      liItem.SubItems:=cl;
      liItem.Caption := Phonebook[i].Name;
   end;

 cl.Free;
 PBShortFill;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
case PageControl1.ActivePageIndex of
0:  begin
     Callerlist.PopupMenu:= nil;
     PhoneBookList.PopupMenu:= nil;
    end;
1:  begin
     if tray.tag=2 then tray.tag:=0;
     Callerlist.PopupMenu:= PopupMenu1;
     PhoneBookList.PopupMenu:= nil;
    end;
2:  begin
      Callerlist.PopupMenu:= nil;
      PhoneBookList.PopupMenu:= PopupMenu2;
      if sender = PageControl1 then PbClear.click;
    end;
3:  begin
     Callerlist.PopupMenu:= nil;
     PhoneBookList.PopupMenu:= nil;
    end;
 end;
ToolButton1.Visible :=  (PageControl1.ActivePageIndex = 1);
ToolButton3.Visible :=  (PageControl1.ActivePageIndex = 1);
ToolButton4.Visible :=  (PageControl1.ActivePageIndex = 1);
ToolButton5.Visible :=  (PageControl1.ActivePageIndex = 1);
ToolButton10.Visible:=  (PageControl1.ActivePageIndex = 1);

ToolButton7.Visible :=  (PageControl1.ActivePageIndex = 2);
ToolButton8.Visible :=  (PageControl1.ActivePageIndex = 2);
ToolButton11.Visible:=  (PageControl1.ActivePageIndex = 2);
vcfimport.Visible   :=  (PageControl1.ActivePageIndex = 2);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var number, name: string;
    CityCode    : string;
begin

 if (callerlist.ItemIndex > -1) and (Callerlist.SelCount = 1) then
 begin
    addtoPhonebook.Visible:= true;
    deleteitem.Visible:= true;

    number:=Callerlist.Items[Callerlist.itemindex].SubItems.strings[2];
    name  :=Callerlist.Items[Callerlist.itemindex].SubItems.strings[1];

    filterCbc(number);

    //Vorwahlstring hinzufügen
    if (length(number) > 0) and (number[1] <> '0') and (number[1] <> '+') then
    begin
       CityCode := sett.ReadString('FritzBox','CityCode', '');
       number   := CityCode + number;
    end;

    searchnumber.Tag:=Integer(NewStr(number));
    dial1.Tag       :=Integer(NewStr(number));

    searchnumber.caption:= 'reverse lookup: ' + number;
    dial1.caption         := 'dial: ' + number;
    dial1.visible         := not (number = '');
    searchnumber.Visible  := not (number = '');
    addtoPhonebook.Visible:= (name = '') and (number <> '');
 end
 else
 begin
   searchNumber.Visible:= false;
   addtoPhonebook.Visible:= false;
   deleteitem.Visible:= (callerlist.SelCount > 0);
   dial1.Visible:= false;
 end;


end;

procedure TForm1.PopupMenu2Popup(Sender: TObject);
var number: string;
    name  : string;
    l     : TStringlist;
    index : integer;
    b     : boolean;
begin

 if (Phonebooklist.ItemIndex > -1 ) and (phonebooklist.selcount=1) then
 begin
    pbdelete.Visible:= true;
    index := PhoneBookList.ItemIndex;
    Name  := PhoneBooklist.items[index].Caption;
    if name[1] = '!' then delete(name,1,1);

    number:=Phonebooklist.Items[index].SubItems.strings[0];
    dial2.caption := 'dial: ' + number;
    dial2.visible := not (number ='');

    l:= TStringList.Create;

    sett.ReadSection('Images',l);
    b:= (l.IndexOf(name) <> -1); //checks if name is in picture list

    pbdelpicture.Visible := b;
    pbaddpicture.Visible := not b; 


    l.Free;
    
 end
 else
 begin
   pbdelete.Visible:= (PhoneBookList.SelCount > 0);
   pbaddpicture.Visible:= false;
   pbdelpicture.Visible:= false;
   dial2.Visible:= false;
 end;  

end;

procedure TForm1.pbdeleteClick(Sender: TObject);
var i,j    : integer;
    ident: integer;
    index: integer;
    changes: boolean;
begin
 changes:= false;
 if PhoneBookList.SelCount > 0 then
 for j:= PhoneBookList.Items.Count-1 downto 0 do
  if PhoneBookList.Items.Item[j].Selected then
  begin
//   index:= PhoneBookList.ItemIndex;
   index:= j;
   ident:= strtoint(PhoneBooklist.items[index].SubItems.Strings[3]);
   for i:= length(Phonebook)-1 downto 0 do
    if PhoneBook[i].No = ident then
      begin
        PhoneBook[i] := Phonebook[length(PhoneBook)-1];
        setlength(PhoneBook, length(PhoneBook)-1);
        changes:= true;
        break;
      end;
  end;

  if changes then
  begin
    FillPhoneBook;
    SavePhoneBook; //lokal speichern
    unsaved_phonebook:= true;
    PBClear.click;
  end;
end;

Procedure TForm1.LoadPhonebookFromFile;
var s  : TStringlist;
    r  : TRegExpr;
    sl : TStringList;
    i, l: integer;
begin
   if not fileExists(ExtractFilePath(ParamStr(0))+'phonebook.csv') then exit;

   r:= TRegExpr.create;
   s:= TStringList.Create;
   sl:= TStringList.Create;

   s.LoadFromFile(ExtractFilePath(ParamStr(0))+'phonebook.csv');
   r.Expression:= ';';
   setlength(phonebook, 0);
   for i:=0 to s.count -1 do
    begin
      sl.Clear;
      r.Split(s.Strings[i], sl);
      if sl.count > 0 then
      begin

        l:= length(phonebook);
        setlength(phonebook, l+1);

        Phonebook[l].Name   := sl.strings[0];
        Phonebook[l].Number := sl.strings[1];
        Phonebook[l].short  := sl.strings[2];
        Phonebook[l].vanity := sl.strings[3];
        phonebook[l].important := (sl.strings[0][1]='!');
        Phonebook[l].no := l;
      end;
   end;

 sl.free;
 s.free;
 r.free;

 FillPhoneBook;
end;

Procedure TForm1.LoadCallersFromFile();
var f  : TFileStream;
    str: TStringStream;
    filter: TFilterArray;
begin
   if not fileExists(ExtractFilePath(ParamStr(0))+'anrufliste.csv') then exit;

   filter[1]:= ToolButton3.Down;
   filter[2]:= ToolButton4.Down;
   filter[3]:= ToolButton5.Down;

   f:= TFileStream.Create(ExtractFilePath(ParamStr(0))+'anrufliste.csv',fmOpenRead);
   str:= TStringStream.Create('');
   str.CopyFrom(f,f.Size);
   f.free;

   ParseCallList(str,filter, false, nil);
   str.free;
end;

function TForm1.AskForUpdate: boolean;
begin
  result:= false;
  if MessageDlg('There are unsaved phonebook entries which will be deleted if you continue. Do you want to upload all entries now ?', mtWarning, [mbYes, mbNo], 0)= mrYes
  then
  begin
    UpdatePhonebook;
    Phonebooklist.Enabled:= true;
    Phonebooklist.Cursor:= crDefault;
    result:= true;
  end;
end;


procedure TForm1.ReloadPhonebookClick(Sender: TObject);
var url : string;
    str : TStringStream;
begin
 Phonebooklist.Cursor:= crHourGlass;
 Phonebooklist.Enabled:= false;

 str:= TStringStream.Create('');

 if CheckForPassword then PWForm.showmodal;

 URL:= 'http://'+BoxAdress+'/cgi-bin/webcm?getpage=../html/de/fon/ppFonbuch.html&var:lang=de';
 httpget(URL,str);

 ParsePhonebook(str);
 SavePhonebook; //in einer Datei abspeichern
 FillPhoneBook;
 str.free;

 CheckImageEntries;

 Phonebooklist.Enabled:= true;
 Phonebooklist.Cursor:= crDefault;
end;

procedure DeleteListFritzBox;
var Data: String;
begin
Data:= Data + 'getpage=../html/de/menus/menu2.html&';
         Data:= Data + 'errorpage=../html/de/menus/menu2.html&';
         Data:= Data + 'var:lang=de&';
         Data:= Data + 'var:pagename=foncalls&';
         Data:= Data + 'var:errorpagename=foncalls&';
         Data:= Data + 'var:menu=fon&';
         Data:= Data + 'var:pagemaster=&';
         Data:= Data + 'telcfg:settings/ClearJournal=1&';
         Data:= Data + 'Submit=Submit';

Form1.httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);
end;

procedure TForm1.reloadCallerListClick(Sender: TObject);
var url : string;
    str : TStringStream;
    filter: TFilterArray;
begin
 Callerlist.Cursor:= crHourGlass;
 Callerlist.Enabled:= false;
     str:= TStringStream.Create('');

      if CheckForPassword then PWForm.showmodal;

      URL:= 'http://'+BoxAdress+'/cgi-bin/webcm?getpage=../html/de/menus/menu2.html&var:lang=de&var:menu=fon&var:pagename=foncalls';
      httpget(URL,str);
     str.free;

     str:= TStringStream.Create('');
      URL:= 'http://'+BoxAdress+'/cgi-bin/webcm?getpage=../html/de/FRITZ!Box_Anrufliste.csv';
      httpget(URL,str);
      filter[1]:= ToolButton3.down;
      filter[2]:= ToolButton4.down;
      filter[3]:= ToolButton5.down;
      ParseCallList(str,filter, true, sender);
      callerlist.Tag:= 1;
    str.free;

      //Anrufliste komplett löschen
      if sett.ReadBool('FritzBox','DeleteListAutomatically',false) then
        DeleteListFritzBox;

 Callerlist.Enabled:= true;
 Callerlist.Cursor:= crDefault;
end;

procedure TForm1.PBShortFill;
var i: integer;
    index: integer;
begin
 PBShort.Clear;
 //0 bis 99 auffüllen
 for i:= 0 to 99 do
  if i < 10 then
    Form1.PBShort.Items.Append(Format('0%d',[i]))
    else
    Form1.PBShort.Items.Append(Format('%d',[i]));

 //alle löschen die schon vergeben sind;   
 for i:= 0 to length(Phonebook)-1 do
 begin
    index:= Form1.PBShort.Items.IndexOf(PhoneBook[i].short);
    Form1.PBShort.Items.Delete(index);
 end;

end;

procedure TForm1.PBaddClick(Sender: TObject);
var i: integer;
    namestr: string;
    number: string;
    found: boolean;
    image: string;
begin
  found:= false;
  if PBName.text = '' then exit;

  if PBimportant.Checked then
      NameStr:= '!'+PBName.text
  else
      NameStr:= PBName.text;

  number:= pbnumber.Text;

  for i:= 0 to length(phonebook)-1 do
  begin
    found := (Oldnumber =  Phonebook[i].number);
    if found then break;
  end;

  if not found then
    begin
      i:= length(phonebook);
      setlength(PhoneBook, i+1);
    end;

    PhoneBook[i].Name   := NameStr;
    PhoneBook[i].Number := PBNumber.Text;
    OldNumber:= '';
    if sendtoBox.Checked then
    begin
      PhoneBook[i].vanity := PBVanity.Text;
      PhoneBook[i].Short  := PBShort.Text;
    end
    else
    begin
      PhoneBook[i].vanity := '';
      PhoneBook[i].Short  := '';
    end;

   if found and (OldName <> PBName.text) then
   if sett.ValueExists('Images',OldName) then
   begin
    image:=  sett.ReadString('Images',OldName,'');
    sett.DeleteKey('Images',OldName);
    sett.WriteString('Images',PBname.Text,image);
   end;

   PhoneBook[i].No        := i;
   FillPhonebook;
   Phonebooklist.ItemIndex:= i;
   SavePhonebook;
   unsaved_phonebook      := true;
   PBClear.click;
end;

procedure TForm1.PhonebookListColumnClick(Sender: TObject; Column: TListColumn);
begin
  ColumnToSort := Column.Index;
  if ColumnToSort = LastSorted then
    SortDir := 1 - SortDir
  else
    SortDir := 0;
  LastSorted := ColumnToSort;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TForm1.PhonebookListCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
var
  TempStr, TextToSort1, TextToSort2: String;
begin
//Texte zuweisen
  if ColumnToSort = 0 then
  begin
    TextToSort1 := Item1.Caption;
    TextToSort2 := Item2.Caption;
  end //if ColumnToSort = 0 then
  else
  begin
    TextToSort1 := Item1.SubItems[ColumnToSort - 1];
    TextToSort2 := Item2.SubItems[ColumnToSort - 1];
  end; //if ColumnToSort <> 0 then

//Je nach Sortierrichtung evtl. Texte vertauschen
  if SortDir <> 0 then
  begin
    TempStr := TextToSort1;
    TextToSort1 := TextToSort2;
    TextToSort2 := TempStr;
  end; //if SortDir <> 0 then

//Texte je nach Tag der Spalte unterschiedlich vergleichen
  case (Sender as TListView).Columns[ColumnToSort].Tag of
//Integer-Werte
    1: Compare := StrToInt(TextToSort1)-StrToInt(TextToSort2);
//Float-Werte
    2: begin
      Compare := 0;
      if StrToFloat(TextToSort1) > StrToFloat(TextToSort2) then
        Compare := Trunc(StrToFloat(TextToSort1)-StrToFloat(TextToSort2))+1;
      if StrToFloat(TextToSort1) < StrToFloat(TextToSort2) then
        Compare := Trunc(StrToFloat(TextToSort1)-StrToFloat(TextToSort2))-1;
    end; //2
//DateTime-Werte
    3: begin
      Compare := 0;
      if StrToDateTime(TextToSort1) > StrToDateTime(TextToSort2) then
        Compare := Trunc(StrToDateTime(TextToSort1)-StrToDateTime(TextToSort2))+1;
      if StrToDateTime(TextToSort1) < StrToDateTime(TextToSort2) then
        Compare := Trunc(StrToDateTime(TextToSort1)-StrToDateTime(TextToSort2))-1;
    end; //3
//IPs
    4: begin
      Compare := 0;
      if ntohl(inet_addr(PAnsiChar(TextToSort1))) > ntohl(inet_addr(PAnsiChar(TextToSort2))) then
        Compare := Trunc(ntohl(inet_addr(PAnsiChar(TextToSort1)))-ntohl(inet_addr(PAnsiChar(TextToSort2))))+1;
      if ntohl(inet_addr(PAnsiChar(TextToSort1))) < ntohl(inet_addr(PAnsiChar(TextToSort2))) then
        Compare := Trunc(ntohl(inet_addr(PAnsiChar(TextToSort1)))-ntohl(inet_addr(PAnsiChar(TextToSort2))))-1;
    end; // 4
//Alles andere sind Strings
    else
      Compare := CompareText(TextToSort1,TextToSort2);
  end; //case (Sender as TListView).Columns[ColumnToSort].Tag of
end; //procedure TForm1.ListView1Compare

procedure TForm1.PhoneBookListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var i: integer;
    t: string;
begin
PBselected:= strtoint(Item.SubItems[3]);
T:= item.Caption;
if T[1]='!' then Delete(T,1,1);
PBName.Text:= T;
PBNumber.Text:= item.SubItems[0];
sendtoBox.Checked:= not AnsicontainsStr(pbnumber.text, '-');
sendtobox.Enabled:= not AnsicontainsStr(pbnumber.text, '-');
sendtoBoxClick(nil);
PBVanity.Text:= item.SubItems[2];
PBimportant.checked:= (item.Caption[1] = '!');
sendToBox.checked:= (item.SubItems[1] <> '') ;

PBShortFill;
i:= PBShort.items.Add(item.SubItems[1]);
PBshort.ItemIndex:= i;

PBadd.Caption:= 'change';
OldName:= PBName.Text;
OldNumber:= PBNumber.text;
end;

procedure TForm1.PBClearClick(Sender: TObject);
begin
PBSelected:= -1;
PBName.Text:= '';
PBNumber.Text:= '';
PBVanity.Text:= '';
OldName:= '';
OldNumber:= '';
PBimportant.checked:= false;
PBShortFill;
PBshort.ItemIndex:= 0;
PBadd.Caption:= 'add';
sendtobox.Enabled:= true;
sendtoBoxClick(nil);
end;

procedure TForm1.ToolButton2Click(Sender: TObject);
begin
 form3.show;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
ReloadCallerlistClick(self);    
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
 LoadCallersFromFile();
end;

Procedure TForm1.UpdatePhonebook;
var i, cnt: integer;
    Data : String;
begin
   Form1.Phonebooklist.Cursor:= crHourGlass;
   Form1.Phonebooklist.Enabled:= false;

   if CheckForPassword then PWForm.showmodal;

    //Alles löschen
    Data:= '';
    for i:= 99 downto 0 do
    Data:= Data + 'telcfg:command/HotDialEntry'+inttostr(i)+'=delete'+'&';
    Data:= Data + 'Submit=Submit';
    httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);

    Data:= '';
    cnt:= 0;

    For i:= 0 to length(Phonebook)-1 do
    if (phonebook[i].short <> '') then
    begin
        Data := Data +
               'telcfg:settings/HotDialEntry'+inttostr(cnt)+'/Code=0'  + Phonebook[i].short  + '&' +
               'telcfg:settings/HotDialEntry'+inttostr(cnt)+'/Vanity=' + Phonebook[i].vanity + '&' +
               'telcfg:settings/HotDialEntry'+inttostr(cnt)+'/Number=' + Phonebook[i].Number + '&' +
               'telcfg:settings/HotDialEntry'+inttostr(cnt)+'/Name='   + Phonebook[i].Name   + '&';
       inc(cnt);
    end;

   Data:= Data + 'Submit=Submit';
   httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);
   unsaved_phonebook:= false;
   status.SimpleText:= 'Phonebook update ... ready';

   Form1.Phonebooklist.Cursor:= crDefault;
   Form1.Phonebooklist.Enabled:= true;
end;

procedure TForm1.ToolButton7Click(Sender: TObject);
begin
 UpdatePhonebook;
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
ReloadPhonebook.Click;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
 Shellexecute( handle, nil, Pchar('https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=stefan_fruhner%40web%2ede&item_name=Watch_the_Box&no_shipping=2&no_note=1&tax=0&currency_code=EUR&lc=DE&bn=PP%2dDonationsBF&charset=UTF%2d8'), nil, nil, SW_SHOWMaximized);
end;

procedure TForm1.resetClick(Sender: TObject);
begin
DoReset;
end;

procedure TForm1.WebsiteMouseEnter(Sender: TObject);
begin
website.font.Color:= $005E2413;
end;

procedure TForm1.WebsiteMouseLeave(Sender: TObject);
begin
website.font.Color:= clBlue;
end;

procedure TForm1.WebsiteClick(Sender: TObject);
begin
Shellexecute( handle, nil, Pchar('http://www.mehrsurfen.de'), nil, nil, SW_SHOWMaximized);
end;

Procedure AddEntry(Entry: TPerson);
var Data : String;
    EName: string;
begin
 if entry.important then EName:= '!'+Entry.Name else EName:= Entry.Name;
 Data := 'telcfg:settings/HotDialEntry'+inttostr(Entry.No)+'/Code=0'+ inttostr(Entry.No) + '&' +
         'telcfg:settings/HotDialEntry'+inttostr(Entry.No)+'/Vanity=' + '&' +
         'telcfg:settings/HotDialEntry'+inttostr(Entry.No)+'/Number='+Entry.Number + '&' +
         'telcfg:settings/HotDialEntry'+inttostr(Entry.No)+'/Name='+ EName + '&' +
         'Submit=Submit';

 form1.httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);
end;

Procedure DeleteEntry(Entry: TPerson);
var
    Data : String;
begin
    Data:= 'telcfg:command/HotDialEntry'+inttostr(Entry.No)+'=delete'+'&' +
           'Submit=Submit';
    form1.httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);
end;


procedure TForm1.ToolButton9Click(Sender: TObject);
begin
showmessage('WatchTheBox'
             + #13#10 +
             'This is an early version, so it may be buggy. If your find bug or wish to have some new features, feel free to contact me at www.LeastCosterXP.de > Forum.'
             + #13#10#13#10 +
             'This programm is free for personal use, but comes with no warranty. So you use it at your own risk.'
             + #13#10#13#10 +
             'credits: '
             +#13#10 +
             #9 +'Stefan Grandner '+#9+' : icon art (arrows)'
             +#13#10 +
             #9 +'Stefan Fruhner  '+#9#9+' : programming');
end;

procedure TForm1.searchNumberClick(Sender: TObject);
var reverseAdress  : string;
    SearchString   : string;
begin
 reverseAdress := sett.ReadString('FritzBox','reverse', '');
 if PString(searchnumber.Tag)^ <> '' then
  begin
   searchstring := PString(searchnumber.Tag)^;
   if (searchstring <> '') then
   begin
    reverseAdress:= AnsiReplaceStr(reverseAdress, '%NUMBER%',searchstring);
    Shellexecute( handle, nil, Pchar(reverseadress), nil, nil, SW_SHOWMaximized);
   end;
   DisposeStr(PString(searchnumber.Tag));
  end;
end;

procedure TForm1.addtoPhonebookClick(Sender: TObject);
var index          : integer;
    NumberString   : string;
    CityCode       : string;
begin
  CityCode      := sett.ReadString('FritzBox','CityCode', '');
  if CallerList.ItemIndex > -1 then
  begin
   index        := CallerList.ItemIndex;

   NumberString := Callerlist.items[index].SubItems.Strings[2];

   if ((NumberString[1] <> '0') and (NumberString <> '+')) then NumberString:= Citycode+NumberString;

   PBName.text  := Callerlist.items[index].SubItems.Strings[1];
   PBNumber.text:= numberstring;
   PBVanity.text:= '';
   Pbshort.ItemIndex:=0;
   PBadd.Caption:= 'add';

   PageControl1.ActivePageIndex:= 2;
   PageControl1Change(nil);
  end;

end;

procedure TForm1.pbaddpictureClick(Sender: TObject);
var index          : integer;
    NumberString   : string;
    CityCode       : string;
begin
  CityCode      := sett.ReadString('FritzBox','CityCode', '');
  if PhoneBookList.ItemIndex > -1 then
  begin
   index        := PhoneBookList.ItemIndex;

   NumberString := PhoneBooklist.items[index].Caption;
   if numberstring[1] = '!' then delete(numberstring,1,1);
   
   if ImgDlg.Execute then
   begin
     sett.WriteString('Images', NumberString, ImgDlg.FileName);
     sett.UpdateFile;
   end;

  end;
end;

procedure TForm1.pbdelpictureClick(Sender: TObject);
var index: integer;
    name: string;
begin
//  is shown, when a pic is present
if PhoneBookList.ItemIndex > -1 then
  begin
   index := PhoneBookList.ItemIndex;
   Name  := PhoneBooklist.items[index].Caption;
   if name[1] = '!' then delete(name,1,1);

   sett.DeleteKey('Images',name);
  end;

end;

procedure TForm1.deleteitemClick(Sender: TObject);
var index          : integer;
    DelString      : string;
    DelString1     : string;
    i, j           : integer;
    SL             : TStringlist;
    dellist        : TSTringlist;
begin
 dellist:= TStringList.Create;
 if Callerlist.SelCount > 0 then
  for j := callerlist.Items.count-1 downto 0 do
   if Callerlist.Items.Item[j].Selected then
   begin
    index:= j;

    DelString:= inttostr(CallerList.items[index].ImageIndex-1);
    DelString1:= inttostr(CallerList.items[index].ImageIndex-1);
    for i:= 0 to Callerlist.items[index].SubItems.count-2 do
    begin
      Delstring := DelString + ';'+Callerlist.items[index].SubItems.Strings[i];
      if i = 1 then
        Delstring1 := DelString1 + ';!'+Callerlist.items[index].SubItems.Strings[i]
      else
        Delstring1 := DelString1 + ';'+Callerlist.items[index].SubItems.Strings[i]
    end;

    dellist.Append(Delstring);
    dellist.Append(Delstring1);
 end;

 sl:= TStringlist.Create;
 sl.loadfromfile(ExtractFilePath(ParamStr(0))+'anrufliste.csv');
 for i:= 0 to dellist.Count -1 do
 begin
  if sl.indexof(Dellist.Strings[i]) >-1 then
     sl.Delete(sl.indexof(Dellist.Strings[i]));
 end;

 sl.SaveToFile(ExtractFilePath(ParamStr(0))+'anrufliste.csv');

 LoadCallersFromFile(); //neuladen mit eingestelltem Filter

 sl.free;
 dellist.Free;
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
  DeleteListFritzBox;
end;

function ShortExists(s: string): boolean;
var i: integer;
begin
  for i:= 0 to length(phonebook)-1 do
   if phonebook[i].short = s then begin Result:= true; exit; end;
  Result:= false;
end;

function FindFreeShort(): string;
var i: integer;
    s: string;
begin

Result:= '-1';

for i:= 0 to 99 do
begin

  if i < 10 then s:= '0'+inttostr(i)
  else s:= inttostr(i);

  if not shortexists(s) then begin result:= s; break; end;

end;

end;


procedure TForm1.vcfimportClick(Sender: TObject);
var vcf: TOpenDialog;
    s  : TStringlist;
    i, len  : integer;
    t,tname,number, short, van: string;
    res: integer;
begin
  vcf := TOpenDialog.Create(Self);
  with vcf do
  begin
    Name := 'vcf';
    Filter := 'VCard|*.vcf;*.VCF';
    Title := 'VCard Import';
  end;

  if vcf.Execute then
  begin
   s := TStringlist.create;
   PBMessage.CheckBox1.Checked:= false;

   s.LoadFromFile(vcf.FileName);

   for i:= 0 to s.Count -1 do
   begin
    t:= s.strings[i];
    if (t = 'BEGIN:VCARD') then begin tname:= ''; number:= ''; end
    else
    if (StartsStr('N:',t) or StartsStr('N;',t) or  StartsStr('N:;',t)) then
    begin
      if  StartsStr('N:;',t) then delete(t,1,pos(';', t))
      else
      delete(t,1,pos(':', t));
      tname:= AnsireplaceStr(UTF8Decode(t), ';',',');
    end
    else
    if (StartsStr('TEL:',t) or StartsStr('TEL;',t)) then
    begin
      van:= '';
      delete(t,1,pos(':', t));
      short:= FindFreeShort;
      if short='-1' then short:= '';
      res:= 0;
      len:= isinPhoneBook(number); //eintrag suchen

      if equal_b(len, tname, number, van) then continue;

      //wenn im Telefonbuch
      if (len > -1) then
        if not PBMessage.CheckBox1.Checked then //wenn letzte Entscheidung
        begin
          PBMessage.FillEntry(len);
          PBMessage.n1.text:= tname;
          PBMessage.n2.text:= number;
          PBMessage.n3.text:= PBMessage.o3.text;
          PBMessage.n4.text:= '';
          res:= PBMessage.ShowModal; //1 alten behalten, 2 Neueintrag an der Stelle
          if res=2 then
           begin
            tname:= PBMessage.n1.text;
            number:= PBMessage.n2.text;
            van:= PBMessage.n4.text;
           end;
        end
        else res:= PBMessage.lastResult;

      // wenn noch nicht im Phonebook, dann eintragen
      if (res <> 1) then
      begin
       if len = -1 then //wenn nicht im Array, dann neue Position
        begin
         setlength(Phonebook, length(Phonebook)+1);
         len:= Length(phonebook)-1;
        end;
       ansireplacestr(number,'+','00');
       Phonebook[len].Name   := tname;
       Phonebook[len].Number := number;
       Phonebook[len].short  := short;
       Phonebook[len].vanity := van;
       Phonebook[len].No     := len;

      end;  //der letzten if-bedingung

    end; // if TEL:
   end; //der Schleife
   PBMessage.CheckBox1.Checked:= false;

   s.Free;
   SavePhoneBook;
   FillPhonebook;
  end; //if vcf.execute

  vcf.Free;

end;

procedure TForm1.sendtoBoxClick(Sender: TObject);
begin
PBShort.enabled := sendtobox.checked;
PBVanity.enabled:= sendtobox.checked;
label7.enabled  := sendtobox.checked;
end;

procedure TForm1.wakeupTimer(Sender: TObject);
begin
 wakeup.enabled:= false;
 if sett.ReadBool('FritzBox','useMonitor',false) then
 begin
     StartMySocket; //Fritz!Box Listener started
     telnet.Connect;
 end;
end;

procedure TForm1.ToolButton11Click(Sender: TObject);
begin
searchpanel.Visible:= not searchpanel.Visible;
PhoneBookList.Tag:= 0;
if (searchpanel.Visible) then
begin
 Phonebooklist.Height:= Phonebooklist.height - searchpanel.height;
 PBsearch.SetFocus;
end
else
 Phonebooklist.Height:= tab3.height - groupbox1.height;
end;

procedure TForm1.PBsearchChange(Sender: TObject);
var
  i: Integer;
  lTemp: String;
  stext: string;
  lItem: TListItem;
begin
  if PhoneBookList.Items.Count=0 then exit;

  lTemp := AnsiUpperCase(PBsearch.Text);

  if ((sender = PBSearch) or (PhoneBooklist.Tag+1 > PhoneBookList.Items.Count-1))
   then PhoneBookList.Tag:= -1;

  for i := PhoneBooklist.Tag+1 to PhoneBookList.Items.Count-1 do
  begin
    lItem := PhoneBookList.Items[i];
    if sname.Checked then stext:= lItem.Caption else stext:= lItem.SubItems.Text;
    if Pos(lTemp, AnsiUpperCase(stext)) <> 0 then
    begin
     PhoneBookList.HideSelection := true;
     PhoneBookList.Selected := lItem;
     Phonebooklist.Tag:= i; //speichern welches Ergebnis zuletzt gefunden wurde
     lItem.MakeVisible(false);
     exit;
    end;
  end;
PhoneBookList.Tag:= -1;
end;

procedure TForm1.PBsearchChangeBackwards;
var
  i: Integer;
  lTemp: String;
  stext: string;
  lItem: TListItem;
begin
  if PhoneBookList.Items.Count=0 then exit;

  lTemp := AnsiUpperCase(PBsearch.Text);

  if (PhoneBooklist.Tag-1 < 0)
   then PhoneBookList.Tag:= PhoneBookList.Items.Count-1;

  for i := PhoneBookList.Tag-1 downto 0 do
  begin
    lItem := PhoneBookList.Items[i];
    if sname.Checked then stext:= lItem.Caption else stext:= lItem.SubItems.Text;
    if Pos(lTemp, AnsiUpperCase(stext)) <> 0 then
    begin
     PhoneBookList.HideSelection := true;
     PhoneBookList.Selected := lItem;
     Phonebooklist.Tag:= i; //speichern welches Ergebnis zuletzt gefunden wurde
     lItem.MakeVisible(false);
     exit;
    end;
  end;
PhoneBookList.Tag:= PhoneBookList.Items.Count-1;
end;


procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

//STRG-F
if (not ToolButton11.Down) and (ssCTRL in Shift) and (Key=70) then
begin
  ToolButton11.Click;
  ToolButton11.Down:= true;
end
else
//UMSCHALT-F3
if searchpanel.visible and (key = 114)and (ssSHIFT in Shift) {F3} then
  PBsearchChangeBackWards
else
//F3
if searchpanel.visible and (key = 114) {F3} then
  PBsearchChange(sender);

end;

//wählt eine Nummer auf der Fritz Box
//Port: (bei 7170)
//1: Fon 1
//2: Fon 2
//3: Fon 3
//50: ISDN
procedure DialNumberFritzBox(Number, Port:string);
var Data: String;
begin
//<input type="hidden" name="var:showsetup" value="0" id="uiPostKonfig">
//<input type="hidden" name="var:TestPort" value="" id="uiTestPort">
//<input type="hidden" name="telcfg:settings/UseClickToDial" value="1" id="uiPostClickToDial" disabled>
//<input type="hidden" name="telcfg:settings/DialPort" value="1" id="uiPostDialPort" disabled>
//<input type="hidden" name="telcfg:command/Dial" value="" id="uiPostDial" disabled>
//<input type="hidden" name="telcfg:command/Hangup" value="" id="uiPostHangup" disabled>

 Data:= 'telcfg:settings/UseClickToDial=1&';
 Data:= Data + 'telcfg:settings/DialPort='+Port+'&';
 Data:= Data + 'telcfg:command/Dial='+Number+'&';
 Data:= Data + 'Submit=Submit';

Form1.httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);

//if (MessageDlg('Dialing in progress ... Click the button to hang up ?', mtInformation, [mbAbort], 0) in [mrAbort, mrNone]) then
//begin
//
//end;

end;

procedure TForm1.HangUpFritzBox();
var Data: String;
begin
 Data:= 'telcfg:settings/UseClickToDial=1&';
 Data:= Data + 'telcfg:settings/DialPort=1&';
 Data:= Data + 'telcfg:command/Hangup=2&';
 Data:= Data + 'Submit=Submit';

 Form1.httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);
 status.SimpleText   := 'Dialing cancelled.';
 hangupbutton.Visible:= false;
end;


procedure TForm1.Fon11Click(Sender: TObject);
var number: string;
    index : integer;
    Port  : string;
begin

 case ((sender as TMenuItem).tag) of
  1: Port := 'Fon 1';
  2: Port := 'Fon 2';
  3: Port := 'Fon 3';
  50:Port := 'S0';
 end;

 hangupbutton.Visible:= true;
 index               := CallerList.ItemIndex;
 Number              := Callerlist.items[index].SubItems.Strings[2];
 DialNumberFritzBox(number, inttostr((sender as TMenuItem).tag));
 status.SimpleText   := 'Dialing '+ number + ' ('+Port+')';
end;

procedure TForm1.HangupbuttonClick(Sender: TObject);
begin
 HangUpFritzBox;
end;

procedure TForm1.Fon12Click(Sender: TObject);
var number: string;
    index : integer;
    Port  : string;
begin

 case ((sender as TMenuItem).tag) of
  1: Port := 'Fon 1';
  2: Port := 'Fon 2';
  3: Port := 'Fon 3';
  50:Port := 'S0';
 end;

 hangupbutton.Visible:= true;
 index               := PhonebookList.ItemIndex;
 Number              := Phonebooklist.items[index].SubItems.Strings[0];
 DialNumberFritzBox(number, inttostr((sender as TMenuItem).tag));
 status.SimpleText   := 'Dialing '+ number + ' ('+Port+')';
end;

procedure TForm1.Button2Click(Sender: TObject);
var c: string;
begin
try
 c:= 'echo 7,2 >/var/led';
 telnet.SendStr(c+#10);
 telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'sending: '+c);
except
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'error');
end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var c: string;
begin
try
 c:= 'echo 7,1 >/var/led';
 telnet.SendStr(c+#10);
 telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'sending: '+c);
except
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'error');
end;
end;

procedure TForm1.telnetSessionConnected(Sender: TTnCnx; Error: Word);
begin
if error = 0 then
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'Session connected')
else
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'Session could not connect ('+inttostr(error)+')');

if error = 10061 then //telnet not active 
 begin
  label5.caption:='Telnet: inactive';
 end
else
 begin
  label5.caption:='Telnet: active';
 end
end;

procedure TForm1.telnetDisplay(Sender: TTnCnx; Str: string);
begin
telnetlog.Lines.Add(DateTimetoStr(now) + #9 + str);
end;

procedure TForm1.restarttelefonClick(Sender: TObject);
var c: string;
begin
StopMySocket;
setlength(ActiveCalls, 0); //alle aktiven Gesrpäche werden jetzt beendet
try //Fehler fangen
  c:= 'killall telefon';
  telnet.SendStr(c+#10);  //Telefondienst killen (beendet ALLE laufenden Gespraeche)
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'sending: '+c);
  c:= 'telefon a127.0.0.1';
  telnet.SendStr(c+#10);          //Telefondienst neu starten
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'sending: '+c);
  c:= 'echo 14,1 >/var/led'+#10+'echo 13,1 >/var/led';
  telnet.SendStr(c+#10);          //TelefonLEDs ausschalten
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'sending: '+c);


except
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'error');
end;
if assigned(CallIn) then CallIn.Close;  //Benachrichtigungsfenster schließen
WaitForReconnect.Enabled:= true;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
//Dsl-Daemon stoppen (alle Internet-Verbindungen werden getrennt
//2s warten
//dsld neu starten > Reconnect
try
  telnet.sendstr('dsld -s' +#10+'sleep 2'+#10+'dsld'+#10);
except
  telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'error');
end;
end;

procedure TForm1.telnetSendLoc(Sender: TObject);
begin
telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'send');
end;

procedure TForm1.telnetSessionClosed(Sender: TTnCnx; Error: Word);
begin
telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'Session closed ('+inttostr(error)+')');
end;

procedure TForm1.telnetDataAvailable(Sender: TTnCnx; Buffer: Pointer;
  Len: Integer);
var
  lString:String;
  aus    : string;
begin
  SetLength(lString,Len);
  Move(Buffer^,lString[1],Len);
  aus:=aus+lString;
  TelnetLog.lines.Add(aus);

  if ansicontainsstr(aus, 'password') then //telnet.SendStr(pw+#10);
   begin
    PWForm.Tag:= 1;
    try
    PWForm.showmodal
    except
      telnetlog.Lines.Add(DateTimetoStr(now) + #9 + 'error');
    end;
   end;


end;

procedure TForm1.StartupTimerTimer(Sender: TObject);
begin
 StartupTimer.Enabled:= false;

 //Telnet verbinden
 telnet.Host:= 'fritz.box';
 telnet.Port:= '23';
 try
  if sett.ReadBool('FritzBox','useMonitor',false) then
   telnet.Connect;
 except
  status.SimpleText:= 'Connection refused. Check your firewall.';
 end;

 //Anrufliste laden
 if sett.ReadBool('FritzBox','LoadListAutomatically',false)
  then
  try
    ReloadCallerlistClick(nil);
  except LoadCallersFromFile(); end;

end;

procedure TForm1.WaitForReconnectTimer(Sender: TObject);
begin
WaitForReconnect.Enabled:= false;
StartMySocket;
end;



procedure TForm1.PBNumberKeyPress(Sender: TObject; var Key: Char);
begin
sendtoBox.Checked:= not AnsicontainsStr(pbnumber.text, '-');
sendtobox.Enabled:= not AnsicontainsStr(pbnumber.text, '-');
sendtoBoxClick(nil);

if not (Key in ['0'..'9','-', Char(VK_BACK)]) then
  Key := #0;


end;

end.
