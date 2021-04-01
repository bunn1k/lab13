object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Virtual Methods Table'
  ClientHeight = 317
  ClientWidth = 452
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 452
    Height = 57
    Align = alTop
    Caption = 'VMT'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 57
    Width = 452
    Height = 208
    Align = alCustom
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 271
    Width = 169
    Height = 38
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' VMT '#1086#1073#1098#1077#1082#1090#1072' '#1082#1083#1072#1089#1089#1072' T3'
    TabOrder = 2
    WordWrap = True
    OnClick = Button2Click
  end
end
