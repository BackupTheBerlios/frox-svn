object PBMessage: TPBMessage
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'PBMessage'
  ClientHeight = 313
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 371
    Height = 313
    Align = alClient
  end
  object Label1: TLabel
    Left = 56
    Top = 16
    Width = 237
    Height = 13
    Align = alCustom
    Caption = 'This phonebook entry already exists. Overwrite ?'
  end
  object Label2: TLabel
    Left = 176
    Top = 48
    Width = 15
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 176
    Top = 96
    Width = 15
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 176
    Top = 152
    Width = 15
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 176
    Top = 200
    Width = 15
    Height = 25
    Caption = '>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BitBtn1: TBitBtn
    Left = 48
    Top = 232
    Width = 75
    Height = 25
    Caption = 'old entry'
    ModalResult = 6
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 240
    Top = 232
    Width = 75
    Height = 25
    Caption = 'new entry'
    ModalResult = 7
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object o1: TLabeledEdit
    Left = 32
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'name'
    ReadOnly = True
    TabOrder = 2
  end
  object o2: TLabeledEdit
    Left = 32
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'phone number'
    ReadOnly = True
    TabOrder = 3
  end
  object o3: TLabeledEdit
    Left = 32
    Top = 152
    Width = 121
    Height = 21
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'short dial'
    ReadOnly = True
    TabOrder = 4
  end
  object o4: TLabeledEdit
    Left = 32
    Top = 200
    Width = 121
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'vanity code'
    ReadOnly = True
    TabOrder = 5
  end
  object n1: TLabeledEdit
    Left = 216
    Top = 56
    Width = 121
    Height = 21
    EditLabel.Width = 26
    EditLabel.Height = 13
    EditLabel.Caption = 'name'
    TabOrder = 6
  end
  object n2: TLabeledEdit
    Left = 216
    Top = 104
    Width = 121
    Height = 21
    EditLabel.Width = 69
    EditLabel.Height = 13
    EditLabel.Caption = 'phone number'
    TabOrder = 7
  end
  object n3: TLabeledEdit
    Left = 216
    Top = 152
    Width = 121
    Height = 21
    EditLabel.Width = 44
    EditLabel.Height = 13
    EditLabel.Caption = 'short dial'
    ReadOnly = True
    TabOrder = 8
  end
  object n4: TLabeledEdit
    Left = 216
    Top = 200
    Width = 121
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'vanity code'
    TabOrder = 9
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 272
    Width = 297
    Height = 17
    Caption = 'remember decision'
    TabOrder = 10
  end
end
