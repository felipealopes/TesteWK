object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TesteWK'
  ClientHeight = 416
  ClientWidth = 704
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 704
    Height = 65
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Button1: TButton
      Left = 120
      Top = 21
      Width = 145
      Height = 25
      Caption = 'gravar'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 65
    Width = 704
    Height = 351
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 704
      Height = 73
      Align = alTop
      BevelOuter = bvNone
      Color = clInfoBk
      ParentBackground = False
      TabOrder = 0
    end
    object TPanel
      Left = 0
      Top = 73
      Width = 704
      Height = 64
      Align = alTop
      BevelOuter = bvNone
      Color = clActiveBorder
      ParentBackground = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 0
      Top = 137
      Width = 704
      Height = 214
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 704
        Height = 214
        Align = alClient
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
  end
end
