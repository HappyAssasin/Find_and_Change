object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Find and Change'
  ClientHeight = 373
  ClientWidth = 508
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 0
    Top = 131
    Width = 508
    Height = 242
    Align = alClient
    Caption = #1051#1086#1075' '#1088#1072#1073#1086#1090#1099
    TabOrder = 0
    object Memo1: TMemo
      Left = 2
      Top = 15
      Width = 504
      Height = 206
      Align = alClient
      Lines.Strings = (
        'Memo1')
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object StatusBar1: TStatusBar
      Left = 2
      Top = 221
      Width = 504
      Height = 19
      Panels = <
        item
          Alignment = taCenter
          Width = 500
        end>
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 508
    Height = 131
    Align = alTop
    BevelInner = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 105
      Height = 13
      Caption = #1060#1072#1081#1083' '#1076#1083#1103' '#1086#1073#1088#1072#1073#1086#1090#1082#1080
    end
    object Label3: TLabel
      Left = 176
      Top = 54
      Width = 84
      Height = 13
      Caption = #1053#1072' '#1095#1090#1086' '#1079#1072#1084#1077#1085#1103#1077#1084
    end
    object Label2: TLabel
      Left = 8
      Top = 54
      Width = 49
      Height = 13
      Caption = #1063#1090#1086' '#1080#1097#1077#1084
    end
    object Edit1: TEdit
      Left = 8
      Top = 27
      Width = 241
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Button1: TButton
      Left = 255
      Top = 23
      Width = 26
      Height = 25
      Caption = '...'
      TabOrder = 1
      OnClick = Button1Click
    end
    object Edit3: TEdit
      Left = 164
      Top = 73
      Width = 121
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit2: TEdit
      Left = 8
      Top = 73
      Width = 121
      Height = 21
      TabOrder = 3
      Text = 'Edit2'
    end
    object Button2: TButton
      Left = 8
      Top = 100
      Width = 277
      Height = 25
      Caption = #1053#1072#1081#1090#1080' '#1080' '#1079#1072#1084#1077#1085#1080#1090#1100
      TabOrder = 4
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 291
      Top = 100
      Width = 75
      Height = 25
      Caption = #1059#1076#1072#1083#1080#1090#1100
      TabOrder = 5
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 288
    Top = 24
  end
end
