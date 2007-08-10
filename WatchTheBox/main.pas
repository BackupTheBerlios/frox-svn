unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  IpHlpApi,IpIfConst,IpRtrMib,ipFunctions,iptypes, ExtCtrls, StrUtils,
  scktcomp, CoolTrayIcon, ComCtrls, Buttons, inifiles, HttpProt, Menus, ImgList,
  Gauges, BomeOneInstance, ToolWin;

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

  TForm1 = class(TForm)
    Timer: TTimer;
    Tray: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    searchNumber: TMenuItem;
    PopupMenu2: TPopupMenu;
    Eintraglschen1: TMenuItem;
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
    PhoneBookList: TListView;
    PBName: TEdit;
    PBNumber: TEdit;
    PBadd: TButton;
    PBimportant: TCheckBox;
    PBVanity: TEdit;
    PBClear: TButton;
    ImageList1: TImageList;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ImageList2: TImageList;
    ToolButton2: TToolButton;
    Status: TStatusBar;
    error: TLabel;
    PBShort: TComboBox;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
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
    addpicture: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    deleteitem: TMenuItem;
    ToolButton10: TToolButton;
    procedure ToolButton10Click(Sender: TObject);
    procedure deleteitemClick(Sender: TObject);
    procedure addpictureClick(Sender: TObject);
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
    procedure PhoneBookListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure PBaddClick(Sender: TObject);
    procedure reloadCallerListClick(Sender: TObject);
    Procedure LoadPhonebookFromFile;
    Procedure LoadCallersFromFile(filter: integer);
    procedure ReloadPhonebookClick(Sender: TObject);
    procedure Eintraglschen1Click(Sender: TObject);
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
    Procedure ParseCallList(s:TStream; filterindex: integer; LoadedFromBox: Boolean;Sender: TObject);
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

implementation
uses RegExpr, Unit2, statistics, settings, DateUtils, shellapi, tools, password,
     CallManagement;

{$R arrows.res}

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
 MySocket.Open;
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
    SocketConnect.enabled:= true;
    ErrorCode:= 0;
 end;
end;

procedure TForm1.StopMySocket;
begin
 if SocketConnected then MySocket.Close;
end;

function findnames(number: string): string;
var i: integer;
begin
 Result:= number;
 for i:= 0 to length(PhoneBook)-1 do
  if PhoneBook[i].number = number then
  begin
    Result:= Phonebook[i].name;
    if Result[1] = '!' then delete(Result,1,1);
    break;
  end;
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
   Callin.ShowCall(0);
   CallIn.Show;
 end;
end;

procedure TForm1.ReverseLookUp(Call: TCaller);
var reverseAdress  : string;
    CityCode       : string;
    searchstring   : string;
