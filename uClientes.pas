unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, System.StrUtils,

  uFunctions, ClassCustomers, ClassConnection;

type
  TfrmClientes = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    pnlDetails: TPanel;
    edtPesquisa: TEdit;
    lblPesquisa: TLabel;
    pnlMaster: TPanel;
    gbxStatus: TGroupBox;
    rdbAtivos: TRadioButton;
    rdbInativos: TRadioButton;
    rdbTodos: TRadioButton;
    lblCliente: TLabel;
    gbxTipo: TGroupBox;
    rdbPessoaFisica: TRadioButton;
    rdbPessoaJuridica: TRadioButton;
    lblRGIE: TLabel;
    dtpDataCadastro: TDateTimePicker;
    lblDataCadastro: TLabel;
    dcbAtivo: TDBCheckBox;
    dbeNomeCliente: TDBEdit;
    dbeCPF_CNPJ: TDBEdit;
    dbeRG_IE: TDBEdit;
    dbgListaClientes: TDBGrid;
    lblCPFCNPJ: TLabel;
    gbxTelefone: TGroupBox;
    dbgTelefones: TDBGrid;
    dbeTelefoneNumero: TDBEdit;
    dbeTelefoneDDD: TDBEdit;
    spbTelefoneIncluir: TSpeedButton;
    btnClienteIncluir: TBitBtn;
    gbxEndereco: TGroupBox;
    spbPesquisaCEP: TSpeedButton;
    dbeLogadouro: TDBEdit;
    dbeCEP: TDBEdit;
    btnClienteGravar: TBitBtn;
    btnClienteCancelar: TBitBtn;
    lblTelefoneDDD: TLabel;
    lblTelefoneNumero: TLabel;
    StatusBar1: TStatusBar;
    lblCEP: TLabel;
    lblLogradouro: TLabel;
    dbeNumero: TDBEdit;
    dbeComplemento: TDBEdit;
    lblNumero: TLabel;
    lblComplemento: TLabel;
    dbeCidade: TDBEdit;
    dbeBairro: TDBEdit;
    lblBairro: TLabel;
    lblCidade: TLabel;
    dbeEstado: TDBEdit;
    dbePais: TDBEdit;
    lblEstado: TLabel;
    lblPais: TLabel;
    QryClientes: TFDQuery;
    dsClientes: TDataSource;
    imgFormulario: TImageList;
    QryClientesID: TFDAutoIncField;
    QryClientesNOME: TStringField;
    QryClientesTIPO: TStringField;
    QryClientesCPF_CNPJ: TStringField;
    QryClientesRG_IE: TStringField;
    QryClientesDATA_CADASTRO: TDateField;
    QryClientesATIVO: TStringField;
    QryClientesEDTIAR: TBooleanField;
    QryClientesEXCLUIR: TBooleanField;
    procedure rdbPessoaFisicaClick(Sender: TObject);
    procedure rdbPessoaJuridicaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure spbTelefoneIncluirClick(Sender: TObject);
    procedure btnClienteIncluirClick(Sender: TObject);
    procedure btnClienteGravarClick(Sender: TObject);
    procedure btnClienteCancelarClick(Sender: TObject);
    procedure dbgListaClientesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgListaClientesCellClick(Column: TColumn);
    procedure QryClientesAfterScroll(DataSet: TDataSet);
    procedure dbeCPF_CNPJMouseEnter(Sender: TObject);
    procedure dbeRG_IEMouseEnter(Sender: TObject);
    procedure dbeNomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
    procedure dbeRG_IEKeyPress(Sender: TObject; var Key: Char);
    procedure dtpDataCadastroKeyPress(Sender: TObject; var Key: Char);
    procedure dcbAtivoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCEPKeyPress(Sender: TObject; var Key: Char);
    procedure dbeLogadouroKeyPress(Sender: TObject; var Key: Char);
    procedure dbeNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure dbeComplementoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeBairroKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure dbeEstadoKeyPress(Sender: TObject; var Key: Char);
    procedure dbePaisKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCPF_CNPJEnter(Sender: TObject);
    procedure QryClientesTIPOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure QryClientesATIVOGetText(Sender: TField; var Text: string; DisplayText: Boolean);
    procedure edtPesquisaChange(Sender: TObject);
    procedure rdbAtivosClick(Sender: TObject);
    procedure rdbInativosClick(Sender: TObject);
    procedure rdbTodosClick(Sender: TObject);
    procedure dbgListaClientesMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    procedure ListarClientes;

    procedure SetarBotoesTelefone(Status: Boolean=True);
    procedure SetarPainelHeader;
    procedure SetarPainelMestre;
    procedure SetarPainelDetalhes;
    procedure SetarBotoesCliente;
    procedure SetarCampos(Operacao: Integer=1);
    procedure SetarCamposObrigatorios;
    procedure SetarTipoPessoaPadrao;
    procedure SetarCamposSomenteLeitura;
    procedure ValidaCamposSomenteLeitura;

    function GravarDadosInformados: Boolean;
    function ValidaCampos: Boolean;
    function TipoPessoaSelecionada: Boolean;
    procedure EditRecord;
    procedure DeleteRecord;

    { Private declarations }
  public
    { Public declarations }
    Cliente: TCustomers;
  end;

