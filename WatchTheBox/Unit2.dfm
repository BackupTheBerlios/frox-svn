object CallIn: TCallIn
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'CallIn'
  ClientHeight = 109
  ClientWidth = 353
  Color = 14600382
  TransparentColorValue = clMoneyGreen
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
    353
    109)
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 102
    Top = 0
    Width = 251
    Height = 109
    Align = alClient
    Anchors = [akTop, akRight]
    Shape = bsFrame
    Style = bsRaised
  end
  object info2: TLabel
    Left = 122
    Top = 32
    Width = 52
    Height = 19
    Anchors = [akTop, akRight, akBottom]
    Caption = 'InfoNr'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object info3: TLabel
    Left = 123
    Top = 72
    Width = 24
    Height = 13
    Anchors = [akTop, akRight, akBottom]
    Caption = 'info3'
  end
  object Date: TLabel
    Left = 315
    Top = 37
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Anchors = [akTop, akRight, akBottom]
    Caption = 'Date'
  end
  object duration: TLabel
    Left = 264
    Top = 65
    Width = 72
    Height = 19
    Anchors = [akTop, akRight]
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
    Width = 102
    Height = 109
    Align = alLeft
    Anchors = [akTop, akRight, akBottom]
    Center = True
    Proportional = True
  end
  object BitBtn1: TBitBtn
    Left = 280
    Top = 104
    Width = 65
    Height = 24
    Anchors = [akTop, akRight]
    Caption = 'ok'
    TabOrder = 0
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object topbox: TCheckBox
    Left = 112
    Top = 104
    Width = 81
    Height = 24
    Anchors = [akTop, akRight]
    Caption = 'stay on top'
    TabOrder = 1
    OnClick = topboxClick
  end
  object Panel: TPanel
    Left = 103
    Top = 1
    Width = 249
    Height = 25
    Anchors = [akTop, akRight]
    BevelKind = bkFlat
    BevelOuter = bvNone
    TabOrder = 2
    object Calltype: TLabel
      Left = 8
      Top = 4
      Width = 70
      Height = 13
      Caption = 'Incoming Call: '
    end
    object info4: TLabel
      Left = 113
      Top = 4
      Width = 24
      Height = 13
      Caption = 'info4'
    end
    object Bright: TButton
      Left = 221
      Top = 2
      Width = 18
      Height = 17
      Caption = '>'
      TabOrder = 0
      OnClick = BrightClick
    end
    object Bleft: TButton
      Left = 201
      Top = 2
      Width = 18
      Height = 17
      Caption = '<'
      TabOrder = 1
      OnClick = BleftClick
    end
  end
  object reject: TBitBtn
    Left = 208
    Top = 104
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
    Left = 184
    Top = 40
  end
  object durationTimer: TTimer
    Enabled = False
    OnTimer = durationTimerTimer
    Left = 160
    Top = 32
  end
end