begin
   CityCode      := sett.ReadString('FritzBox','CityCode', '');
   reverseAdress := sett.ReadString('FritzBox','reverse', '');

   searchstring := Call.Rufnummer;
   if reverseAdress <> '' then
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
begin
 m:= Socket.ReceiveText;
 r:= TRegExpr.Create;
 r.Expression:= ';';
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
      Call.Name       := FindNames(s.strings[3]);
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
          Callin.ShowCall(count - 1);
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
      Call.Name       := FindNames(s.strings[5]);
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
          Callin.ShowCall(count -1);
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
        if Count > 0 then Callin.ShowCall(0);  //den ersten Anruf zeigen, wenn der letzte wegfällt

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
      Call.Date       := s.Strings[0];
      Call.ConnID     := s.strings[2];
      Call.Nebenstelle:= s.strings[3];
      Call.Rufnummer     := s.strings[3];
      Call.Start      := getTickCount;
      count := StartAConnection(Call);
      if assigned(callIn) then
        CallIn.ShowCall(count);
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
  http.get;

  http.RcvdStream.Position:= 0;
  str.CopyFrom(http.RcvdStream,http.RcvdStream.size);

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
  Http.Post;

  http.RcvdStream.Free;
  http.RcvdStream:= nil;
  http.Free;
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
begin

  unsaved_phonebook := false;
  PBSelected        := -1;
  PhonebookListe    := Tlistitems.Create(PhonebookList);
  CallerListe       := Tlistitems.Create(CallerList);

  sett:= TMemIniFile.Create(ExtractFilePath(ParamStr(0)) + 'settings.cfg');

  Timer.Enabled   := sett.ReadBool('Traffic','enabled',false);
  tab1.tabvisible := sett.ReadBool('Traffic','enabled',false);

  NetWorkDevice:= Sett.ReadInteger('Traffic','Device',0);
  BoxAdress    := sett.ReadString('FritzBox','IP','192.168.178.1');

  Application.ShowMainForm:= not sett.Readbool('program','minimized',false); //Mainform nicht anzeigen

  Form1.Left   := sett.Readinteger('MainForm','left',0);
  Form1.top    := sett.Readinteger('MainForm','top',0);
  Form1.width  := sett.Readinteger('MainForm','width',464);
  Form1.height := sett.Readinteger('MainForm','height',404);

 if fileexists(ExtractFilePath(ParamStr(0)) + 'traffic.dat') then
    begin
     f:= TFileStream.Create(ExtractFilePath(ParamStr(0)) + 'traffic.dat',fmOpenRead);
      f.Read(TData, sizeof(TData));
     f.Free;
    end
   else
   begin
    TData.TotalIn          := 0;
    TData.TotalOut         := 0;
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

 LoadCallersFromFile(0);
 LoadPhonebookFromFile;
 if sett.ReadBool('FritzBox','LoadListAutomatically',false)
  then
  try
    ReloadCallerlistClick(nil);
  except end;

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

 if sett.ReadBool('FritzBox','useMonitor',false) then
     StartMySocket; //Fritz!Box Listener started
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
begin
  canclose:= false;
  if unsaved_phonebook then AskforUpdate;

  SaveTrafficData;

  sett.WriteInteger( 'MainForm','left'  ,Form1.Left);
  sett.Writeinteger( 'MainForm','top'   ,Form1.top);
  sett.Writeinteger( 'MainForm','width' ,Form1.width);
  sett.Writeinteger( 'MainForm','height',Form1.height);
  sett.UpdateFile;
  canclose:= true;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sett.Free;
  Phonebookliste.Free;
  Callerliste.Free;
  MySocket.Free;
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

procedure TForm1.ParseCallList(s:TStream; filterindex: integer; LoadedFromBox: Boolean; Sender: TObject);
var data: string;
    r      : TRegExpr;
    SL, CL : TStringList;
    sla,slb: TStringList;
    OldData: TStringList;
    i,j    : integer;
    sep    : string;
    liItem : TListItem;
    oldcount: integer;
    newcount: integer;
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

 //wenn MSN vorgegeben, dann die anderen MSN löschen
 if sett.Readbool('FritzBox','OneMSN',false) then DeleteOtherMSN(SL);
// oldcount:= sl.count; //merken wie viele Einträge

 //daten, die lokal gespeichert sind, aber nicht mehr auf der Box liegen an die Datei anhängen
 if loadedFromBox then
 begin
  OldData:= TStringList.Create;
  if fileexists('anrufliste.csv') then
       OldData.LoadFromFile('anrufliste.csv');

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
  SL.SaveToFile('anrufliste.csv'); //speichert dumerweise mit Windowszeilenende
  OldData.Free;
//-----------------------------------------------------------------------------
  //Alles Löschen, was kein einkommender Anruf war -> Alte Liste
  for j:= sla.count-1 downto 0 do
    if (StartsStr('2;', sla.strings[j])=false) then SLa.Delete(j);

  //Alles Löschen, was kein einkommender Anruf war -> neue Liste
   for j:= slb.count-1 downto 0 do
    if (StartsStr('2;', slb.strings[j])=false) then SLb.Delete(j);

   newcount:= Sl.Count;
   if (sender = nil) then
   begin
     if (slb.count > sla.count)
     //(((sla.count > 0) and ) //wenn Datei schon existiert
