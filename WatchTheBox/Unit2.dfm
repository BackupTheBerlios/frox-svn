object CallIn: TCallIn
  Left = 0
  Top = 0
  AlphaBlendValue = 1
  Anchors = [akTop]
  BorderStyle = bsToolWindow
  Caption = 'CallIn'
  ClientHeight = 107
  ClientWidth = 352
  Color = 14600382
  TransparentColorValue = clMoneyGreen
  Constraints.MinWidth = 252
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    352
    107)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 105
    Top = 0
    Width = 247
    Height = 107
    Align = alClient
    Shape = bsFrame
    Style = bsRaised
  end
  object info2: TLabel
    Left = 120
    Top = 32
    Width = 52
    Height = 19
    Caption = 'InfoNr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object info3: TLabel
    Left = 120
    Top = 71
    Width = 23
    Height = 13
    Caption = 'Hallo'
  end
  object Date: TLabel
    Left = 309
    Top = 37
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight, akBottom]
    Caption = 'Date'
  end
  object duration: TLabel
    Left = 263
    Top = 64
    Width = 72
    Height = 19
    Alignment = taRightJustify
    Anchors = [akTop, akRight, akBottom]
    Caption = '00:00:00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 105
    Height = 107
    Align = alLeft
    Center = True
    Proportional = True
    Visible = False
  end
  object number: TLabel
    Left = 120
    Top = 52
    Width = 37
    Height = 13
    Caption = 'Number'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 279
    Top = 98
    Width = 65
    Height = 24
    Anchors = [akTop, akRight]
    Caption = 'ok'
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object topbox: TCheckBox
    Left = 117
    Top = 96
    Width = 80
    Height = 24
    Caption = 'stay on top'
    TabOrder = 1
    OnClick = topboxClick
  end
  object Panel: TPanel
    Left = 104
    Top = 0
    Width = 248
    Height = 21
    Anchors = []
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      244
      17)
    object Calltype: TLabel
      Left = 0
      Top = 2
      Width = 70
      Height = 13
      Caption = 'Incoming Call: '
    end
    object info4: TLabel
      Left = 127
      Top = 2
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'info4'
    end
    object Bright: TButton
      Left = 185
      Top = 0
      Width = 18
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '>'
      TabOrder = 0
      OnClick = BrightClick
    end
    object Bleft: TButton
      Left = 162
      Top = 0
      Width = 18
      Height = 17
      Anchors = [akTop, akRight]
      Caption = '<'
      TabOrder = 1
      OnClick = BleftClick
    end
  end
  object reject: TBitBtn
    Left = 207
    Top = 98
    Width = 65
    Height = 24
    Anchors = [akTop, akRight]
    Caption = 'reject'
    TabOrder = 3
    OnClick = rejectClick
    Kind = bkNo
  end
  object Timer: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = TimerTimer
    Left = 216
    Top = 32
  end
  object durationTimer: TTimer
    Enabled = False
    OnTimer = durationTimerTimer
    Left = 184
    Top = 32
  end
end
