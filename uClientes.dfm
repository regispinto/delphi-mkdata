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
      CharCase = ecUpperCase
      Color = clBtnFace
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
    object gbxStatus: TGroupBox
      Left = 448
      Top = 8
      Width = 212
      Height = 61
      Caption = ' Status '
      TabOrder = 1
      object rdbAtivos: TRadioButton
        Left = 14
        Top = 21
        Width = 60
        Height = 17
        Caption = 'Ativos'
        TabOrder = 0
        OnClick = rdbAtivosClick
      end
      object rdbInativos: TRadioButton
        Left = 72
        Top = 21
        Width = 60
        Height = 17
        Caption = 'Inativos'
        TabOrder = 1
        OnClick = rdbInativosClick
      end
      object rdbTodos: TRadioButton
        Left = 138
        Top = 21
        Width = 60
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
        OnClick = rdbTodosClick
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
      Top = 3
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
      Top = 3
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
      BorderStyle = bsNone
      DataSource = dsClientes
      DrawingStyle = gdsClassic
      FixedColor = clMoneyGreen
      Options = [dgTitles, dgIndicator, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnCellClick = dbgListaClientesCellClick
      OnDrawColumnCell = dbgListaClientesDrawColumnCell
      OnMouseUp = dbgListaClientesMouseUp
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME'
          Title.Alignment = taCenter
          Title.Caption = 'Nome'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Title.Caption = 'Pessoa'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CPF_CNPJ'
          Title.Alignment = taCenter
          Title.Caption = 'CPF/CNPJ'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RG_IE'
          Title.Alignment = taCenter
          Title.Caption = 'RG/IE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DATA_CADASTRO'
          Title.Alignment = taCenter
          Title.Caption = 'Cadastro'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ATIVO'
          Title.Alignment = taCenter
          Title.Caption = 'Ativo'
          Width = 35
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EDITAR'
          Title.Caption = ' '
          Title.Color = clWindow
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'EXCLUIR'
          Title.Alignment = taCenter
          Title.Caption = ' '
          Title.Color = clWindow
          Visible = True
        end>
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
      Width = 362
      Height = 61
      Caption = ' Pessoa '
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
        Left = 14
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
        Left = 88
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
      OnKeyPress = dtpDataCadastroKeyPress
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
      OnKeyPress = dcbAtivoKeyPress
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
      OnKeyPress = dbeNomeClienteKeyPress
    end
    object dbeCPF_CNPJ: TDBEdit
      Left = 16
      Top = 76
      Width = 93
      Height = 21
      DataField = 'CPF_CNPJ'
      DataSource = dsClientes
      TabOrder = 4
      OnEnter = dbeCPF_CNPJEnter
      OnKeyPress = dbeCPF_CNPJKeyPress
      OnMouseEnter = dbeCPF_CNPJMouseEnter
    end
    object dbeRG_IE: TDBEdit
      Left = 131
      Top = 76
      Width = 93
      Height = 21
      DataField = 'RG_IE'
      DataSource = dsClientes
      TabOrder = 5
      OnKeyPress = dbeRG_IEKeyPress
      OnMouseEnter = dbeRG_IEMouseEnter
    end
    object gbxTelefone: TGroupBox
      Left = 16
      Top = 109
      Width = 208
      Height = 170
      Caption = ' Telefone'
      TabOrder = 6
      object spbTelefoneIncluir: TSpeedButton
        Left = 153
        Top = 33
        Width = 22
        Height = 21
        Cursor = crHandPoint
        Hint = 'Clique aqui para incluir um novo telefone'
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          1800000000000003000074120000741200000000000000000001FFFFFFFFFFFF
          FFFFFFFFFFFFFEFFFEE8FAC1DEF9A7DEF9A7DEF9A7DEF9A7E8FAC1FFFFFEFFFF
          FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7FAC0DEF9A7DEF9A7DEF9A7DE
          F9A7DEF9A7DEF9A7DEF9A7DEF9A7E6FAC0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          DFF8ACDEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DCF8A4DEF9A7DEF9
          A7E0F9ADFFFFFFFFFFFFFFFFFFE6F9BFDEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DE
          F9A7DCF8A48ED31D8DD31C8DD31CD7F69BDEF9A7E6F9C0FFFFFFFFFFFEDEF9A7
          DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7CEF18B8DD31C8DD31C8DD31C8DD31C8DD3
          1CDDF9A6DEF9A7FFFFFEE7FAC0DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7C0EB748D
          D31C8DD31C8ED41E8DD31C8DD31CB8E766DEF9A7DEF9A7E8FAC2DEF9A7DEF9A7
          DEF9A7DEF9A7DEF9A7C0EB748DD31C8DD31CDEF9A7DEF9A7CCF088BFEA71DEF9
          A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7CDF18A8DD31C8DD31CDE
          F9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7
          DEF9A7DCF8A48DD31C8DD31CDEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9
          A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A78DD31D8DD31C8ED31EDEF9A7DE
          F9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7E7FAC0DEF9A7
          DBF8A28DD31C8DD31C8DD31CCBF086DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9
          A7DEF9A7DEF9A7E8FAC1FEFFFDDEF9A7DEF9A78DD31C8DD31C8DD31CBFEA71DE
          F9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7FEFFFEFFFFFFE8FABF
          DEF9A7D7F69B8DD31CB8E766DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9
          A7DEF9A7E6F9BFFFFFFFFFFFFFFFFFFFE0F9ACDEF9A7DDF9A6DEF9A7DEF9A7DE
          F9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DFF8ACFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFE6FABFDEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7DEF9A7E6FA
          BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFDE7FAC0DEF9A7DE
          F9A7DEF9A7DEF9A7E7FAC0FEFEFDFFFFFFFFFFFFFFFFFFFFFFFF}
        ParentShowHint = False
        ShowHint = True
        Transparent = False
        OnClick = spbTelefoneIncluirClick
      end
      object lblTelefoneDDD: TLabel
        Left = 16
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
        BorderStyle = bsNone
        DrawingStyle = gdsClassic
        FixedColor = clMoneyGreen
        Options = [dgTitles, dgTabs, dgRowSelect, dgCancelOnExit, dgTitleHotTrack]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            Title.Alignment = taCenter
            Title.Caption = 'Telefone'
            Width = 127
            Visible = True
          end
          item
            Expanded = False
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            Width = 40
            Visible = True
          end>
      end
      object dbeTelefoneNumero: TDBEdit
        Left = 53
        Top = 33
        Width = 94
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
      Left = 247
      Top = 115
      Width = 569
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
        Left = 449
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
        TabOrder = 1
        OnKeyPress = dbeLogadouroKeyPress
      end
      object dbeCEP: TDBEdit
        Left = 7
        Top = 33
        Width = 65
        Height = 21
        TabOrder = 0
        OnKeyPress = dbeCEPKeyPress
      end
      object dbeNumero: TDBEdit
        Left = 449
        Top = 33
        Width = 40
        Height = 21
        TabOrder = 2
        OnKeyPress = dbeNumeroKeyPress
      end
      object dbeComplemento: TDBEdit
        Left = 495
        Top = 33
        Width = 65
        Height = 21
        TabOrder = 3
        OnKeyPress = dbeComplementoKeyPress
      end
      object dbeCidade: TDBEdit
        Left = 110
        Top = 80
        Width = 329
        Height = 21
        TabOrder = 5
        OnKeyPress = dbeCidadeKeyPress
      end
      object dbeBairro: TDBEdit
        Left = 9
        Top = 80
        Width = 92
        Height = 21
        TabOrder = 4
        OnKeyPress = dbeBairroKeyPress
      end
      object dbeEstado: TDBEdit
        Left = 449
        Top = 80
        Width = 111
        Height = 21
        TabOrder = 6
        OnKeyPress = dbeEstadoKeyPress
      end
      object dbePais: TDBEdit
        Left = 9
        Top = 128
        Width = 92
        Height = 21
        TabOrder = 7
        OnKeyPress = dbePaisKeyPress
      end
    end
  end
  object QryClientes: TFDQuery
    AfterScroll = QryClientesAfterScroll
    Connection = DM.FDConnection
    SQL.Strings = (
      'SELECT * FROM CLIENTES c'
      '')
    Left = 24
    Top = 417
    object QryClientesID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object QryClientesNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 40
    end
    object QryClientesTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'TIPO'
      Required = True
      OnGetText = QryClientesTIPOGetText
      FixedChar = True
      Size = 1
    end
    object QryClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 14
    end
    object QryClientesRG_IE: TStringField
      FieldName = 'RG_IE'
      Origin = 'RG_IE'
      Size = 14
    end
    object QryClientesDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      Origin = 'DATA_CADASTRO'
      Required = True
    end
    object QryClientesATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      OnGetText = QryClientesATIVOGetText
      FixedChar = True
      Size = 1
    end
    object QryClientesEDTIAR: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'EDITAR'
      Calculated = True
    end
    object QryClientesEXCLUIR: TBooleanField
      FieldKind = fkCalculated
      FieldName = 'EXCLUIR'
      Calculated = True
    end
  end
  object dsClientes: TDataSource
    DataSet = QryClientes
    Left = 84
    Top = 417
  end
  object imgFormulario: TImageList
    ShareImages = True
    Left = 152
    Top = 416
    Bitmap = {
      494C010104000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000636363000000000005050500070707000000000058585800FDFD
      FD00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006666
      66003A3A3A00FEFEFE0000000000000000000000000000000000000000004A4A
      4A00505050000000000000000000000000000000000000000000F9BD81FAFFC2
      85FFFFC285FFFFC285FFFFC285FFFFC285FFFFC285FFFFC285FFFFC285FFFFC2
      85FFFFC285FFF7BD80F800000000000000000000000000000000F9BD81FAFFC2
      85FFFFC285FFFFC285FFFFC285FFFFC285FFFFC285FFFFC285FFFFC285FFFFC2
      85FFFFC285FFF7BD80F800000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000024242400D4D4
      D400000000000000000000000000000000000000000000000000000000000000
      0000E3E3E3001515150000000000000000000000000000000000FFC285FFFFC2
      85FFFFC285FFFFC285FFE3AD77E4F4B980F5FCBF84FDDFAA75E0FFC285FFFFC2
      85FFFFC285FFFFC285FF00000000000000000000000000000000FFC285FFFFC2
      85FFFFC285FFFFC285FFE3AD77E4F4B980F5FCBF84FDDFAA75E0FFC285FFFFC2
      85FFFFC285FFFFC285FF00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B6B00D1D1D1000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E4E4E4004C4C4C00000000000000000000000000D6A46FD7FFC2
      85FFFFC285FFFFC285FF59442F5AB48A5EB5BD9162BE55412C55FFC285FFFFC2
      85FFFFC285FFD8A470D900000000000000000000000000000000D6A46FD7FFC2
      85FFFFC285FFFFC285FF59442F5AB48A5EB5BD9162BE55412C55FFC285FFFFC2
      85FFFFC285FFD8A470D900000000000000000000000000000000000000000000
      0000C8C8C800B2B2B200E3E3E300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000033333300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000051515100FCFCFC00000000000000000080634481FFC2
      85FFFFC285FFFFC285FF000000007C5E417C8566468600000000FFC285FFFFC2
      85FFFFC285FF886848890000000000000000000000000000000080634481FFC2
      85FFFFC285FFFFC285FF000000007C5E417C8566468600000000FFC285FFFFC2
      85FFFFC285FF8868488900000000000000000000000000000000000000000000
      0000ACACAC00A4A4A40045454500A0A0A0000000000000000000000000000000
      0000000000000000000000000000000000006E6E6E00FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004F4F4F000000000000000000000000001A14
      0E1AD9A672DAFFC285FF0000000073573C737B5E407B00000000FFC285FFD9A6
      72DA1B140E1B0000000000000000000000000000000000000000000000001A14
      0E1AD9A672DAFFC285FF0000000073573C737B5E407B00000000FFC285FFD9A6
      72DA1B140E1B0000000000000000000000000000000000000000000000000000
      0000DCDCDC004F4F4F000000000046464600A0A0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000271E1427281E152800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000271E1427281E152800000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000094949400505050000000000046464600A0A0A000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECECE00B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000B0B0B000C2C2
      C200000000000000000000000000131313000000000000000000000000000000
      00000000000000000000EEB67DEFFFC285FFFFC285FFF0B77EF1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EEB67DEFFFC285FFFFC285FFF0B77EF1000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000094949400505050000000000046464600A0A0A0000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8F8F800EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00EFEFEF00F6F6
      F600000000000000000000000000131313000000000000000000000000000000
      0000000000005B452F5BFFC285FFF5BB80F6F6BC81F7FFC285FF674E36670000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000005B452F5BFFC285FFF5BB80F6F6BC81F7FFC285FF674E36670000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000094949400505050000000000046464600A0A0
      A000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E0AA74E1916F4C924A38274A4B39274B92704D93E6B078E70000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E0AA74E1916F4C924A38274A4B39274B92704D93E6B078E70000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009494940050505000000000004242
      4200A0A0A0000000000000000000000000006F6F6F00FCFCFC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000505050000000000000000000000000000000
      000000000000C49667C5FFC285FFF5BA7FF6F6BC81F7FFC285FFD3A06FD40000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C49667C5FFC285FFF5BA7FF6F6BC81F7FFC285FFD3A06FD40000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000949494004B4B4B001414
      140046464600A0A0A00000000000000000000000000031313100000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000004F4F4F00FCFCFC000000000000000000000000000000
      00000000000017120C18FFC285FFFFC285FFFFC285FFFFC285FF1F18101F0000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000017120C18FFC285FFFFC285FFFFC285FFFFC285FF1F18101F0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494005050
      5000EBEBEB000A0A0A000000000000000000000000006D6D6D00CFCFCF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000E3E3E3004F4F4F00000000000000000000000000000000000000
      00000000000000000000372A1D37FFC285FFFFC285FF3D2F203D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000372A1D37FFC285FFFFC285FF3D2F203D000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000009494
      94000A0A0A00000000000000000000000000000000000000000026262600D1D1
      D100000000000000000000000000000000000000000000000000000000000000
      0000E1E1E1001717170000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006969
      690036363600FEFEFE0000000000000000000000000000000000000000004646
      4600535353000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000066666600000000000303030004040400000000005B5B5B00FEFE
      FE0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000FFFFF80F00000000FFFFE3E7
      00000000C003CFF300000000DFFB9FF900000000D1FBBFFC00000000D0FB3FFE
      00000000D27B7FFE00000000D93B700E00000000DC9F700E00000000DE4F7FFE
      00000000DF273FFE00000000DF83BFFC00000000DFC39FF900000000C0E7CFF3
      00000000FFFFE3E700000000FFFFF80F00000000000000000000000000000000
      000000000000}
  end
end
