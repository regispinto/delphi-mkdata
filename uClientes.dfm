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
    TabOrder = 0
    object SpeedButton1: TSpeedButton
      Left = 622
      Top = 30
      Width = 23
      Height = 22
    end
    object edtPesquisa: TEdit
      Left = 24
      Top = 31
      Width = 385
      Height = 21
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 415
      Top = 6
      Width = 185
      Height = 75
      Caption = 'Status'
      ItemIndex = 1
      Items.Strings = (
        'Todos'
        'Ativos'
        'Inativos')
      TabOrder = 1
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 456
    Width = 762
    Height = 43
    Align = alBottom
    TabOrder = 1
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 240
    Width = 762
    Height = 216
    Align = alClient
    TabOrder = 2
    ExplicitTop = 219
    ExplicitHeight = 231
  end
  object pnlMaster: TPanel
    Left = 0
    Top = 96
    Width = 762
    Height = 144
    Align = alTop
    TabOrder = 3
    ExplicitTop = 81
    object BitBtn1: TBitBtn
      Left = 622
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Incluir'
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 622
      Top = 71
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
    end
    object BitBtn3: TBitBtn
      Left = 622
      Top = 102
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
  end
end