//      or  ((oldcount = 0) and (newcount > 2)))  //wenn noch keine Datei existiert
      then
      begin tray.tag:= 2; tray.iconindex:= 4; end;
   end;
 end;
 sla.free;
 slb.free;
//-----------------------------------------------------------------------------
//   Tray blinken lassen, wenn neuer Anruf
//   showmessage(sl.strings[3]);
//   newcount:= Sl.Count;
//   if (sender = nil) then
//   begin
//     if ( ((oldcount > 0) and (newcount > oldcount)) //wenn Datei schon existiert
//      or  ((oldcount = 0) and (newcount > 2)))  //wenn noch keine Datei existiert
//      then
//      begin tray.tag:= 2; tray.iconindex:= 4; end;
//   end;
// end;

 //-----------------------------------------------------------------------------
//  if loadedFromBox then
// begin
//  OldData:= TStringList.Create;
//  if fileexists('anrufliste.csv') then
//       OldData.LoadFromFile('anrufliste.csv');
//
//  oldcount:= OldData.Count;
//  if oldcount > 0 then
//  begin
//    Olddata.Delete(0); //die Beschreibungszeilen löschen
//    Olddata.Delete(0);
//  end;
//    //die letzten Leerzeichen löschen
//    while (SL.strings[sl.count-1]='') do sl.delete(sl.count-1);
//
//    for j:= 0 to olddata.count-1 do
//     if (SL.IndexOf(OldData.Strings[j])= -1) then
//      SL.Append(OldData.Strings[j]);
//
//  SL.SaveToFile('anrufliste.csv'); //speichert dumerweise mit Windowszeilenende
//  OldData.Free;
//
////   Tray blinken lassen, wenn neuer Anruf
//   showmessage(sl.strings[3]);
//   newcount:= Sl.Count;
//   if (sender = nil) then
//   begin
//     if ( ((oldcount > 0) and (newcount > oldcount)) //wenn Datei schon existiert
//      or  ((oldcount = 0) and (newcount > 2)))  //wenn noch keine Datei existiert
//      then
//      begin tray.tag:= 2; tray.iconindex:= 4; end;
//   end;
// end;

 if sl.Count > 2 then
 begin
   sl.Strings[0]:= AnsireplaceStr(sl.strings[0], #13,''); //Windowszeilenende killen
   r.Expression:= 'sep=(.*)';
   sep:= r.Replace(sl.strings[0],'$1',true);
   r.Expression:= sep;

   for i:= 2 to sl.count -1 do
   begin //die zweite Zeile ist die Beschreibungszeile, daher erst beim index 2 beginnen
    sl.Strings[i]:= AnsireplaceStr(sl.strings[i], #13,''); //das leidige Windows_Zeilenende killen
    cl.Clear;
    r.Split(sl.strings[i],cl);
    if cl.Count = 7 then
     if ((filterindex= 0) or (filterindex>4) or (strtoint(cl.strings[0])+1 = filterindex)) then //filtern
     begin
      liItem := CallerListe.Add;
      liItem.Caption := '';
      liitem.ImageIndex:= strtoint(cl.strings[0])+1;
      cl.Delete(0);
      cl.Append(inttostr(liitem.ImageIndex));
      liItem.SubItems:=cl;
      end;
   end;
   ToolButton3.Tag:= filterindex;
 end;

SL.Free;
CL.Free;
end;

function isinphonebook(number: string): integer;
var i: integer;
begin

 for i:= 0 to length(phonebook)-1 do
 begin
  if (number = phonebook[i].number) then
  begin
    Result:= i;
    exit;
  end;
 end;

 Result:= -1;
end;

function ParsePhoneBook(s:TStream): boolean;
var data: string;
    r: TRegExpr;
    SL: TStringList;
    i: integer;
    len: integer;
begin
 Result:=false;
 s.Position:= 0;

 SL:= TSTringlist.Create;

 Data:= (s as TstringStream).ReadString(s.size);
 r:= TRegExpr.Create;
 r.Expression:= #10;
 r.Split(Data,SL);

 r.Expression:= '.*TrFon\(\"(.*)\", \"(.*)\", \"(.*)\", \"(.*)\"\).*';
 //setlength(Phonebook, 0);
 for i:=0 to SL.Count-1 do
  if r.Exec(SL.strings[i]) then
  begin
    Result:= true;
    //Prüfen ob die Nummer schon existiert
    len:= isinPhoneBook(r.Replace(SL.strings[i],'$2',true));
    
    if (len = -1) then
    begin
     setlength(Phonebook, length(Phonebook)+1);
     len:= Length(phonebook) -1;
    end;
    
    Phonebook[len].Name   := r.Replace(SL.strings[i],'$1',true);
    Phonebook[len].Number := r.Replace(SL.strings[i],'$2',true);
    Phonebook[len].short  := r.Replace(SL.strings[i],'$3',true);
    Phonebook[len].vanity := r.Replace(SL.strings[i],'$4',true);
    Phonebook[len].No     := len;

    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&auml;','ä');
    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&ouml;','ö');
    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&uuml;','ü');
    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&Auml;','Ä');
    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&Ouml;','Ö');
    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&Uuml;','Ü');
    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&szlig;','ß');
  end;

//   setlength(Phonebook, 0);
// for i:=0 to SL.Count-1 do
//  if r.Exec(SL.strings[i]) then
//  begin
//    Result:= true;
//    setlength(Phonebook, length(Phonebook)+1);
//    len:= Length(phonebook) -1;
//    Phonebook[len].Name   := r.Replace(SL.strings[i],'$1',true);
//    Phonebook[len].Number := r.Replace(SL.strings[i],'$2',true);
//    Phonebook[len].short  := r.Replace(SL.strings[i],'$3',true);
//    Phonebook[len].vanity := r.Replace(SL.strings[i],'$4',true);
//    Phonebook[len].No     := len;
//
//    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&auml;','ä');
//    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&ouml;','ö');
//    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&uuml;','ü');
//    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&Auml;','Ä');
//    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&Ouml;','Ö');
//    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&Uuml;','Ü');
//    Phonebook[len].Name   := AnsireplaceStr(Phonebook[len].Name, '&szlig;','ß');
//  end;


 r.Free;
 SL.Free;
end;

function SavePhoneBook(): boolean;
var  f: Tfilestream;
     b: string;
     i: integer;
begin

 f:= TFileStream.Create('phonebook.csv',fmcreate);
//      Name     : string;
//      Number   : string;
//      short    : string;
//      vanity   : string;
//      No       : integer;
//      important: boolean;

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
 end;
ToolButton1.Visible:=  (PageControl1.ActivePageIndex = 1);
ToolButton3.Visible:=  (PageControl1.ActivePageIndex = 1);
ToolButton4.Visible:=  (PageControl1.ActivePageIndex = 1);
ToolButton5.Visible:=  (PageControl1.ActivePageIndex = 1);
ToolButton6.Visible:=  (PageControl1.ActivePageIndex = 1);
ToolButton7.Visible:=  (PageControl1.ActivePageIndex = 2);
ToolButton8.Visible:=  (PageControl1.ActivePageIndex = 2);
ToolButton10.Visible:=  (PageControl1.ActivePageIndex = 1);
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
var number: string;
begin
 if callerlist.ItemIndex > -1 then
 begin
    number:=Callerlist.Items[Callerlist.itemindex].SubItems.strings[2];
{    if length(number) <= 8 then number := '030' + number;
    searchnumber.caption:= 'reverse lookup: ' + number;}
 end;
// searchNumber.visible:= (callerlist.ItemIndex > -1)
end;

procedure TForm1.Eintraglschen1Click(Sender: TObject);
var i    : integer;
    ident: integer;
    index: integer;
begin
 if PhoneBookList.ItemIndex > -1 then
  begin
   index:= PhoneBookList.ItemIndex;
   ident:= strtoint(PhoneBooklist.items[index].SubItems.Strings[3]);
   for i:= length(Phonebook)-1 downto 0 do
    if PhoneBook[i].No = ident then
      begin
        PhoneBook[i] := Phonebook[length(PhoneBook)-1];
        setlength(PhoneBook, length(PhoneBook)-1);
        FillPhoneBook;
        SavePhoneBook; //lokal speichern
        unsaved_phonebook:= true;
        break;
      end;
  end;
end;

Procedure TForm1.LoadPhonebookFromFile;
var s  : TStringlist;
    r  : TRegExpr;
    sl : TStringList;
    i, l: integer;
begin
   if not fileExists('phonebook.csv') then exit;

   r:= TRegExpr.create;
   s:= TStringList.Create;
   sl:= TStringList.Create;

   s.LoadFromFile('phonebook.csv');
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
        phonebook[l].important := (sl[0][1]='!');
        Phonebook[l].no := l;
      end;
   end;

 sl.free;
 s.free;
 r.free;

 FillPhoneBook;
end;

Procedure TForm1.LoadCallersFromFile(filter: integer);
var f  : TFileStream;
    str: TStringStream;
begin
   if not fileExists('anrufliste.csv') then exit;

   f:= TFileStream.Create('anrufliste.csv',fmOpenRead);
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

//nicht mehr notwendig, da die Daten für eine Rufnummer nicht mehr überschrieben werden
//  if unsaved_phonebook then
//    if AskforUpdate then exit;

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
      ParseCallList(str,0, true, sender);
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
 for i:= 0 to 99 do
  if i < 10 then
    Form1.PBShort.Items.Append(Format('0%d',[i]))
    else
    Form1.PBShort.Items.Append(Format('%d',[i]));

 for i:= 0 to length(Phonebook)-1 do
 begin
    index:= Form1.PBShort.Items.IndexOf(PhoneBook[i].short);
    Form1.PBShort.Items.Delete(index);
 end;

end;

procedure TForm1.PBaddClick(Sender: TObject);
var i: integer;
    ok: boolean;
    namestr: string;
begin
  if PBName.text = '' then exit;
  
  ok:= true;
  if PBimportant.Checked then
      NameStr:= '!'+PBName.text
  else
      NameStr:= PBName.text;

  if (PBSelected = -1) then
  begin
   for i:= 0 to Phonebookliste.Count-1 do
   if NameStr = Phonebook[i].Name then
      begin //wenn schon in der Liste
        ok:= false;
        error.Caption:= 'Name already exists !';
        break;
      end;
  end
  else i:= PBSelected;

   if i > length(Phonebook)-1 then
   begin
    i:= length(Phonebook);
    setlength(PhoneBook, i+1);
   end;

   if ok then
   begin
     PhoneBook[i].Name   := NameStr;
     PhoneBook[i].Number := PBNumber.Text;
     PhoneBook[i].vanity := PBVanity.Text;
     PhoneBook[i].Short  := PBShort.Text;
     PhoneBook[i].No     := i;
     FillPhonebook;
     Phonebooklist.ItemIndex:= i;
     SavePhonebook;
     unsaved_phonebook:= true;
   end;
end;

procedure TForm1.PhoneBookListSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
var i: integer;
begin
PBselected:= strtoint(Item.SubItems[3]);
PBName.Text:= item.Caption;
PBNumber.Text:= item.SubItems[0];
PBVanity.Text:= item.SubItems[2];
PBimportant.checked:= (item.Caption[1] = '!');

PBShortFill;
i:= PBShort.items.Add(item.SubItems[1]);
PBshort.ItemIndex:= i;

PBadd.Caption:= 'change';
end;

procedure TForm1.PBClearClick(Sender: TObject);
begin
PBSelected:= -1;
PBName.Text:= '';
PBNumber.Text:= '';
PBVanity.Text:= '';
PBimportant.checked:= false;
PBShortFill;
PBshort.ItemIndex:= 0;
PBadd.Caption:= 'add';
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
 LoadCallersFromFile((sender as TToolButton).ImageIndex);
end;

Procedure TForm1.UpdatePhonebook;
var i: integer;
    Data : String;
    EName: string;
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
    For i:= 0 to length(Phonebook)-1 do
    begin
       if Phonebook[i].important then EName:= '!'+Phonebook[i].Name else EName:= Phonebook[i].Name;
        Data := Data +
               'telcfg:settings/HotDialEntry'+inttostr(i)+'/Code=0'  + Phonebook[i].short  + '&' +
               'telcfg:settings/HotDialEntry'+inttostr(i)+'/Vanity=' + Phonebook[i].vanity + '&' +
               'telcfg:settings/HotDialEntry'+inttostr(i)+'/Number=' + Phonebook[i].Number + '&' +
               'telcfg:settings/HotDialEntry'+inttostr(i)+'/Name='   + EName               + '&';
    end;

    Data:= Data + 'Submit=Submit';

   httppost('http://'+BoxAdress+'/cgi-bin/webcm', Data);
   unsaved_phonebook:= false;

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
             'This is an early version, so it may be buggy. If your find bug or wish to have some new features, feel free to contact me at www.mehrsurfen.de > Forum.'
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
var index          : integer;
    reverseAdress  : string;
    CityCode       : string;
    SearchString   : string;
begin
 CityCode      := sett.ReadString('FritzBox','CityCode', '');
 reverseAdress := sett.ReadString('FritzBox','reverse', '');
 if CallerList.ItemIndex > -1 then
  begin
   index        := CallerList.ItemIndex;
   searchstring := Callerlist.items[index].SubItems.Strings[2];
   if (searchstring <> '') then
   begin
    if ((searchstring[1] <> '0') and (searchstring[1] <> '+')) then searchstring:= Citycode+searchstring;
    reverseAdress:= AnsiReplaceStr(reverseAdress, '%NUMBER%',searchstring);
    Shellexecute( handle, nil, Pchar(reverseadress), nil, nil, SW_SHOWMaximized);
   end;
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

   PageControl1.ActivePageIndex:= 2;
   PageControl1Change(nil);
  end;

end;

procedure TForm1.addpictureClick(Sender: TObject);
var index          : integer;
    NumberString   : string;
    CityCode       : string;
begin
  CityCode      := sett.ReadString('FritzBox','CityCode', '');
  if PhoneBookList.ItemIndex > -1 then
  begin
   index        := PhoneBookList.ItemIndex;
//   NumberString := PhoneBooklist.items[index].SubItems.Strings[0];
//   if (NumberString[1] <> '0') then NumberString:= Citycode+NumberString;

   NumberString := PhoneBooklist.items[index].Caption;
   if numberstring[1] = '!' then delete(numberstring,1,1);
   
   if ImgDlg.Execute then
   begin
     sett.WriteString('Images', NumberString, ImgDlg.FileName);
     sett.UpdateFile;
   end;

  end;
end;

procedure TForm1.deleteitemClick(Sender: TObject);
var index          : integer;
    DelString   : string;
    i: integer;
    SL: TStringlist;
begin

  if CallerList.ItemIndex > -1 then
  begin
   index        := CallerList.ItemIndex;

   DelString:= inttostr(CallerList.items[index].ImageIndex-1);
   for i:= 0 to Callerlist.items[index].SubItems.count-2 do
     Delstring := DelString + ';'+Callerlist.items[index].SubItems.Strings[i];

  end;

 sl:= TStringlist.Create;
 sl.loadfromfile('anrufliste.csv');
 if sl.indexof(DelString) >-1 then
 begin
   sl.Delete(sl.indexof(DelString));
   sl.SaveToFile('anrufliste.csv');
   LoadCallersFromFile(ToolButton3.Tag); //neuladen mit eingestelltem Filter
 end;  
 sl.free;

end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
  DeleteListFritzBox;
end;

end.
