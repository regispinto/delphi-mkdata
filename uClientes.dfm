object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 565
  ClientWidth = 817
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 817
    Height = 74
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 0
    object spbPesquisar: TSpeedButton
      Left = 730
      Top = 19
      Width = 36
      Height = 29
      Cursor = crHandPoint
      Hint = 'Clique aqui para realizar a pesquisa'
      ParentShowHint = False
      ShowHint = True
    end
    object lblPesquisa: TLabel
      Left = 16
      Top = 8
      Width = 42
      Height = 13
      Caption = 'Pesquisa'
    end
    object edtPesquisa: TEdit
      Left = 16
      Top = 27
      Width = 394
      Height = 21
      Color = clBtnFace
      TabOrder = 0
    end
    object gbxStatus: TGroupBox
      Left = 448
      Top = 8
      Width = 212
      Height = 61
      Caption = ' Status '
      TabOrder = 1
      object rdbAtivos: TRadioButton
        Left = 3
        Top = 21
        Width = 60
        Height = 17
        Caption = 'Ativos'
        TabOrder = 0
      end
      object rbtInativos: TRadioButton
        Left = 61
        Top = 21
        Width = 60
        Height = 17
        Caption = 'Inativos'
        TabOrder = 1
      end
      object rdbTodos: TRadioButton
        Left = 127
        Top = 21
        Width = 60
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 365
    Width = 817
    Height = 34
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 1
    object btnClienteIncluir: TBitBtn
      Left = 7
      Top = 4
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Clique aqui para adicionar um novo cliente'
      Caption = 'Novo'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btnClienteIncluirClick
    end
    object btnClienteGravar: TBitBtn
      Left = 88
      Top = 4
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Clique aqui para gravar os dados informados'
      Caption = 'Gravar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = btnClienteGravarClick
    end
    object btnClienteCancelar: TBitBtn
      Left = 169
      Top = 3
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Hint = 'Clique aqui para cancelar a inclus'#227'o de um novo cliente'
      Caption = 'Cancelar'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = btnClienteCancelarClick
    end
  end
  object pnlDetails: TPanel
    Left = 0
    Top = 399
    Width = 817
    Height = 166
    Align = alClient
    Color = clSilver
    ParentBackground = False
    TabOrder = 2
    object dbgListaClientes: TDBGrid
      Left = 1
      Top = 1
      Width = 815
      Height = 145
      Align = alClient
      DataSource = dsClientes
      DrawingStyle = gdsClassic
      FixedColor = clMoneyGreen
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgListaClientesCellClick
      OnDrawColumnCell = dbgListaClientesDrawColumnCell
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 146
      Width = 815
      Height = 19
      Color = clMoneyGreen
      Panels = <>
    end
  end
  object pnlMaster: TPanel
    Left = 0
    Top = 74
    Width = 817
    Height = 291
    Align = alTop
    Color = clSilver
    ParentBackground = False
    TabOrder = 3
    object lblCliente: TLabel
      Left = 16
      Top = 6
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object lblRGIE: TLabel
      Left = 131
      Top = 57
      Width = 28
      Height = 13
      Caption = 'RG/IE'
    end
    object lblDataCadastro: TLabel
      Left = 241
      Top = 58
      Width = 44
      Height = 13
      Caption = 'Cadastro'
    end
    object lblCPFCNPJ: TLabel
      Left = 16
      Top = 57
      Width = 48
      Height = 13
      Caption = 'CPF/CNPJ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object gbxTipo: TGroupBox
      Left = 448
      Top = 6
      Width = 354
      Height = 61
      Caption = ' Tipo '
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object rdbPessoaFisica: TRadioButton
        Left = 9
        Top = 21
        Width = 44
        Height = 17
        Caption = 'F'#237'sca'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        OnClick = rdbPessoaFisicaClick
      end
      object rdbPessoaJuridica: TRadioButton
        Left = 77
        Top = 21
        Width = 60
        Height = 17
        Caption = 'Jur'#237'dica'
        TabOrder = 1
        OnClick = rdbPessoaJuridicaClick
      end
    end
    object dtpDataCadastro: TDateTimePicker
      Left = 241
      Top = 76
      Width = 99
      Height = 21
      Cursor = crHandPoint
      Date = 44835.000000000000000000
      Time = 0.699267118056013700
      Checked = False
      TabOrder = 1
    end
    object dcbAtivo: TDBCheckBox
      Left = 362
      Top = 78
      Width = 48
      Height = 17
      Cursor = crHandPoint
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = dsClientes
      TabOrder = 2
    end
    object dbeNomeCliente: TDBEdit
      Left = 16
      Top = 25
      Width = 394
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME'
      DataSource = dsClientes
      TabOrder = 3
    end
    object dbeCPF_CNPJ: TDBEdit
      Left = 16
      Top = 76
      Width = 93
      Height = 21
      DataField = 'CPF_CNPJ'
      DataSource = dsClientes
      TabOrder = 4
    end
    object dbeRG_IE: TDBEdit
      Left = 131
      Top = 76
      Width = 93
      Height = 21
      DataField = 'RG_IE'
      DataSource = dsClientes
      TabOrder = 5
    end
    object gbxTelefone: TGroupBox
      Left = 16
      Top = 109
      Width = 208
      Height = 170
      Caption = ' Telefone'
      TabOrder = 6
      object spbTelefoneIncluir: TSpeedButton
        Left = 133
        Top = 33
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Hint = 'Clique aqui para incluir um novo telefone'
        ParentShowHint = False
        ShowHint = True
        OnClick = spbTelefoneIncluirClick
      end
      object spbTelefoneGravar: TSpeedButton
        Left = 156
        Top = 33
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Hint = 'Clique aqui para adicionar o telefone informado'
        ParentShowHint = False
        ShowHint = True
        OnClick = spbTelefoneGravarClick
      end
      object spbTelefoneCancelar: TSpeedButton
        Left = 180
        Top = 33
        Width = 23
        Height = 22
        Cursor = crHandPoint
        Hint = 'Clique aqui para cancelar'
        ParentShowHint = False
        ShowHint = True
        OnClick = spbTelefoneCancelarClick
      end
      object lblTelefoneDDD: TLabel
        Left = 12
        Top = 17
        Width = 21
        Height = 13
        Caption = 'DDD'
      end
      object lblTelefoneNumero: TLabel
        Left = 52
        Top = 17
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object dbgTelefones: TDBGrid
        Left = 2
        Top = 63
        Width = 204
        Height = 105
        Align = alBottom
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object dbeTelefoneNumero: TDBEdit
        Left = 52
        Top = 33
        Width = 75
        Height = 21
        TabOrder = 1
      end
      object dbeTelefoneDDD: TDBEdit
        Left = 12
        Top = 33
        Width = 35
        Height = 21
        TabOrder = 2
      end
    end
    object gbxEndereco: TGroupBox
      Left = 241
      Top = 103
      Width = 561
      Height = 170
      Caption = ' Endere'#231'o '
      TabOrder = 7
      object spbPesquisaCEP: TSpeedButton
        Left = 78
        Top = 33
        Width = 23
        Height = 21
        Cursor = crHandPoint
        Hint = 'Clique aqui para pesquisar o CEP informado'
        ParentShowHint = False
        ShowHint = True
      end
      object lblCEP: TLabel
        Left = 9
        Top = 17
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lblLogradouro: TLabel
        Left = 110
        Top = 17
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object lblNumero: TLabel
        Left = 449
        Top = 17
        Width = 37
        Height = 13
        Caption = 'N'#250'mero'
      end
      object lblComplemento: TLabel
        Left = 495
        Top = 17
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object lblBairro: TLabel
        Left = 9
        Top = 65
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object lblCidade: TLabel
        Left = 110
        Top = 65
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object lblEstado: TLabel
        Left = 447
        Top = 65
        Width = 33
        Height = 13
        Caption = 'Estado'
      end
      object lblPais: TLabel
        Left = 9
        Top = 109
        Width = 19
        Height = 13
        Caption = 'Pa'#237's'
      end
      object dbeLogadouro: TDBEdit
        Left = 110
        Top = 33
        Width = 329
        Height = 21
        TabOrder = 0
      end
      object dbeCEP: TDBEdit
        Left = 7
        Top = 33
        Width = 65
        Height = 21
        TabOrder = 1
      end
      object dbeNumero: TDBEdit
        Left = 449
        Top = 33
        Width = 40
        Height = 21
        TabOrder = 2
      end
      object dbeComplemento: TDBEdit
        Left = 495
        Top = 33
        Width = 65
        Height = 21
        TabOrder = 3
      end
      object dbeCidade: TDBEdit
        Left = 110
        Top = 80
        Width = 329
        Height = 21
        TabOrder = 4
      end
      object dbeBairro: TDBEdit
        Left = 9
        Top = 80
        Width = 92
        Height = 21
        TabOrder = 5
      end
      object dbeEstado: TDBEdit
        Left = 449
        Top = 81
        Width = 111
        Height = 21
        TabOrder = 6
      end
      object dbePais: TDBEdit
        Left = 9
        Top = 128
        Width = 92
        Height = 21
        TabOrder = 7
      end
    end
  end
  object QryClientes: TFDQuery
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTES c'
      'LEFT JOIN ENDERECOS e on e.IDCLIENTE = c.ID')
    Left = 24
    Top = 417
  end
  object dsClientes: TDataSource
    DataSet = QryClientes
    Left = 84
    Top = 417
  end
  object imgFormulario: TImageList
    Left = 152
    Top = 416
  end
end