var
  frmClientes: TfrmClientes;
  LocationClicked: Integer;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  Cliente := TCustomers.Create(dm.FDConnection, dm.Connection.Database);

  dtpDataCadastro.Date := Now;

  SetarPainelMestre;
  SetarPainelDetalhes;
  SetarBotoesCliente;
  SetarBotoesTelefone;
  SetarTipoPessoaPadrao;

  ListarClientes;

  dcbAtivo.Checked := False;
end;

procedure TfrmClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Application.Terminate;
end;

procedure TfrmClientes.btnClienteIncluirClick(Sender: TObject);
begin
  QryClientes.Insert;

  SetarPainelHeader;
  SetarPainelMestre;
  SetarPainelDetalhes;
  SetarBotoesCliente;
  SetarTipoPessoaPadrao;
  SetarCampos;

  dbeNomeCliente.SetFocus;
end;

procedure TfrmClientes.EditRecord;
begin
  QryClientes.Edit;

  SetarPainelHeader;
  SetarPainelMestre;
  SetarPainelDetalhes;
  SetarBotoesCliente;
  SetarTipoPessoaPadrao;
  SetarCampos;

  dbeNomeCliente.SetFocus;
end;

procedure TfrmClientes.DeleteRecord;
begin
  if Application.MessageBox(PChar('Confirma a excliusão cliente ' + QryClientes.FieldByName('NOME').AsString),
    'Exclusão', MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON2) = ID_YES  then
    QryClientes.Delete;
end;

procedure TfrmClientes.dbeBairroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeCEPKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeCidadeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeComplementoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeCPF_CNPJEnter(Sender: TObject);
begin
  ValidaCamposSomenteLeitura
end;

procedure TfrmClientes.dbeCPF_CNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeCPF_CNPJMouseEnter(Sender: TObject);
begin
  ValidaCamposSomenteLeitura;
end;

procedure TfrmClientes.dbeEstadoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeLogadouroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeNomeClienteKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbePaisKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeRG_IEKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dbeRG_IEMouseEnter(Sender: TObject);
begin
  if dbeRG_IE.ReadOnly then
  begin
    Application.MessageBox('Favor selecionar se pessoa física ou jurídica', 'Aviso', MB_OK+MB_ICONEXCLAMATION);
    gbxTipo.SetFocus;
  end;
end;

procedure TfrmClientes.dbgListaClientesMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  LocationClicked := x;
end;

procedure TfrmClientes.dbgListaClientesCellClick(Column: TColumn);
var
  ColumnClicked,
  SumColumns: Integer;

begin
  ColumnClicked := -1;
  SumColumns := 0;

  while LocationClicked > SumColumns do begin
    ColumnClicked := ColumnClicked + 1;
    SumColumns  := SumColumns + dbgListaClientes.Columns[ColumnClicked].Width;
  end;

  ShowMessage('Coluna: ' + IntToStr(ColumnClicked) +#13+
              'Título: ' + dbgListaClientes.Columns[ColumnClicked].Title.Caption +#13+
              'Field: ' + dbgListaClientes.Columns[ColumnClicked].FieldName);

  case ColumnClicked of
    6: EditRecord;
    7: DeleteRecord
  end;
end;

procedure TfrmClientes.dbgListaClientesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.Field = QryClientes.FieldByName('EDITAR') then
   begin
     TDBGrid(Sender).Canvas.FillRect(Rect);
     ImgFormulario.Draw(TDBGrid(Sender).Canvas, Rect.Left + 1, Rect.Top + 1, 2);
   end;

  if Column.Field = QryClientes.FieldByName('EXCLUIR') then
   begin
     TDBGrid(Sender).Canvas.FillRect(Rect);
     ImgFormulario.Draw(TDBGrid(Sender).Canvas, Rect.Left + 1, Rect.Top + 1, 3);
   end;
end;

procedure TfrmClientes.dcbAtivoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.dtpDataCadastroKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      PostMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
    end;
end;

