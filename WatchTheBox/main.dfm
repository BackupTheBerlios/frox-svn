object Form1: TForm1
  Left = 0
  Top = 0
  Width = 464
  Height = 404
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'WatchTheBox'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 460
  UseDockManager = True
  DockSite = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 27
    Width = 448
    Height = 322
    ActivePage = Tab3
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object Tab1: TTabSheet
      Caption = 'Traffic'
      DesignSize = (
        440
        294)
      object Label8: TLabel
        Left = 96
        Top = 8
        Width = 47
        Height = 13
        Caption = 'Download'
      end
      object Label9: TLabel
        Left = 224
        Top = 7
        Width = 33
        Height = 13
        Caption = 'Upload'
      end
      object LimitLabel: TLabel
        Left = 98
        Top = 120
        Width = 3
        Height = 13
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Image1: TImage
        Left = 368
        Top = 265
        Width = 80
        Height = 31
        Cursor = crHandPoint
        Anchors = [akRight, akBottom]
        AutoSize = True
        Picture.Data = {
          07544269746D6170E60D0000424DE60D00000000000036040000280000005000
          00001F0000000100080000000000B00900000000000000000000000100000000
          0000D5C7B600C3AE9B00DED7D000CAB8A400764A2500E9E1D800F4F1EE006835
          0B00BCA48D00A2836700FDFCFB00815832009976570071411800B69D8600F4EE
          E400DFD3C600A88B7100926E4B00B2987F00AC9077008B644100EDE7E000D1C1
          AF005B240300FAF9F700F7F5F20047080000D9CCBE00BBBBBB00E9E9E900BDA7
          94004D36220000000000FCF7EA00FFFFFF000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000040420202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020202020202020202020202020202020
          2020202020202020202020202020202020200B05001D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D
          1F201223061E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E
          1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E0617040923222222222222222222222222
          2222222222222222222222222222222222222222222222222222222222222222
          2222222222222222222222222222222222222222222222222222222222222206
          0204092323232323232323232323232323232323232323232121232321232323
          2321212121232123232121232121212123232121212123212323212123232323
          2323232323232323232323232323230602040923222222222222222222222222
          2222222222222221222221222122222222212222222221222221212221222222
          2122212222222221222221212222222222222222222222222222222222222206
          0204092323232323232323232323232323232323232323232321232321212123
          2321232323232123212321232123232321232123232323212321232123232323
          2323232323232323232323232323230602040923222222222222222222222222
          2222222222222222212222222122222122212121222221222122212221222222
          2122212121222221222122212222222222222222222222222222222222222206
          0204092323232323232323232323232323232323232323212323212321232321
          2321232323232121232321232123232321232123232323212123232123232323
          2323232323232323232323232323230602040923222222222222222222222222
          2222222222222222212122222121212222212121212221212222212221212121
          2222212121212221212222212222222222222222222222222222222222222206
          0204092323232323232323232323232323232323232323232323232323232323
          2323232323232323232323232323232323232323232323232323232323232323
          2323232323232323232323232323230602040923222222222222222222222222
          2222222222222222222222222222222222222222222222222222222222222222
          2222222222222222222222222222222222222222222222222222222222222206
          0204092323232323232323232323232323232323232323232323232323232305
          0B070D0D0D0D0323232323232323232323232323232323232323232323232323
          2323232323232323232323232323230602040923222222222222222222222222
          2222222222222222222222222222222201070C1C031204022222222222222222
          2222222222222222222222222222222222222222222222222222222222222206
          02040923232323232323232323031F01011F031A232323231A1713140E01011F
          010B0B0F23100D110A02011F011F011623232323231C13140E01010101010101
          1F0116232323232323232323232323060204092322222222222222222204070D
          040D0D172222220F090715150D070D040709040C06230E071701070D040D0708
          22222222080D041204070D0407070D040D070822222222222222222222222206
          02040923232323232323232323090D0302030D01232323010708160602001010
          0B09080D1C230615151C041402001509232323020D09051A05001C1009180C02
          1C0B091923232323232323232323230602040923222222222222222222080D17
          231A0B12100522090B1A230501052323110B130D052323000D090B142323110B
          000522030D1C231A031C23231718122323111505222222222222222222222206
          020409232323232323232323231004142319090704040C0B0B062303180D0223
          010D0B0B06232323140704151A2301070D040C120D1C23020418032305070D05
          23010D0223232323232323232323230602040923222222222222222222051215
          192302030113150718010A1A03140223100D180C230F1C1A0F0B180D05230F03
          010E120718091A0A1C111723190B071723000D01222222222222222222222206
          0204092323232323232323232319130D162323190A23190107070C0305050623
          060B181123021517230307070323230A0A2323000B1815010505160A0A091813
          23160B142323232323232323232323060204092322222222222222222222170D
          17230F13140223230807040B0B04080A230C18082302070C0A230C1811232301
          09001923100D0D15040409062301180C0A0A0C150F2222222222222222222206
          02040923232323232323232323231604132306151B0D02230F04140A10000F23
          231207102310071817230604150A23141B1803231912151902000523230E180B
          1623130405232323232323232323230602040923222222222222222222220F15
          0C0A2313180D10230A0B0B00021605100E070D011C1307071517000C04162303
          0718032323110D010205161003040D0D1C23030D172222222222222222222206
          020409232323232323232323232323110B062305030223231604070D040B0B0D
          040D07070707150804070D0707002306030019231912070D0D0B0B0D0D0C0304
          0823020408232323232323232323230602040923222222222222222222222201
          0D171A1923230610120D03171F0808011C00030303011C0F0003031F0D131919
          23231A05140713000108081F170F0F0B0923230C0C0F17080322222222222206
          02040923232323232323232323232305070B1212121215040403232323232323
          23232323232323232323231915041212121212040D1419232323232323231909
          0B0300150B05141509232323232323060204092322222222222222222222220F
          110C0C0C0C0C110E1022222222222222222222222222222222222222010C0C0C
          0C0C0913000F22222222222222222201070D0D0D0D000E121322222222222223
          1E040E2323232323232323232323232323232323232323232323232323232323
          2323232323232323232323232323232323232323232323232323232323232323
          2323232323232323232323232323232323040E22222222222222222222222222
          2222222222222222222222222222222222222222222222222222222222222222
          2222222222222222222222222222222222222222222222222222222222222222
          220B1F031F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F
          1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F1F0912}
        Transparent = True
        OnClick = Image1Click
      end
      object Gauge1: TGauge
        Left = 97
        Top = 128
        Width = 121
        Height = 44
        BackColor = clBlack
        Color = clBtnFace
        ForeColor = clGreen
        Kind = gkNeedle
        ParentColor = False
        Progress = 0
      end
      object Label1: TLabel
        Left = 98
        Top = 180
        Width = 42
        Height = 13
        Caption = 'days left'
      end
      object Website: TLabel
        Left = 160
        Top = 280
        Width = 117
        Height = 14
        Cursor = crHandPoint
        Alignment = taCenter
        Anchors = [akLeft, akBottom]
        Caption = 'www.mehrsurfen.de'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = WebsiteClick
        OnMouseEnter = WebsiteMouseEnter
        OnMouseLeave = WebsiteMouseLeave
      end
      object Label2: TLabel
        Left = 16
        Top = 32
        Width = 60
        Height = 13
        Caption = 'traffic today'
        WordWrap = True
      end
      object Label3: TLabel
        Left = 16
        Top = 56
        Width = 52
        Height = 26
        Caption = 'traffic this month'
        WordWrap = True
      end
      object Label4: TLabel
        Left = 16
        Top = 87
        Width = 48
        Height = 26
        Caption = 'costs this month'
        WordWrap = True
      end
      object currentipLabel: TLabel
        Left = 16
        Top = 206
        Width = 46
        Height = 13
        Caption = 'current ip'
      end
      object Edit1: TEdit
        Left = 96
        Top = 24
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object Edit2: TEdit
        Left = 224
        Top = 24
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object Edit3: TEdit
        Left = 96
        Top = 56
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
      object Edit4: TEdit
        Left = 224
        Top = 56
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 3
      end
      object viewstats: TBitBtn
        Left = 245
        Top = 88
        Width = 78
        Height = 25
        Caption = 'view stats'
        TabOrder = 5
        Visible = False
        OnClick = viewstatsClick
        NumGlyphs = 2
      end
      object EdtPrice: TEdit
        Left = 96
        Top = 88
        Width = 121
        Height = 21
        ReadOnly = True
        TabOrder = 4
      end
      object reset: TButton
        Left = 242
        Top = 139
        Width = 79
        Height = 25
        Caption = 'reset'
        TabOrder = 6
        OnClick = resetClick
      end
      object renewip: TButton
        Left = 242
        Top = 200
        Width = 79
        Height = 25
        Hint = 
          'UPNP needs to be enabled on your Fritz!Box (it should be by defa' +
          'ult)'
        Caption = 'renew IP'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 7
        OnClick = renewipClick
      end
      object currentip: TEdit
        Left = 96
        Top = 202
        Width = 121
        Height = 21
        Hint = 
          'UPNP needs to be enabled on your Fritz!Box (it should be by defa' +
          'ult)'
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 8
        Text = 'detecting...'
      end
    end
    object Tab2: TTabSheet
      Caption = 'List of calls'
      ImageIndex = 1
      object CallerList: TListView
        Left = 0
        Top = 0
        Width = 440
        Height = 294
        Align = alClient
        Anchors = [akLeft, akTop, akRight]
        Columns = <
          item
            AutoSize = True
            Caption = 'type'
          end
          item
            AutoSize = True
            Caption = 'date/time'
          end
          item
            AutoSize = True
            Caption = 'name'
          end
          item
            AutoSize = True
            Caption = 'cbc'
          end
          item
            AutoSize = True
            Caption = 'number'
          end
          item
            AutoSize = True
            Caption = 'phone'
          end
          item
            AutoSize = True
            Caption = 'MSN'
          end
          item
            AutoSize = True
            Caption = 'duration'
          end
          item
            AutoSize = True
            Caption = 'fullnumber'
          end>
        FlatScrollBars = True
        GridLines = True
        HotTrack = True
        HotTrackStyles = [htUnderlineCold]
        MultiSelect = True
        RowSelect = True
        PopupMenu = PopupMenu1
        ShowWorkAreas = True
        SmallImages = ImageList2
        TabOrder = 0
        ViewStyle = vsReport
        OnColumnClick = PhonebookListColumnClick
        OnCompare = PhonebookListCompare
      end
    end
    object Tab3: TTabSheet
      Caption = 'Phonebook'
      ImageIndex = 2
      object error: TLabel
        Left = 88
        Top = 32
        Width = 3
        Height = 13
      end
      object searchpanel: TGroupBox
        Left = 0
        Top = 254
        Width = 440
        Height = 40
        Align = alBottom
        TabOrder = 0
        Visible = False
        object PBsearch: TLabeledEdit
          Left = 48
          Top = 10
          Width = 121
          Height = 21
          EditLabel.Width = 39
          EditLabel.Height = 13
          EditLabel.Caption = 'search :'
          LabelPosition = lpLeft
          TabOrder = 0
          OnChange = PBsearchChange
        end
        object sname: TRadioButton
          Left = 184
          Top = 14
          Width = 113
          Height = 17
          Caption = 'name'
          Checked = True
          TabOrder = 1
          TabStop = True
        end
        object snumber: TRadioButton
          Left = 248
          Top = 14
          Width = 129
          Height = 17
          Caption = 'number/ vanity/ short'
          TabOrder = 2
        end
      end
      object PhoneBookList: TListView
        Left = 0
        Top = 97
        Width = 440
        Height = 157
        Align = alClient
        Columns = <
          item
            AutoSize = True
            Caption = 'name'
          end
          item
            AutoSize = True
            Caption = 'home'
          end
          item
            Caption = 'mobile'
          end
          item
            Caption = 'work'
          end
          item
            Caption = 'quick dial'
            Width = 148
          end
          item
            Caption = 'vanity'
          end
          item
            Caption = 'identifier'
          end>
        FlatScrollBars = True
        GridLines = True
        HotTrackStyles = [htUnderlineCold]
        MultiSelect = True
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupMenu2
        SmallImages = ImageList2
        SortType = stBoth
        TabOrder = 2
        ViewStyle = vsReport
        OnColumnClick = PhonebookListColumnClick
        OnCompare = PhonebookListCompare
        OnMouseDown = PhoneBookListMouseDown
        OnSelectItem = PhoneBookListSelectItem
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 0
        Width = 440
        Height = 97
        Align = alTop
        TabOrder = 1
        object Label7: TLabel
          Left = 130
          Top = 10
          Width = 43
          Height = 13
          Caption = 'quick dial'
        end
        object PBadd: TButton
          Left = 366
          Top = 25
          Width = 75
          Height = 17
          Caption = 'add'
          TabOrder = 8
          OnClick = PBaddClick
        end
        object PBimportant: TCheckBox
          Left = 368
          Top = 66
          Width = 73
          Height = 17
          Caption = 'important'
          TabOrder = 7
        end
        object PBClear: TButton
          Left = 366
          Top = 44
          Width = 75
          Height = 17
          Caption = 'clear'
          TabOrder = 9
          OnClick = PBClearClick
        end
        object PBShort: TComboBox
          Left = 128
          Top = 25
          Width = 57
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          Sorted = True
          TabOrder = 1
        end
        object sendtoBox: TCheckBox
          Left = 240
          Top = 26
          Width = 105
          Height = 17
          Caption = 'send to Fritz!Box'
          TabOrder = 3
          OnClick = sendtoBoxClick
        end
        object PBName: TLabeledEdit
          Left = 8
          Top = 25
          Width = 113
          Height = 21
          EditLabel.Width = 26
          EditLabel.Height = 13
          EditLabel.Caption = 'name'
          TabOrder = 0
        end
        object PBNumber: TLabeledEdit
          Left = 8
          Top = 65
          Width = 113
          Height = 21
          EditLabel.Width = 26
          EditLabel.Height = 13
          EditLabel.Caption = 'home'
          TabOrder = 4
          OnKeyPress = PBNumberKeyPress
        end
        object PBVanity: TLabeledEdit
          Left = 192
          Top = 25
          Width = 41
          Height = 21
          EditLabel.Width = 30
          EditLabel.Height = 13
          EditLabel.Caption = 'vanity'
          Enabled = False
          TabOrder = 2
        end
        object PBmobile: TLabeledEdit
          Left = 128
          Top = 65
          Width = 113
          Height = 21
          EditLabel.Width = 30
          EditLabel.Height = 13
          EditLabel.Caption = 'mobile'
          TabOrder = 5
          OnKeyPress = PBNumberKeyPress
        end
        object PBwork: TLabeledEdit
          Left = 248
          Top = 65
          Width = 113
          Height = 21
          EditLabel.Width = 23
          EditLabel.Height = 13
          EditLabel.Caption = 'work'
          TabOrder = 6
          OnKeyPress = PBNumberKeyPress
        end
      end
    end
    object Tab4: TTabSheet
      Caption = 'UPNP'
      ImageIndex = 3
      TabVisible = False
      object UPNPLog: TMemo
        Left = 0
        Top = 0
        Width = 440
        Height = 294
        Align = alBottom
        Anchors = [akLeft, akTop, akRight, akBottom]
        Lines.Strings = (
          'UPNPLog')
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 448
    Height = 27
    ButtonHeight = 25
    ButtonWidth = 34
    Caption = 'ToolBar1'
    Customizable = True
    Flat = True
    HotImages = ImageList2
    Images = ImageList2
    TabOrder = 1
    Transparent = False
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Hint = 'settings'
      Caption = 'ToolButton2'
      ImageIndex = 1
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton2Click
    end
    object ToolButton1: TToolButton
      Left = 34
      Top = 0
      Hint = 'refresh list of calls'
      AllowAllUp = True
      Caption = 'Refresh'
      Enabled = False
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 68
      Top = 0
      Hint = 'filter: incoming'
      Caption = 'ToolButton3'
      Down = True
      ImageIndex = 2
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
      Visible = False
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 102
      Top = 0
      Hint = 'filter: incoming (missed)'
      Caption = 'ToolButton4'
      Down = True
      ImageIndex = 3
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
      Visible = False
      OnClick = ToolButton3Click
    end
    object ToolButton5: TToolButton
      Left = 136
      Top = 0
      Hint = 'filter: outgoing'
      Caption = 'ToolButton5'
      Down = True
      ImageIndex = 4
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
      Visible = False
      OnClick = ToolButton3Click
    end
    object ToolButton8: TToolButton
      Left = 170
      Top = 0
      Hint = 'reload phonebook'
      Caption = 'ToolButton8'
      Enabled = False
      ImageIndex = 6
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = ToolButton8Click
    end
    object ToolButton7: TToolButton
      Left = 204
      Top = 0
      Hint = 'send complete phonebook to your Fritz!Box'
      Caption = 'ToolButton7'
      Enabled = False
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = ToolButton7Click
    end
    object ToolButton10: TToolButton
      Left = 238
      Top = 0
      Hint = 'delete list (FritzBox)'
      Caption = 'ToolButton10'
      Enabled = False
      ImageIndex = 8
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton10Click
    end
    object vcfimport: TToolButton
      Left = 272
      Top = 0
      Hint = 'import vcard'
      Caption = 'vcfimport'
      ImageIndex = 9
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = vcfimportClick
    end
    object ToolButton11: TToolButton
      Left = 306
      Top = 0
      Hint = 'search phonebook'
      Caption = 'ToolButton11'
      ImageIndex = 10
      ParentShowHint = False
      ShowHint = True
      Style = tbsCheck
      OnClick = ToolButton11Click
    end
    object ToolButton9: TToolButton
      Left = 340
      Top = 0
      Hint = 'info'
      Caption = 'ToolButton9'
      ImageIndex = 7
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton9Click
    end
    object Hangupbutton: TToolButton
      Left = 374
      Top = 0
      Caption = 'HangUp'
      Enabled = False
      ImageIndex = 11
      Visible = False
      OnClick = HangupbuttonClick
    end
    object ToolButton6: TToolButton
      Left = 408
      Top = 0
      Hint = 'reshow closed notification window'
      Caption = 'ToolButton6'
      Enabled = False
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton6Click
    end
  end
  object Status: TStatusBar
    Left = 0
    Top = 349
    Width = 448
    Height = 19
    Panels = <>
    ParentShowHint = False
    ShowHint = False
    SimplePanel = True
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 288
    Top = 280
  end
  object Tray: TCoolTrayIcon
    DesignPreview = True
    IconList = ImageList1
    CycleInterval = 0
    Icon.Data = {
      0000010001001010040000000000280100001600000028000000100000002000
      0000010004000000000080000000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0666000000000000666660000000000006666600000000000066666000600000
      0000006606600333333306666660033333300666666003333300006666600333
      3330066666600333333066666660033033000000000003000333330000000000
      003333300000000000033333000000000000333000000000000003000000F07F
      0000E03E0000F01C0000F8080000000000000000000000000000018000000000
      00000000000000000000101F0000380F00007C070000FE0F0000FF1F0000}
    IconVisible = True
    IconIndex = 0
    MinimizeToTray = True
    OnMouseDown = TrayMouseDown
    Left = 416
    Top = 280
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 320
    Top = 248
    object reloadCallerList: TMenuItem
      Caption = 'retrieve list of calls'
      OnClick = reloadCallerListClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object searchNumber: TMenuItem
      Caption = 'reverse Lookup'
      OnClick = searchNumberClick
    end
    object addtoPhonebook: TMenuItem
      Caption = 'add item to phonebook'
      OnClick = addtoPhonebookClick
    end
    object deleteitem: TMenuItem
      Caption = 'delete item'
      OnClick = deleteitemClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object Dial1: TMenuItem
      Caption = 'Dial'
      object Fon11: TMenuItem
        Tag = 1
        Caption = 'Fon 1'
        OnClick = Fon11Click
      end
      object Fon21: TMenuItem
        Tag = 2
        Caption = 'Fon 2'
        OnClick = Fon11Click
      end
      object Fon31: TMenuItem
        Tag = 3
        Caption = 'Fon 3'
        OnClick = Fon11Click
      end
      object S0Bus1: TMenuItem
        Tag = 50
        Caption = 'S0-Bus'
        OnClick = Fon11Click
      end
    end
  end
  object PopupMenu2: TPopupMenu
    AutoPopup = False
    OnPopup = PopupMenu2Popup
    Left = 352
    Top = 248
    object ReloadPhonebook: TMenuItem
      Caption = 'retrieve phonebook'
      OnClick = ReloadPhonebookClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object pbdelete: TMenuItem
      Caption = 'delete entry'
      OnClick = pbdeleteClick
    end
    object pbdelpicture: TMenuItem
      Caption = 'delete picture'
      OnClick = pbdelpictureClick
    end
    object pbaddpicture: TMenuItem
      Caption = 'add picture'
      OnClick = pbaddpictureClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Dial2: TMenuItem
      Caption = 'Dial Home'
      object Fon12: TMenuItem
        Tag = 1
        Caption = 'Fon 1'
        OnClick = Fon12Click
      end
      object Fon22: TMenuItem
        Tag = 2
        Caption = 'Fon 2'
        OnClick = Fon12Click
      end
      object Fon32: TMenuItem
        Tag = 3
        Caption = 'Fon 3'
        OnClick = Fon12Click
      end
      object S01: TMenuItem
        Tag = 50
        Caption = 'S0'
        OnClick = Fon12Click
      end
    end
    object Dial3: TMenuItem
      Caption = 'Dial Mobile'
      object Fon13: TMenuItem
        Tag = 1
        Caption = 'Fon 1'
        OnClick = Fon12Click
      end
      object Fon23: TMenuItem
        Tag = 2
        Caption = 'Fon 2'
        OnClick = Fon12Click
      end
      object Fon33: TMenuItem
        Tag = 3
        Caption = 'Fon 3'
        OnClick = Fon12Click
      end
      object S02: TMenuItem
        Tag = 50
        Caption = 'S0'
        OnClick = Fon12Click
      end
    end
    object Dial4: TMenuItem
      Caption = 'Dial Work'
      object Fon14: TMenuItem
        Tag = 1
        Caption = 'Fon 1'
        OnClick = Fon12Click
      end
      object Fon24: TMenuItem
        Tag = 2
        Caption = 'Fon 2'
        OnClick = Fon12Click
      end
      object Fon34: TMenuItem
        Tag = 3
        Caption = 'Fon 3'
        OnClick = Fon12Click
      end
      object S03: TMenuItem
        Tag = 50
        Caption = 'S0'
        OnClick = Fon12Click
      end
    end
  end
  object ImageList1: TImageList
    Left = 352
    Top = 280
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E50D000333998003F44AD003F44
      AD003F44AD003F44AD00333998003F44AD003F44AD00333998003F44AD003F44
      AD003F44AD003F44AD00333998004E50D0004E50D000333998003F44AD003F44
      AD003F44AD003F44AD00333998003F44AD003F44AD00333998003F44AD003F44
      AD003F44AD003F44AD00333998004E50D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004E50D0001F24A7000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF001F24A7004E50D0004E50D0001F24A700929DF800929D
      F8008485DB00929DF800929DF800929DF800929DF800929DF800929DF8008485
      DB00929DF8008485DB001F24A7004E50D0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000333998000000FF000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF000000FF000000FF00333998000000000000000000333998008485DB00F7FA
      FA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FA
      FA00F7FAFA008485DB0033399800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008485DB003F44AD000000
      FF000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF000000FF003F44AD008485DB0000000000000000008485DB003F44AD00D2D2
      FC00F7FAFA00F7FAFA00F7FAFA000000000000000000F7FAFA00F7FAFA00F7FA
      FA00D2D2FC003F44AD008485DB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000004E50D000404F
      D0000000FF000000FF000000FF0000000000000000000000FF000000FF000000
      FF00404FD0004E50D000000000000000000000000000000000004E50D000404F
      D000F7FAFA00F7FAFA00F7FAFA000000000000000000F7FAFA00F7FAFA00F7FA
      FA00404FD0004E50D00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008783B5004545
      88000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF003F44AD0000000000000000000000000000000000000000008783B5004545
      8800BCB9E400F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00BCB9
      E4003F44AD000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000404F
      D0004E50D0000000FF000000FF0000000000000000000000FF000000FF00404F
      D000404FD000000000000000000000000000000000000000000000000000404F
      D0004E50D000F7FAFA00F7FAFA000000000000000000F7FAFA00F7FAFA00404F
      D000404FD0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000333998000000FF000000FF0000000000000000000000FF000000FF003339
      9800000000000000000000000000000000000000000000000000000000000000
      000033399800929DF800F7FAFA000000000000000000F7FAFA00929DF8003339
      9800000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008485DB00333998000000FF0000000000000000000000FF0045458800646A
      F000000000000000000000000000000000000000000000000000000000000000
      00008485DB0033399800F7FAFA000000000000000000F7FAFA0045458800646A
      F000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000333998000000FF0000000000000000000000FF00454588000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000333998008485DB0000000000000000008485DB00454588000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001F24A7000000FF000000FF0033399800929DF8000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001F24A700F7FAFA00F7FAFA0033399800929DF8000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000404FD0004E50D0004E50D0004E50D000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000404FD0004E50D0004E50D0004E50D000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F24A7001F24A70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001F24A7001F24A70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646AF000646AF00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000646AF000646AF00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3A58100A578420098652800A784
      5A00C7C3BE00CDCDCD0000000000000000000000000000000000000000000000
      00000000000000000000000000003550B400203A96001D3690001F389300203A
      9600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005AA773000F7D3300027527002587
      4500BAC4BD00CCCCCC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3A5810091591600AE732C00C8883D00D2914400B478
      2E00935E1E00C8C4C000CDCDCD00000000000000000000000000000000000000
      00000000000000000000223D9D00223D9D00304EBB003757CA003D5FD7002E4B
      B500203A96000000000000000000000000000000000000000000000000000000
      0000000000000000000063AB7A00118134001EAA4A002CC55D0031CE630026B9
      550008792D00BAC4BD00CCCCCC00000000004E50D000333998003F44AD003F44
      AD003F44AD003F44AD00333998003F44AD003F44AD00333998003F44AD003F44
      AD003F44AD003F44AD00333998004E50D0000000000000000000000000000000
      000000000000B28A5900A56C2900DB994C00E29F5100E29F5100E29F5100E29F
      5100B4762D00A2784500D0D0D000000000000000000000000000000000000000
      000000000000203A9A00203B9B004365E2005177FF005177FF005177FF005177
      FF003353C1001E378E0000000000000000000000000000000000000000000000
      0000000000002A8E4A001A9A440031CE630031CE630031CE630031CE630031CE
      630025B75300298A4800D5D5D500000000004E50D0001F24A700929DF800929D
      F8008485DB00929DF800929DF800929DF800929DF800929DF800929DF8008485
      DB00929DF8008485DB001F24A7004E50D0000000000000000000000000000000
      0000A87B4300B0742E00E29F5100E4A55D00E7B07100E8B37400E3A25600E4A4
      5B00AF732D00A279470000000000000000000000000000000000000000000000
      0000213C9C002B48B0004F75FB005177FF006083FF006486FF005278FF00567B
      FF003655C700203A960000000000000000000000000000000000000000000000
      000018833B00199F440031CE63004AD4760065CF87006EDC910041D26F0041D2
      6F0019903F00599D7000000000000000000000000000333998008485DB00F7FA
      FA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FA
      FA00F7FAFA008485DB003339980000000000000000000000000000000000A06F
      3300B3762D00E29F5100E2A66100BB905C00AB815000DCC1A200EEC79900BC88
      4A00A2764000000000000000000000000000000000000000000000000000223C
      9E00304EBB005177FF005F82FF00647CD0005165B0009FAEE4008AA3FF004B67
      CD00233C9A00000000000000000000000000000000000000000000000000318F
      4F002EC45E0031CE630047CD7200489F65004E9D670095CBA60092E3AC003FA6
      6100559F6D00000000000000000000000000000000008485DB003F44AD00D2D2
      FC00F7FAFA00F7FAFA00F7FAFA000000000000000000F7FAFA00F7FAFA00F7FA
      FA00D2D2FC003F44AD008485DB00000000000000000000000000AA7D4600B376
      2D00E29F5100DDA15B00A4743800B090690000000000BB9A7100CEB18D00AB80
      4A00000000000000000000000000000000000000000000000000213C9D00314F
      BC005177FF005E80FC004B64BF002E459800000000005165B000A3B1E300334B
      A30000000000000000000000000000000000000000000000000056A46F0061D0
      85003BD06A0040CB6D00157F3700B6CDBD000000000075B489005AA672005DA9
      75000000000000000000000000000000000000000000000000004E50D000404F
      D000F7FAFA00F7FAFA00F7FAFA000000000000000000F7FAFA00F7FAFA00F7FA
      FA00404FD0004E50D000000000000000000000000000BB986E00B1753100E29F
      5100E1A257009A652300C5BAAC00000000000000000000000000DDCDB8000000
      000000000000000000000000000000000000000000001F3998002D4AB4005177
      FF00597DFF003550B4001E36890000000000000000000000000028419D000000
      0000000000000000000000000000000000000000000068AD7E009ED6B00076DE
      97003FCB6C0005772900C4CEC700000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000008783B5004545
      8800BCB9E400F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00F7FAFA00BCB9
      E4003F44AD0000000000000000000000000000000000A4753B00E4A65F00E3A2
      5500A86F2A00A8865E0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028419D00334CA100587BF800567B
      FF003353C1001F378F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006EB08400B5D9C00098E6B10063DA
      880020904300639F770000000000000000000000000000000000AEBFB300CCCC
      CC00DEDEDE00000000000000000000000000000000000000000000000000404F
      D0004E50D000F7FAFA00F7FAFA000000000000000000F7FAFA00F7FAFA00404F
      D000404FD000000000000000000000000000BD9B7000D8BA9400E9B77D00DFA0
      55008E561300CCCCCC00D1D1D1000000000000000000C4A88500BBAA9500C1B7
      AB00CAC8C600CAC8C600CCCCCC000000000028419D008094D9006F8EFF005579
      FC001E3997000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000065AD7C00ADE1BE00A9EBBE0070DB
      93000F7D3200C2C8C400CECECE000000000000000000047628000F7E3200629E
      7600CCCCCC00DEDEDE0000000000DFDFDF000000000000000000000000000000
      000033399800929DF800F7FAFA000000000000000000F7FAFA00929DF8003339
      980000000000000000000000000000000000B7936600ECD1B000ECBF8C00E5AA
      6500AF753000A2784500CCCCCC0000000000BD9D7400B2732800A26A26009760
      1C008C540F00915B1900B9997100000000005367B3009BAEF4007B98FF005F82
      FF002D49AF001C3488000000000000000000000000001F3999001F3A9A001E37
      94001E3794001E3794001B348B000000000059A67300ACE7BE0087E2A40063DA
      89001E9F470023864300CCCCCC0000000000288B480034AC5B0026AA50000F7E
      3200629E7600CCCCCC0043945D00D3D3D3000000000000000000000000000000
      00008485DB0033399800F7FAFA000000000000000000F7FAFA0045458800646A
      F00000000000000000000000000000000000BC9A7100F1DABF00EDC49400E8B2
      7400E3A15500AA712C00BB9A710000000000D1BA9E00C2976300DB964600DB96
      46009A6320009F743E00CFCFCF00000000006275B800AEBEF900819CFF00698A
      FF005377FC002A46AD001C32840000000000000000001F3B9D002B50D8002B50
      D8002B50D8002B50D8001F3998000000000056A57000BDEBCC0091E5AC006CDC
      90003CD16C001B9744005F9F73000000000076B48A007EBB91006BC5880026AA
      50000F7E3200609D73000C7B3100B3C1B8000000000000000000000000000000
      000000000000333998008485DB0000000000000000008485DB00454588000000
      000000000000000000000000000000000000C3A47D00EEE0CF00F4DABC00EDC3
      9200BC8749009C6D32000000000000000000E1D3C100BC966800E3AE7100DB96
      4600AF7129009F723B00CAC8C600CFCFCF005267B200C4CEF400A5B9FF007E9A
      FF005779F3001F3A9700000000000000000000000000314AA4005E7BE400315B
      F400315BF4002F58EC001F399800000000006CB08200B4DDC100C3F1D20091E5
      AC003EA660004697600000000000000000000000000077B58B0086BF99006BC5
      880026AA510016873B00178B3C0080AB8E000000000000000000000000000000
      000000000000000000001F24A700F7FAFA00F7FAFA0033399800929DF8000000
      00000000000000000000000000000000000000000000C8AD8B00EDE0D100E0C8
      AD00B188560000000000000000000000000000000000B18A5A00C19E7400D4B2
      8900DB964600AF7129009D6F3700CAC8C60000000000465CAC00CBD3F000A5B3
      E600374FA40000000000000000000000000000000000314AA4005E7BE400315B
      F400315BF4002F58EC001F39990000000000000000006EB0840086BE99007FC1
      950062AB7A00000000000000000000000000000000000000000075B38A0066AE
      7C0040B7670029AE540015903D0065A378000000000000000000000000000000
      00000000000000000000404FD0004E50D0004E50D0004E50D000000000000000
      0000000000000000000000000000000000000000000000000000C8AD8B00BE9E
      75000000000000000000000000000000000000000000A2753D00B7936600B28C
      5C00D9BD9900DB964600AF712900A1733B0000000000000000004057A800465C
      AC0000000000000000000000000000000000000000003A52A70094A7ED008098
      F2008098F2004367EC001F39990000000000000000000000000073B288006EB0
      840000000000000000000000000000000000000000000000000050A06A00469B
      620079CC940060C380001C9B4500429A5F000000000000000000000000000000
      00000000000000000000000000001F24A7001F24A70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9966A00000000000000
      0000B28A5A00DCC2A000D7964A00925B17000000000000000000000000000000
      000000000000000000000000000000000000000000002D46A000556AB2005468
      B1005468B1004157A900243F9F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000074B388004D9E67004599
      600057A3700076B58A0050A66C001C843E000000000000000000000000000000
      0000000000000000000000000000646AF000646AF00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B28A5A00B1895700C3A581000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020202008451000084510000845100000202020000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000020202008451000084510000845100000202020000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000002020200F0BC0000F0BC0000F0BC00000202020000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000002020200F0BC0000F0BC0000F0BC00000202020000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000202
      0200845100008451000084510000845100008451000002020200000000000000
      0000000000000000000000000000020202000000000000000000000000000202
      0200845100008451000084510000845100008451000002020200000000000000
      0000000000000000000000000000020202000000000000000000000000000202
      0200F0BC0000F0BC0000F0BC0000F0BC0000F0BC000002020200000000000000
      0000000000000000000000000000020202000000000000000000000000000202
      0200F0BC0000F0BC0000F0BC0000F0BC0000F0BC000002020200000000000000
      0000000000000000000000000000020202000000000000000000000000000000
      0000020202008451000084510000845100008451000084510000020202000000
      0000000000000000000002020200020202000000000000000000000000000000
      0000020202008451000084510000845100008451000084510000020202000000
      0000000000000000000002020200020202000000000000000000000000000000
      000002020200F0BC0000F0BC0000F0BC0000F0BC0000F0BC0000020202000000
      0000000000000000000002020200020202000000000000000000000000000000
      000002020200F0BC0000F0BC0000F0BC0000F0BC0000F0BC0000020202000000
      0000000000000000000002020200020202000000000000000000000000000000
      0000000000000202020084510000845100008451000084510000845100000202
      0200000000000202020084510000020202000000000000000000000000000000
      0000000000000202020084510000845100008451000084510000845100000202
      0200000000000202020084510000020202000000000000000000000000000000
      00000000000002020200F0BC0000F0BC0000F0BC0000F0BC0000F0BC00000202
      02000000000002020200F0BC0000020202000000000000000000000000000000
      00000000000002020200F0BC0000F0BC0000F0BC0000F0BC0000F0BC00000202
      02000000000002020200F0BC0000020202000202020002020200020202000202
      0200020202000202020002020200020202000202020002020200845100008451
      0000020202008451000084510000020202000202020002020200020202000202
      0200020202000202020002020200020202000202020002020200845100008451
      0000020202008451000084510000020202000202020002020200020202000202
      0200020202000202020002020200020202000202020002020200F0BC0000F0BC
      000002020200F0BC0000F0BC0000020202000202020002020200020202000202
      0200020202000202020002020200020202000202020002020200F0BC0000F0BC
      000002020200F0BC0000F0BC00000202020002020200004EA200004EA200004E
      A200004EA200004EA200004EA200004EA2000202020084510000845100008451
      0000845100008451000084510000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0046ACFF0046ACFF000202020084510000845100008451
      00008451000084510000845100000202020002020200004EA200004EA200004E
      A200004EA200004EA200004EA200004EA20002020200F0BC0000F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC0000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0046ACFF0046ACFF0002020200F0BC0000F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC00000202020002020200004EA200004EA200004E
      A200004EA200004EA200004EA200020202000202020084510000845100008451
      0000845100008451000084510000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0046ACFF00020202000202020084510000845100008451
      00008451000084510000845100000202020002020200004EA200004EA200004E
      A200004EA200004EA200004EA2000202020002020200F0BC0000F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC0000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0046ACFF000202020002020200F0BC0000F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC00000202020002020200004EA200004EA200004E
      A200004EA200004EA20002020200000000000000000002020200845100008451
      0000845100008451000084510000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0002020200000000000000000002020200845100008451
      00008451000084510000845100000202020002020200004EA200004EA200004E
      A200004EA200004EA20002020200000000000000000002020200F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC0000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0002020200000000000000000002020200F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC00000202020002020200004EA200004EA200004E
      A200004EA200004EA200004EA200020202000202020084510000845100008451
      0000845100008451000084510000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0046ACFF00020202000202020084510000845100008451
      00008451000084510000845100000202020002020200004EA200004EA200004E
      A200004EA200004EA200004EA2000202020002020200F0BC0000F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC0000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0046ACFF000202020002020200F0BC0000F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC00000202020002020200004EA200004EA200004E
      A200004EA200004EA200004EA200020202008451000084510000845100008451
      0000845100008451000084510000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0046ACFF00020202008451000084510000845100008451
      00008451000084510000845100000202020002020200004EA200004EA200004E
      A200004EA200004EA200004EA20002020200F0BC0000F0BC0000F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC0000020202000202020046ACFF0046ACFF0046AC
      FF0046ACFF0046ACFF0046ACFF0002020200F0BC0000F0BC0000F0BC0000F0BC
      0000F0BC0000F0BC0000F0BC00000202020002020200004EA200004EA2000202
      0200004EA200004EA20002020200020202000202020002020200020202000202
      0200020202000202020002020200020202000202020046ACFF0046ACFF000202
      020046ACFF0046ACFF0002020200020202000202020002020200020202000202
      02000202020002020200020202000202020002020200004EA200004EA2000202
      0200004EA200004EA20002020200020202000202020002020200020202000202
      0200020202000202020002020200020202000202020046ACFF0046ACFF000202
      020046ACFF0046ACFF0002020200020202000202020002020200020202000202
      02000202020002020200020202000202020002020200004EA200020202000000
      000002020200004EA200004EA200004EA200004EA200004EA200020202000000
      0000000000000000000000000000000000000202020046ACFF00020202000000
      00000202020046ACFF0046ACFF0046ACFF0046ACFF0046ACFF00020202000000
      00000000000000000000000000000000000002020200004EA200020202000000
      000002020200004EA200004EA200004EA200004EA200004EA200020202000000
      0000000000000000000000000000000000000202020046ACFF00020202000000
      00000202020046ACFF0046ACFF0046ACFF0046ACFF0046ACFF00020202000000
      0000000000000000000000000000000000000202020002020200000000000000
      00000000000002020200004EA200004EA200004EA200004EA200004EA2000202
      0200000000000000000000000000000000000202020002020200000000000000
      0000000000000202020046ACFF0046ACFF0046ACFF0046ACFF0046ACFF000202
      0200000000000000000000000000000000000202020002020200000000000000
      00000000000002020200004EA200004EA200004EA200004EA200004EA2000202
      0200000000000000000000000000000000000202020002020200000000000000
      0000000000000202020046ACFF0046ACFF0046ACFF0046ACFF0046ACFF000202
      0200000000000000000000000000000000000202020000000000000000000000
      0000000000000000000002020200004EA200004EA200004EA200004EA200004E
      A200020202000000000000000000000000000202020000000000000000000000
      000000000000000000000202020046ACFF0046ACFF0046ACFF0046ACFF0046AC
      FF00020202000000000000000000000000000202020000000000000000000000
      0000000000000000000002020200004EA200004EA200004EA200004EA200004E
      A200020202000000000000000000000000000202020000000000000000000000
      000000000000000000000202020046ACFF0046ACFF0046ACFF0046ACFF0046AC
      FF00020202000000000000000000000000000000000000000000000000000000
      000000000000000000000000000002020200004EA200004EA200004EA2000202
      0200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000202020046ACFF0046ACFF0046ACFF000202
      0200000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000002020200004EA200004EA200004EA2000202
      0200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000202020046ACFF0046ACFF0046ACFF000202
      0200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000002020200004EA200020202000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000202020046ACFF00020202000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000002020200004EA200020202000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000202020046ACFF00020202000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000000000000000000000
      000000000000000080018001000000008001800100000000C003C00300000000
      C007C00700000000E007E00700000000F00FF00F00000000F00FB00F00000000
      F81FB81500000000FC1FBC1100000000FC3F8C2A00000000FE7FAE6A00000000
      FE7F8E6A00000000FFFFFFFF00000000FF03FE0FFF03FFFFFC01FC07FC010000
      F801F803F8010000F003F003F0038001E007E007E0078001C08FC08FC08FC003
      81DF81DF81FFC00783FF03FF03C7E007018107FF0182F00F010103810100F00F
      010101810100F81F030003810380FC1F8780878187C0FC3FCF80CF81CFC0FE7F
      FFB0FF81FF80FE7FFFF8FFFFFFFFFFFFF07FF07FF07FF07FE03EE03EE03EE03E
      F01CF01CF01CF01CF808F808F808F80800000000000000000000000000000000
      0000000000000000018001800180018000000000000000000000000000000000
      0000000000000000101F101F101F101F380F380F380F380F7C077C077C077C07
      FE0FFE0FFE0FFE0FFF1FFF1FFF1FFF1F00000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 384
    Top = 280
    Bitmap = {
      494C01010F001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080008080
      8000808080008080800080808000808080008080800080808000808080008080
      8000808080008080800080808000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000080808000000000000000000000000000808080000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      000000000000000000000000000000000000C0C0C000DEC8BE00FFFFFF00DEC8
      BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE000080
      000000800000DEC8BE00C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000808080000000000080808000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000080808000000000000000
      000000000000000000000000000000000000C0C0C000DEC8BE00808080008080
      800080808000DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8
      BE00DEC8BE00DEC8BE00C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000008080800000000000808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000000000008080800000000000808080000000
      000000000000000000000000000000000000C0C0C000DEC8BE00DEC8BE00DEC8
      BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00808080008080
      800080808000DEC8BE00C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080000000000080808000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800000000000808080000000000080808000000000008080
      800000000000000000000000000000000000C0C0C000DEC8BE00808080008080
      80008080800080808000DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8
      BE00DEC8BE00DEC8BE00C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000808080000000000080808000000000000000000000000000808080000000
      000080808000000000000000000000000000C0C0C000DEC8BE00808080008080
      8000808080008080800080808000808080008080800080808000DEC8BE00DEC8
      BE00DEC8BE00DEC8BE00C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000DEC8BE00DEC8BE00DEC8
      BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8BE00DEC8
      BE00DEC8BE00DEC8BE00C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000E6CCB300808080008080
      800080808000E6CCB300E6CCB300E6CCB300E6CCB300E6CCB300E6CCB3008080
      800080808000E6CCB300C0C0C000808080000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000001805000000FF00001805000018
      05000018050000180500001805000018050046AF5B000E892600017418001C94
      34007DCB8D000000FF000000FF000000FF00A6988500A2958700968A84009A8E
      8C00A49B9800988F8B00A69D9300A9A09300AB9F9300A79B8F009C908400B5A9
      9D00B2A69A00A3978B00B3A79B00A99D91000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F6E3CC00CCEFF900CCEFF900000000000000000000000000000000000000
      00000000000000000000000000001C82B8000000000000000000000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      FF00001805000018050046AF5B0001601400078320001B93320023993A000985
      22000000FF000000FF000000FF000000FF00FFF3C700FFFFE900FFF7EE00FFFC
      FF00FDF9FE00FFFFFC00FFF4E300FFFFED00FFFFF400FFFAED00FFFFF400FFFF
      F400FFEFE200FFFFF400FFF4E700B6A699000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000076A0B90083756F0076A0B900000000000000000000000000000000000000
      0000000000000000000065A1F2004298D90050A4E60000000000000000000000
      000000000000000000000000000000000000001805000000FF000000FF000000
      FF000000FF0021983900027D1A002DA0440033A44A0033A44A0033A44A000000
      FF000000FF000000FF000000FF0000180500FFFFE000FFFEEC00FFFCFF00EFF8
      FF00ECF8FF00F6FBFF00FDF8F500FDF2E400FFFFF500FFFFF500FFF6EA00FFFC
      F000FEF0E400FFFFF500FFFFF5009C8E82000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008EC2
      E100509CC6008BE6FC008EC2E100CCEFF9000000000000000000000000000000
      00000000000080A9FF0065A1F200158EB70060C1FA0057A1EA00000000000000
      00000000000000000000000000000000000000180500001805000000FF000000
      FF000000FF000000FF0033A44A003DAA53004DB3610051B565000000FF000000
      FF000000FF000000FF000018050000180500FFFFF800EFFAFF00496EA800285E
      B100063D92003F6CAF0016315D00E0EBFF00E9DEDA008B807C00897E7A007B70
      6C0082777300FFF8F400FFFBF7009B908C000000000000000000000000000000
      00000000000000000000000000000000000000000000CCEFF9008EC2E100509C
      C60062C0EC008BE6FC008BE6FC00CCEFF9000000000000000000000000000000
      0000B3BFFF00B3BFFF001789B60029ACCE0040B5E10079CAFF004597DA000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000D0D6D000A0A57000000FF000000FF000000
      FF000000FF00000000000000000000000000F7F5F500E4F9FF005586D6005294
      FA0003459E003F7AD0003863A60054688100FFFCF800FFF8F000FFFFF800FFFC
      F500FFF5EF00FFFFF900FFFFF700AA9E94000000000000000000000000000000
      000000000000000000000000000000000000000000008EC2E100509CC6008BE6
      FC008BE6FC008EC2E100CCEFF900000000000000000000000000000000000000
      0000D3D1FF000C79AB00609BED0026A8CB0040B5E10066ACF600509EE4004D9C
      E10000000000000000000000000000000000000000000000000009094E000707
      40000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000FFFEFF00E4FCFF005F99F8005191
      FD00043F85003F81E0003D74CF006C7E8F00FFF9F000937C6C00987A6700977A
      6B0099837800FFF5EA00FFFFF100B09E8700000000000000000000000000F6E3
      CC00F0D0B100C9C0B700CCEFF900000000000000000045769A0062C0EC008BE6
      FC008EC2E1000000000000000000000000000000000000000000000000000000
      000000000000CCCAFF000F7CAC000F7CAC006BC3FF0075B1FF0075B1FF000000
      0000000000000000000000000000000000000000000015157900070741001515
      79001A1A7D000000FF000000FF000000FF000000FF000000FF000000FF000000
      000000000000000000000000000000000000FFFFF400F3FFFF003A67B1002C58
      A500BADCFF003364AE005E8BD400F2FDFF00E7E5EB0080737100937F7A008E7C
      7B00796E7100F7F0F300F8F2ED00A29A8D0000000000000000009F8072008375
      6F00A99D9200C9C0B700A99D9200A99D92009F807200C9C0B70076A0B9008EC2
      E100000000000000000000000000000000000000000000000000000000000000
      000000000000CCCAFF00629CF00026A8CA006BC3FF0086BDFF00000000000000
      00000000000000000000000000000000000000000000080844001E1E81001818
      7C00060639000B0B63000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000FFFFED00FBFEFF008AAADF00324E
      84005767840030548A005274A900FAFEFF00F0F2FD00FFFDFF00FFFDFE00FFF9
      FC00FFFCFF00FBFAFF00FFFEFE00A7A39E000000000083756F009F8072000000
      0000000000000000000000000000F6E3CC00F0D0B100C9C0B700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDCFF00DEDCFF00629CF00026A8CA006BC3FF007EB9FF00000000000000
      00000000000000000000000000000000000018187C0041419B00383895001717
      7B0003031F000000FF000000FF000000FF000000FF000000FF000000FF004646
      9E006767B3006767B3006F6FB80000000000FFFFE300FEF2F800BDC8D6003332
      3400B7A9B4007B879900C1D2DB00FFFEFE00FFFDFF00FFFFFB00FFFFF800FFF4
      F100FFFCFF00FFFEFF00FBF3EC00B6AB9D00C9C0B70083756F00F0D0B100F6E3
      CC00000000000000000000000000F6E3CC00F0D0B100F0D0B100000000000000
      0000000000000000000000000000000000000000000000000000599BEA00559D
      E7005DA7EF0000000000AEBDFF0000000000000000002889C200000000005F9D
      ED000000000062A9F4006EAEFE0000000000B7936600ECD1B000ECBF8C00E5AA
      65000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF001C925E00FFFFFF00B999710000000000FFFFE400FFFAFF007A7F8200433A
      2D00BDA7AC00B1B4BC00646F6C00FFFDFE00FFFFF800FFFFF100FFFCE800FFFF
      F100FFFFF500FFFFF500FFFFF000A792770083756F00DEA68700E9BB9C00F6E3
      CC00F6E3CC00F6E3CC00F6E3CC00F6E3CC00E9BB9C00C9C0B700CCEFF9000000
      000000000000000000000000000000000000CCCAFF002988C200198EB900198E
      B9005AA4EC005AA4EC0000000000000000000000000000000000CCCAFF001B95
      BE003EA4DA007FBFFF007FBFFF0073B0FF00BC9A7100F1DABF00EDC494000000
      FF000000FF000000FF000000FF0000000000D1BA9E000000FF000000FF000000
      FF000000FF009F743E00CFCFCF0000000000FFFFE500F6F7FF00737877006153
      3D00D1BEC700C1C4C8006A746800FFFDFF00FFFFF100FFFFEB00FFFFE700FFFB
      E100FFFFF000FFFFF000FFFFEA00B49876009F807200DEA68700DEA68700F0D0
      B100F0D0B100F0D0B100F0D0B100E9BB9C00E9BB9C00A99D9200CCEFF9000000
      000000000000000000000000000000000000CCCAFF000877A70025B5CD0041D0
      E90092E1FF0075B2FF0000000000000000000000000000000000C2C6FF002384
      BD006CDAFF0091E3FF0086BCFF006EAEFE00C3A47D00EEE0CF000000FF000000
      FF000000FF000000FF000000000000000000E1D3C1001FAC4A000000FF000000
      FF000000FF000000FF001341A200CFCFCF00FFF6E000F1F6FF008A8F9000B1A4
      8E0054465100696D7200858E8400FFFBFF00F2E1D800B7A18F00B59D8500C0AF
      9A00AA9F9100FFF6E800FFFAE500B39B7F009F807200DEA68700E9BB9C00F0D0
      B100F6E3CC00F6E3CC00F6E3CC00F6E3CC00F0D0B100E9BB9C00CCEFF9000000
      000000000000000000000000000000000000BAC2FF00BAC2FF0026B7CF0031CC
      DD006EDAFF004E9BE10000000000B6CBFF00C4CCFF00639DF100639DF1000F7B
      AC006CDAFF0091E3FF00B4DBFF0000000000000000000000FF000000FF000000
      FF000000FF00000000000000000000000000000000001D985A00C19E74000000
      FF000000FF000000FF000000FF00CAC8C600FFFFEE00E1ECFF00BAC0C500ADA1
      8F009E96A000666C730082898200F9FBFF00FFFEFF00FFFDF700FFFFF400FFF9
      F000FDFBFA00FFFFFE00FFFBF100B6A69600DEA68700A99D9200F0D0B100F6E3
      CC00F6E3CC000000000000000000F6E3CC00F6E3CC00F0D0B100000000000000
      000000000000000000000000000000000000000000002585BF000273A10031CC
      DD0065CDFF0065CDFF00489DDF00157DB10040C9E7000575A300208EBD0063D8
      FF0087E0FF00BDE9FF0056A3EA006CAEFC000000FF000000FF000000FF000000
      FF000000000000000000000000000000000000000000FFFFFF00B7936600B28C
      5C000000FF000000FF000000FF00A1733B00FFFFE300F1FDFF00FFFEFF00F6E3
      D400817F7E00A4A4A400FDF4EA00FFFEFA00FFFBFF00FFFBFB00FFFCF500FFFE
      FA00EDF4F700F9FCFF00FFFFFC00AD9E9500F6E3CC00A99D9200F0D0B100F6E3
      CC0000000000F6E3CC00F6E3CC0000000000F0D0B100F0D0B100000000000000
      00000000000000000000000000000000000000000000000000000273A1000F7B
      AD0031CCDD004AD2F00031CCDD0031CCDD0040C9E7003BCEE40076DCFF0063D8
      FF00ADDFFF0059A4ED0056A3EA00000000000000FF000000FF000000FF000000
      00000000000000000000000000000000000000000000B9966A00000000001446
      9D000000FF000000FF000000FF00925B1700FFFFDC00F0FBF800F7EDED00FFFF
      F100F3F3E700FFFFFC00FFFEF100FFFFF400FEF3F500FFFFF800FFFFF500FFFD
      F200F8FCF700FFFFFC00FFF9EF00A89685000000000000000000C9C0B700F0D0
      B100F6E3CC000000000000000000C9C0B700C9C0B70000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005AA5
      ED00117FAE001A98BE00199DBE00199DBE002EC2D80061CEFF0061CEFF009ED4
      FF006EAEFE0065ABF60000000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF00B1895700C3A581006C4005002C321B003C2922005332
      1E0036341C003E3226004224110042331200442A1A004A2F1500482F0F00412F
      12003F331B0040321C004F341900FFFFE300000000000000000000000000C9C0
      B700C9C0B700F0D0B100C9C0B700F6E3CC000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000002A8CC4001881B50000000000318DC90056A2E9000000
      00006EAEFE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005AA773000F7D3300027527002587
      4500BAC4BD00CCCCCC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF010110FF0A0A92FF0B0C
      9FFF0C0CACFF0D0DB8FF0E0EC4FF0E0ECBFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063AB7A00118134001EAA4A002CC55D0031CE630026B9
      550008792D00BAC4BD00CCCCCC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF000003FF090A87FF0B0A
      93FF0C0BA0FF0C0CACFF0D0DB9FF0E0EC5FF0000000000000000000000000000
      0000BFBFBF007F7F7F00000000000000000000000000404040007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000002A8E4A001A9A440031CE630031CE630031CE630031CE630031CE
      630025B75300298A4800D5D5D500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000FF000000FF000000FF000000FF020221FF09097CFF0909
      88FF0B0A94FF0B0BA1FF0D0CADFF0D0DBAFF0000000000000000000000004040
      4000000000000000000000000000404040000000000000000000000000000000
      0000BFBFBF000000000000000000000000000000000000000000000000000000
      000018833B00199F440031CE63004AD4760065CF87006EDC910041D26F0041D2
      6F0019903F00599D700000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000141461FF080870FF0808
      7CFF0A0A88FF0A0B96FF0B0BA2FF0C0CAEFF0000000000000000404040000000
      0000000000007F7F7F00000000000000000000000000BFBFBF00404040000000
      000000000000BFBFBF000000000000000000000000000000000000000000318F
      4F002EC45E0031CE630047CD7200489F65004E9D670095CBA60092E3AC003FA6
      6100559F6D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000141554FF060658FF070764FF0808
      70FF09097DFF090A8AFF0B0B96FF0B0CA3FF000000007F7F7F00000000000000
      0000BFBFBF000000000000000000000000000000000000000000000000004040
      400000000000000000000000000000000000000000000000000056A46F0061D0
      85003BD06A0040CB6D00157F3700B6CDBD000000000075B489005AA672005DA9
      7500000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000012133EFF040440FF06054DFF060759FF0708
      65FF080872FF09097EFF0A0A8AFF0B0A98FF000000000000000000000000BFBF
      BF00000000000000000000000000000000000000000000000000000000000000
      000040404000000000007F7F7F00000000000000000068AD7E009ED6B00076DE
      97003FCB6C0005772900C4CEC700000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000100090000000000000000000000
      0000000000000505440006064E0007075A000000000000000000000000000000
      00000000000000000000111129FF030228FF030434FF040540FF06064DFF1616
      61FF16166EFF080973FF090980FF0A0A8CFFBFBFBF0000000000404040000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000BFBFBF000000000040404000000000006EB08400B5D9C00098E6B10063DA
      880020904300639F770000000000000000000000000000000000AEBFB300CCCC
      CC00DEDEDE000000000000000000000000000000000000000000000000000000
      000000000000000000000000000001010A000201160003022200000000000000
      0000000000000606500007075B00080866000000000000000000000000000000
      00000000000010101BFF01010FFF02021CFF030329FF040336FF13144AFF0000
      0000151662FF080767FF080873FF090980FF7F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000065AD7C00ADE1BE00A9EBBE0070DB
      93000F7D3200C2C8C400CECECE000000000000000000047628000F7E3200629E
      7600CCCCCC00DEDEDE0000000000DFDFDF000000000000000000000000000000
      0000000000000000000000010C00020217000202230003032E0004043A000000
      00000000000006065C0007086800080873000000000000000000000000000000
      0000101018FF000000FF000005FF010111FF02021DFF121234FF000000000000
      0000151558FF06075CFF070869FF080974FF7F7F7F0000000000BFBFBF000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000040404000000000000000000059A67300ACE7BE0087E2A40063DA
      89001E9F470023864300CCCCCC0000000000288B480034AC5B0026AA50000F7E
      3200629E7600CCCCCC0043945D00D3D3D3000000000000000000000000000000
      00000000000000000000000000000202240004042F0004043B00050547000505
      5200000000000808690008087400090980000000000000000000000000001010
      18FF000000FF000000FF000000FF000005FF111123FF00000000000000000000
      000014134DFF060650FF06075DFF070769FF7F7F7F00000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000056A57000BDEBCC0091E5AC006CDC
      90003CD16C001B9744005F9F73000000000076B48A007EBB91006BC5880026AA
      50000F7E3200609D73000C7B3100B3C1B8000000000000000000000000000000
      00000000000000000000000000000000000004043C0005054700060553000607
      5E0007076A00090875000A0981000A0A8C000000000000000000101017FF0000
      00FF000000FF000000FF000000FF101018FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F00000000007F7F7F00000000006CB08200B4DDC100C3F1D20091E5
      AC003EA660004697600000000000000000000000000077B58B0086BF99006BC5
      880026AA510016873B00178B3C0080AB8E000000000000000000000000000000
      000000000000000000000000000000000000000000000606540007075F000807
      6B0009097600090981000A0A8D000B0A990000000000101017FF000000FF0000
      00FF000000FF000000FF101018FF000000000000000000000000000000000000
      0000000000000000000000000000000000000000000040404000000000004040
      400000000000000000000000000000000000000000000000000000000000BFBF
      BF000000000000000000BFBFBF0000000000000000006EB0840086BE99007FC1
      950062AB7A00000000000000000000000000000000000000000075B38A0066AE
      7C0040B7670029AE540015903D0065A378000000000000000000000000000000
      000000000000000000000000000000000000000000000000000008076C000808
      7700090982000A0A8E000B0B9A000C0CA500101016FF000000FF000000FF0000
      00FF000000FF101017FF00000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BFBFBF00000000000000
      0000404040000000000000000000000000000000000000000000BFBFBF000000
      000000000000404040000000000000000000000000000000000073B288006EB0
      840000000000000000000000000000000000000000000000000050A06A00469B
      620079CC940060C380001C9B4500429A5F000000000000000000000000000000
      0000000000000000000006064A00060655000707610008086D00080978000A09
      83000A0A90000B0B9B000C0CA6000C0CB100000000FF000000FF000000FF0000
      00FF101017FF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BFBFBF000000
      000000000000000000007F7F7F00BFBFBF007F7F7F0040404000000000000000
      0000404040000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000074B388004D9E67004599
      600057A3700076B58A0050A66C001C843E000000000000000000000000000000
      00000000000000000000060757000707620007086E0008087A00090A84000A0A
      90000B0B9B000C0CA7000C0DB3000D0EBF00000000FF000000FF000000FF1010
      16FF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BFBF
      BF00404040000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000707630008086F0009097A00090A85000A0B91000B0B
      9D000C0CA9000D0DB3000E0EBF000E0FCB00000000FF000000FF101016FF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F007F7F7F007F7F7F00BFBFBF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000092C070040734B0040734B0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C3A58100A578420098652800A784
      5A00C7C3BE00CDCDCD0000000000000000000000000000000000000000000000
      00000000000000000000000000003550B400203A96001D3690001F389300203A
      9600000000000000000000000000000000000000000000000000000000000000
      000023532F00C0F7DB00C0F7DB00C0F7DB00C0F7DB00C0F7DB0082CA95000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C3A5810091591600AE732C00C8883D00D2914400B478
      2E00935E1E00C8C4C000CDCDCD00000000000000000000000000000000000000
      00000000000000000000223D9D00223D9D00304EBB003757CA003D5FD7002E4B
      B500203A96000000000000000000000000000000000000000000000000002353
      2F00C0F7DB00C0F7DB008EDCA900C0F7DB00C0F7DB0082CA95008EDCA90082CA
      950000000000000000000000000000000000040201000E060600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B28A5900A56C2900DB994C00E29F5100E29F5100E29F5100E29F
      5100B4762D00A2784500D0D0D000000000000000000000000000000000000000
      000000000000203A9A00203B9B004365E2005177FF005177FF005177FF005177
      FF003353C1001E378E0000000000000000000000000000000000518D5F0082CA
      95008EDCA9008EDCA9008EDCA9008EDCA9008EDCA90068C4870068C4870047BA
      6B0061A76B0000000000000000000000000000000000190B0900240F0E000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A87B4300B0742E00E29F5100E4A55D00E7B07100E8B37400E3A25600E4A4
      5B00AF732D00A279470000000000000000000000000000000000000000000000
      0000213C9C002B48B0004F75FB005177FF006083FF006486FF005278FF00567B
      FF003655C700203A960000000000000000000000000061A76B0068C4870047BA
      6B0068C4870068C4870023532F00000000000000000030A44A0047BA6B0068C4
      870047BA6B00276F3600000000000000000000000000000000002E1412003919
      1700000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A06F
      3300B3762D00E29F5100E2A66100BB905C00AB815000DCC1A200EEC79900BC88
      4A00A2764000000000000000000000000000000000000000000000000000223C
      9E00304EBB005177FF005F82FF00647CD0005165B0009FAEE4008AA3FF004B67
      CD00233C9A0000000000000000000000000000000000518D5F0068C4870068C4
      870082CA95000000000000000000000000000000000000000000276F360030A4
      4A0047BA6B0030A44A000000000000000000000000000000000000000000431D
      1B004E221F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000AA7D4600B376
      2D00E29F5100DDA15B00A4743800B090690000000000BB9A7100CEB18D00AB80
      4A00000000000000000000000000000000000000000000000000213C9D00314F
      BC005177FF005E80FC004B64BF002E459800000000005165B000A3B1E300334B
      A30000000000000000000000000000000000000000000000000068C4870068C4
      870082CA950061A76B0023532F0000000000000000000000000000000000328C
      3D0030A44A00328C3D0000000000000000000000000000000000000000000000
      000059262300642B270000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000BB986E00B1753100E29F
      5100E1A257009A652300C5BAAC00000000000000000000000000DDCDB8000000
      000000000000000000000000000000000000000000001F3998002D4AB4005177
      FF00597DFF003550B4001E36890000000000000000000000000028419D000000
      000000000000000000000000000000000000000000000000000082CA950068C4
      870040734B00000000000000000000000000000000000000000000000000276F
      3600328C3D00328C3D0000000000000000000000000000000000000000000000
      0000000000006D302B000000CC00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A4753B00E4A65F00E3A2
      5500A86F2A00A8865E0000000000000000000000000000000000000000000000
      00000000000000000000000000000000000028419D00334CA100587BF800567B
      FF003353C1001F378F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000276F
      360047BA6B0030A44A0000000000000000000000000000000000000000000000
      000000000000000000006666FF000000CC000000000000000000000000000000
      0000000000002B2322000000000000000000BD9B7000D8BA9400E9B77D00DFA0
      55008E561300CCCCCC00D1D1D1000000000000000000C4A88500BBAA9500C1B7
      AB00CAC8C600CAC8C600CCCCCC000000000028419D008094D9006F8EFF005579
      FC001E3997000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000518D5F0047BA6B0047BA
      6B0040734B0000000000000000000000000000000000276F36008EDCA90068C4
      870047BA6B0047BA6B0000000000000000000000000000000000000000000000
      00000000000000000000000000006666FF000000CC0000000000000000000000
      000000000000383131002D24230000000000B7936600ECD1B000ECBF8C00E5AA
      6500AF753000A2784500CCCCCC0000000000BD9D7400B2732800A26A26009760
      1C008C540F00915B1900B9997100000000005367B3009BAEF4007B98FF005F82
      FF002D49AF001C3488000000000000000000000000001F3999001F3A9A001E37
      94001E3794001E3794001B348B000000000000000000276F360030A44A0047BA
      6B0061A76B0000000000000000000000000000000000276F360030A44A0082CA
      950047BA6B0030A44A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006666FF000000CC00000000000000
      0000514C4C00453F3E003933320000000000BC9A7100F1DABF00EDC49400E8B2
      7400E3A15500AA712C00BB9A710000000000D1BA9E00C2976300DB964600DB96
      46009A6320009F743E00CFCFCF00000000006275B800AEBEF900819CFF00698A
      FF005377FC002A46AD001C32840000000000000000001F3B9D002B50D8002B50
      D8002B50D8002B50D8001F39980000000000000000000000000068C4870047BA
      6B0082CA950061A76B0000000000000000000000000040734B0082CA95008EDC
      A90047BA6B0068C48700276F3600000000000000000000000000000000000000
      000000000000000000000000000000000000000000006666FF00000000006A67
      66005E5A5900000000000000000000000000C3A47D00EEE0CF00F4DABC00EDC3
      9200BC8749009C6D32000000000000000000E1D3C100BC966800E3AE7100DB96
      4600AF7129009F723B00CAC8C600CFCFCF005267B200C4CEF400A5B9FF007E9A
      FF005779F3001F3A9700000000000000000000000000314AA4005E7BE400315B
      F400315BF4002F58EC001F39980000000000000000000000000030A44A0068C4
      870082CA950082CA950082CA95007BAB86007BAB860082CA95008EDCA9008EDC
      A9008EDCA900276F3600518D5F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000828282007675
      75000000000000000000000000000000000000000000C8AD8B00EDE0D100E0C8
      AD00B188560000000000000000000000000000000000B18A5A00C19E7400D4B2
      8900DB964600AF7129009D6F3700CAC8C60000000000465CAC00CBD3F000A5B3
      E600374FA40000000000000000000000000000000000314AA4005E7BE400315B
      F400315BF4002F58EC001F39990000000000000000000000000000000000518D
      5F008EDCA9008EDCA9008EDCA900C0F7DB007BAB860082CA95008EDCA9008EDC
      A900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000091919100000000000000
      0000000000000000000000000000000000000000000000000000C8AD8B00BE9E
      75000000000000000000000000000000000000000000A2753D00B7936600B28C
      5C00D9BD9900DB964600AF712900A1733B0000000000000000004057A800465C
      AC0000000000000000000000000000000000000000003A52A70094A7ED008098
      F2008098F2004367EC001F399900000000000000000000000000000000000000
      00007BAB8600C0F7DB008EDCA90082CA95008EDCA9008EDCA90082CA95002353
      2F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009091910091919100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B9966A00000000000000
      0000B28A5A00DCC2A000D7964A00925B17000000000000000000000000000000
      000000000000000000000000000000000000000000002D46A000556AB2005468
      B1005468B1004157A900243F9F00000000000000000000000000000000000000
      00000000000040734B00518D5F007BAB8600518D5F0040734B0023532F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B28A5A00B1895700C3A581000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000
      FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFF80000000FFFFFFFF00000000
      F1C7FF7F00000000F88FFE3F00000000FC1FFC1F00000000FE3FF88F00000000
      FF7FF1C700000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00010000FFFFFFFFFFFF000000000000FFF1FEFF00000000FFF1FC7F
      00000000FFE0F83F00000000FF80F01FE0070000FF81F00FC00F0000E187F81F
      801F0000C00FF83F803F00009E3FF03F000100000E3FC5A900010000001F03C0
      01010000001F03C003000000001F020187800000063F80000F800000093FC001
      1FA00000C67FE0033FF80000E0FFFC97FF031FFFF800FFFFFC010FFFF800F01F
      F80107FFF800E007F00383FFFF80C383E007C1FFFF0087E3C08FE0FFFE008CF1
      81FFF078FC001EF103C7F838F8101EF90182FC18F0301EF90100FE08E0701FF9
      0100FF00C0FF9F710380FF8081FF8FE187C0FFC003FF87C3CFC0FC0007FFC007
      FF80FC000FFFE00FFFFFFC001FFFFC3FFC7FFFFFFF03FE0FF01FBFFFFC01FC07
      E00F1FFFF801F803C0070FFFF003F003818387FFE007E00787C3C3FFC08FC08F
      C1E3E1FF81DF81DFC7E3F1FF83FF03FFFFE3FCFB018107FF8783FE7101010381
      8783FF3101010181C381FF8703000381C001FF8787808781E00FFF8FCF80CF81
      F00FFC1FFFB0FF81F81FFC7FFFF8FFFF00000000000000000000000000000000
      000000000000}
  end
  object OneInstance: TBomeOneInstance
    Left = 416
    Top = 216
  end
  object SocketConnect: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = SocketConnectTimer
    Left = 256
    Top = 280
  end
  object ImgDlg: TOpenDialog
    Filter = 'jpg|*.jpg; *.JPG'
    Left = 320
    Top = 280
  end
  object wakeup: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = wakeupTimer
    Left = 224
    Top = 280
  end
  object telnet: TTnCnx
    Port = '49000'
    Host = 'fritz.box'
    Location = 'TNCNX'
    TermType = 'VT100'
    LocalEcho = True
    OnSessionConnected = UPNPSessionConnected
    OnSessionClosed = UPNPSessionClosed
    OnDataAvailable = UPNPDataAvailable
    OnDisplay = UPNPDisplay
    OnSendLoc = UPNPSendLoc
    Left = 416
    Top = 248
  end
  object StartupTimer: TTimer
    Enabled = False
    OnTimer = StartupTimerTimer
    Left = 224
    Top = 248
  end
  object WaitForReconnect: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = WaitForReconnectTimer
    Left = 256
    Top = 248
  end
  object ConnectCheck: TTimer
    Enabled = False
    Interval = 8000
    OnTimer = ConnectCheckTimer
    Left = 288
    Top = 248
  end
  object Ping1: TPing
    Size = 56
    Timeout = 4000
    TTL = 64
    Flags = 0
    Left = 384
    Top = 248
  end
  object UPNPTimer: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = UPNPTimerTimer
    Left = 224
    Top = 312
  end
end
