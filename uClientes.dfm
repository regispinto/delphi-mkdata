object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cadastro de Clientes'
  ClientHeight = 499
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 762
    Height = 96
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -6
    object SpeedButton1: TSpeedButton
      Left = 610
      Top = 33
      Width = 23
      Height = 22
    end
    object lblPesquisa: TLabel
      Left = 16
      Top = 19
      Width = 42
      Height = 13
      Caption = 'Pesquisa'
    end
    object edtPesquisa: TEdit
      Left = 16
      Top = 38
      Width = 385
      Height = 21
      Color = clBtnFace
      TabOrder = 0
    end
    object rbtInativos: TRadioButton
      Left = 477
      Top = 38
      Width = 60
      Height = 17
      Caption = 'Inativos'
      TabOrder = 1
    end
    object rdbAtivos: TRadioButton
      Left = 419
      Top = 38
      Width = 60
      Height = 17
      Caption = 'Ativos'
      TabOrder = 2
    end
    object rdbTodos: TRadioButton
      Left = 544
      Top = 38
      Width = 60
      Height = 17
      Caption = 'Todos'
      TabOrder = 3
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 456
    Width = 762
    Height = 43
    Align = alBottom
    Color = clSilver
    ParentBackground = False
    TabOrder = 1
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 240
    Width = 762
    Height = 216
    Align = alClient
    Color = clSilver
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 234
  end
  object pnlMaster: TPanel
    Left = 0
    Top = 96
    Width = 762
    Height = 144
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 90
  end
end