procedure TfrmClientes.edtPesquisaChange(Sender: TObject);
begin
  ListarClientes;
end;

procedure TfrmClientes.btnClienteGravarClick(Sender: TObject);
begin
  if (ValidaCampos) and (GravarDadosInformados) then
    begin
      SetarPainelHeader;
      SetarPainelMestre;
      SetarPainelDetalhes;
      SetarBotoesCliente;

      dbgListaClientes.SetFocus;
    end;
end;

procedure TfrmClientes.btnClienteCancelarClick(Sender: TObject);
begin
  QryClientes.Cancel;

  SetarPainelHeader;
  SetarPainelMestre;
  SetarPainelDetalhes;
  SetarBotoesCliente;
  SetarTipoPessoaPadrao;
  SetarCamposObrigatorios;

  dcbAtivo.Checked := False;

  dbgListaClientes.SetFocus;
end;

procedure TfrmClientes.rdbAtivosClick(Sender: TObject);
begin
  ListarClientes;
end;

procedure TfrmClientes.rdbInativosClick(Sender: TObject);
begin
  ListarClientes;
end;

procedure TfrmClientes.rdbTodosClick(Sender: TObject);
begin
  ListarClientes
end;

procedure TfrmClientes.rdbPessoaFisicaClick(Sender: TObject);
begin
  lblCPFCNPJ.Caption := 'CPF';
  lblRGIE.Caption := 'RG';

  if QryClientes.State = dsInsert then
    SetarCamposSomenteLeitura;
end;

procedure TfrmClientes.rdbPessoaJuridicaClick(Sender: TObject);
begin
  lblCPFCNPJ.Caption := 'CNPJ';
  lblRGIE.Caption := 'IE';

  if QryClientes.State = dsInsert then
    SetarCamposSomenteLeitura;
end;

procedure TfrmClientes.spbTelefoneIncluirClick(Sender: TObject);
begin
  SetarBotoesTelefone(False);

  dbeTelefoneDDD.SetFocus;
end;

procedure TfrmClientes.SetarBotoesTelefone(Status: Boolean=True);
begin
  spbTelefoneIncluir.Enabled := Status;
end;

procedure TfrmClientes.SetarPainelMestre;
begin
  pnlMaster.Enabled := (QryClientes.Active) And (QryClientes.State in [dsInsert, dsEdit]);
end;

procedure TfrmClientes.SetarPainelDetalhes;
begin
  pnlDetails.Enabled := QryClientes.State in [dsInactive, dsBrowse];
end;

procedure TfrmClientes.SetarBotoesCliente;
begin
  btnClienteIncluir.Enabled  := QryClientes.State in [dsInactive, dsBrowse];
  btnClienteGravar.Visible   := QryClientes.State in [dsInsert, dsEdit];
  btnClienteCancelar.Visible := QryClientes.State in [dsInsert, dsEdit];
end;

procedure TfrmClientes.SetarPainelHeader;
begin
  pnlHeader.Enabled := (QryClientes.Active) And (QryClientes.State in [dsBrowse]);
end;

procedure TfrmClientes.SetarCampos(Operacao: Integer=1);
begin
  case QryClientes.State of
    dsInsert:
      begin
        SetarTipoPessoaPadrao;
        SetarCamposSomenteLeitura;
        dcbAtivo.Checked := True;
        dtpDataCadastro.Date := Trunc(Now);
      end;

    dsEdit:
      begin
        rdbPessoaFisica.Checked := QryClientes.FieldByName('TIPO').AsString = 'F';
        rdbPessoaJuridica.Checked := QryClientes.FieldByName('TIPO').AsString = 'J';

        dcbAtivo.Checked := QryClientes.FieldByName('ATIVO').AsString = 'A';
      end;
  end;
end;

procedure TfrmClientes.SetarCamposSomenteLeitura;
begin
  dbeCPF_CNPJ.ReadOnly := (QryClientes.State in [dsInsert, dsEdit]) and (not TipoPessoaSelecionada);
  dbeRG_IE.ReadOnly := (QryClientes.State in [dsInsert, dsEdit]) and (not TipoPessoaSelecionada);
end;

function  TfrmClientes.TipoPessoaSelecionada: Boolean;
begin
  Result := ((rdbPessoaFisica.Checked) or (rdbPessoaJuridica.Checked));
end;

procedure TfrmClientes.ListarClientes;
var
  Where: String;

