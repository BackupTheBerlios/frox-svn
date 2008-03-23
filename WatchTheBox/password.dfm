object PWForm: TPWForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'PWForm'
  ClientHeight = 77
  ClientWidth = 227
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 0
    Top = 0
    Width = 227
    Height = 77
    Align = alClient
  end
  object passlabel: TLabel
    Left = 16
    Top = 8
    Width = 71
    Height = 13
    Caption = 'your password'
  end
  object PWEdit: TEdit
    Left = 16
    Top = 24
    Width = 137
    Height = 21
    PasswordChar = '*'
    TabOrder = 0
  end
  object savePwd: TCheckBox
    Left = 16
    Top = 51
    Width = 97
    Height = 17
    Caption = 'save password'
    TabOrder = 1
  end
  object BitBtn1: TBitBtn
    Left = 160
    Top = 24
    Width = 51
    Height = 21
    Caption = 'Send'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = BitBtn1Click
    NumGlyphs = 2
  end
  object BitBtn2: TBitBtn
    Left = 160
    Top = 24
    Width = 51
    Height = 21
    Caption = 'Send'
    Default = True
    ModalResult = 1
    TabOrder = 3
    OnClick = BitBtn2Click
    NumGlyphs = 2
  end
end