begin
  QryClientes.Close;
  QryClientes.SQL.Clear;
  QryClientes.SQL.Add('SELECT * FROM CLIENTES');

  where := '';

  if Trim(edtPesquisa.Text) <> EmptyStr then
    where := where + 'NOME like ' + QuotedStr('%' + Trim(edtPesquisa.Text) + '%') + ' and ';

  if rdbAtivos.Checked then
    where := where + 'ATIVO = ' + QuotedStr('A') + ' and ';

  if rdbInativos.Checked then
    where := where + 'ATIVO = ' + QuotedStr('I') + ' and ';

  if Where <> EmptyStr then
    begin
      where := Copy(Where, 1, length(Where)- 5);

      QryClientes.SQL.Add('WHERE ' + Where);
    end;

  SaveLog(QryClientes.SQL.Text);

  QryClientes.Open;
end;

procedure TfrmClientes.QryClientesAfterScroll(DataSet: TDataSet);
begin
  if QryClientes.State = dsBrowse then
    begin
      rdbPessoaFisica.Checked := QryClientes.FieldByName('TIPO').AsString = 'F';
      rdbPessoaJuridica.Checked := QryClientes.FieldByName('TIPO').AsString = 'J';
      dcbAtivo.Checked := QryClientes.FieldByName('ATIVO').AsString = 'A';
      dtpDataCadastro.Date := Trunc(QryClientes.FieldByName('DATA_CADASTRO').AsDateTime);
    end;
end;

procedure TfrmClientes.QryClientesATIVOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case AnsiIndexStr(QryClientes.FieldByName('ATIVO').AsString, ['A', 'I']) of
    0: Text := 'Ativo';
    1: Text := 'Inativo';
  end;
end;

procedure TfrmClientes.QryClientesTIPOGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  case AnsiIndexStr(QryClientes.FieldByName('TIPO').AsString, ['F', 'J']) of
    0: Text := 'Física';
    1: Text := 'Jurídica';
  end;
end;

function TfrmClientes.ValidaCampos: Boolean;
begin
  SetarCamposObrigatorios;

  Result := True;

  if dbeNomeCliente.Text = EmptyStr then
    begin
      lblCliente.Caption    := 'Nome*';
      lblCliente.Font.Style := [TFontStyle.fsBold];

      Result := False;
    end;

  if (not rdbPessoaFisica.Checked) and (not rdbPessoaJuridica.Checked) then
    begin
      gbxTipo.Caption := 'Tipo *';
      gbxTipo.Font.Style := [TFontStyle.fsBold];

      rdbPessoaFisica.Font.Style := [];
      rdbPessoaJuridica.Font.Style := [];

      Result := False;
    end;

  if dbeCPF_CNPJ.Text = EmptyStr then
    begin
      lblCPFCNPJ.Caption := lblCPFCNPJ.Caption + '*';
      lblCPFCNPJ.Font.Style := [TFontStyle.fsBold];

      Result := False;
    end;

    if not Result then
      ShowMessage('Favor preecher os campos obrigatórios')
end;

function TfrmClientes.GravarDadosInformados: Boolean;
var
  SaveSQL: TFDQuery;

begin
  try
    if rdbPessoaFisica.Checked then
      QryClientes.FieldByName('TIPO').AsString := 'F'
    else if rdbPessoaJuridica.Checked then
      QryClientes.FieldByName('TIPO').AsString := 'J';

    QryClientes.FieldByName('DATA_CADASTRO').AsDateTime := dtpDataCadastro.Date;

    if dcbAtivo.Checked then
      QryClientes.FieldByName('ATIVO').AsString := 'A'
    else
      QryClientes.FieldByName('ATIVO').AsString := 'I';

    QryClientes.Post;

    Result := QryClientes.ApplyUpdates(0) = 0;
  except
    on E:Exception do
    begin
      Result := False;

      raise Exception.Create('Atenção ocorreu um erro ' +#13+ e.ToString);
    end;
  end;
end;

procedure TfrmClientes.SetarCamposObrigatorios;
begin
  lblCliente.Caption := 'Nome';
  lblCliente.Font.Style := [];

  gbxTipo.Caption := 'Tipo';
  gbxTipo.Font.Style := [];

  lblCPFCNPJ.Caption := 'CPF';
  lblCPFCNPJ.Font.Style := [];
end;

procedure TfrmClientes.ValidaCamposSomenteLeitura;
begin
  if (dbeCPF_CNPJ.ReadOnly) or (dbeRG_IE.ReadOnly) then
  begin
    Application.MessageBox('Favor selecionar se pessoa física ou jurídica', 'Aviso', MB_OK+MB_ICONEXCLAMATION);

    gbxTipo.SetFocus;
  end;
end;

procedure TfrmClientes.SetarTipoPessoaPadrao;
begin
  rdbPessoaFisica.Checked := False;
  rdbPessoaJuridica.Checked := False;
end;


end.
