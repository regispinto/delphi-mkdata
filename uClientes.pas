unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList;

type
  TfrmClientes = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    pnlDetails: TPanel;
    edtPesquisa: TEdit;
    spbPesquisar: TSpeedButton;
    lblPesquisa: TLabel;
    pnlMaster: TPanel;
    gbxStatus: TGroupBox;
    rdbAtivos: TRadioButton;
    rbtInativos: TRadioButton;
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
    spbTelefoneGravar: TSpeedButton;
    spbTelefoneCancelar: TSpeedButton;
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
    procedure rdbPessoaFisicaClick(Sender: TObject);
    procedure rdbPessoaJuridicaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure spbTelefoneIncluirClick(Sender: TObject);
    procedure spbTelefoneGravarClick(Sender: TObject);
    procedure spbTelefoneCancelarClick(Sender: TObject);
    procedure btnClienteIncluirClick(Sender: TObject);
    procedure btnClienteGravarClick(Sender: TObject);
    procedure btnClienteCancelarClick(Sender: TObject);
    procedure dbgListaClientesDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dbgListaClientesCellClick(Column: TColumn);
  private
    procedure SetarBotoesTelefone(Status: Boolean=True);
    procedure SetarPainelMestre(Status: Boolean=False);
    procedure SetarBotoesCliente(Status: Boolean=False);
    procedure SetarPainelHeader(Status: Boolean=True);
    procedure ListarClientes;
    procedure SetarCampos(Operacao: Integer=1);

    function GravarDadosInformados: Boolean;
    function ValidaCampos: Boolean;
    procedure SetarCamposObrigatorios;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

uses uDM, uFunctions, uClassConnection;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  dtpDataCadastro.Date := Now;

  SetarBotoesTelefone;

  SetarPainelMestre;

  SetarBotoesCliente(True);

  ListarClientes;

  dcbAtivo.Checked := False;
end;

procedure TfrmClientes.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then Application.Terminate;
end;

procedure TfrmClientes.rdbPessoaFisicaClick(Sender: TObject);
begin
  lblCPFCNPJ.Caption := 'CPF';
  lblRGIE.Caption := 'RG';

  dbeCPF_CNPJ.SetFocus;
end;

procedure TfrmClientes.btnClienteIncluirClick(Sender: TObject);
begin
  QryClientes.Insert;

  SetarPainelHeader(False);

  SetarPainelMestre(True);

  SetarBotoesCliente(False);

  SetarCampos;

  dbeNomeCliente.SetFocus;
end;

procedure TfrmClientes.dbgListaClientesCellClick(Column: TColumn);
begin
  {Validamos se estamos na Coluna 3 e se o valor do campo Ativo é N , se for mudamos para S}
  if Column.Index = 2 Then
    if Column.Grid.DataSource.DataSet.Fields[Column.Index].AsString = 'N' Then
      begin
        Column.Grid.DataSource.DataSet.Edit;
        Column.Grid.DataSource.DataSet.Fields[Column.Index].Value := 'S'
      end
    else
      begin
        Column.Grid.DataSource.DataSet.Edit;
        Column.Grid.DataSource.DataSet.Fields[Column.Index].Value := 'N'
      end;
end;

procedure TfrmClientes.dbgListaClientesDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.Field = QryClientes.FieldByName('ATIVO') then
   begin
     TDBGrid(Sender).Canvas.FillRect(Rect);
     imgFormulario.Draw(TDBGrid(Sender).Canvas, Rect.Left +1,Rect.Top + 1, 0);
     if QryClientes.FieldByName('ATIVO').Text = 'S' then
       imgFormulario.Draw(TDBGrid(Sender).Canvas, Rect.Left +1,Rect.Top + 1, 1)
   end;
end;

procedure TfrmClientes.btnClienteGravarClick(Sender: TObject);
begin
  if (ValidaCampos) and (GravarDadosInformados) then
    begin
      SetarPainelMestre;

      SetarBotoesCliente(True);
    end;
end;

procedure TfrmClientes.btnClienteCancelarClick(Sender: TObject);
begin
  QryClientes.Cancel;

  SetarPainelMestre;

  SetarBotoesCliente(True);

  SetarCamposObrigatorios;
end;

procedure TfrmClientes.rdbPessoaJuridicaClick(Sender: TObject);
begin
  lblCPFCNPJ.Caption := 'CNPJ';
  lblRGIE.Caption := 'IE';

  dbeCPF_CNPJ.SetFocus;
end;

procedure TfrmClientes.spbTelefoneIncluirClick(Sender: TObject);
begin
  SetarBotoesTelefone(False);

  dbeTelefoneDDD.SetFocus;
end;

procedure TfrmClientes.spbTelefoneCancelarClick(Sender: TObject);
begin
  SetarBotoesTelefone;
end;

procedure TfrmClientes.spbTelefoneGravarClick(Sender: TObject);
begin
  SetarBotoesTelefone;
end;

procedure TfrmClientes.SetarBotoesTelefone(Status: Boolean=True);
begin
  spbTelefoneIncluir.Enabled  := Status;
  spbTelefoneGravar.Visible   := not Status;
  spbTelefoneCancelar.Visible := not Status
end;

procedure TfrmClientes.SetarPainelMestre(Status: Boolean=False);
begin
  pnlMaster.Enabled := Status;
end;

procedure TfrmClientes.SetarBotoesCliente(Status: Boolean=False);
begin
  btnClienteIncluir.Enabled   := Status;
  btnClienteGravar.Visible    := not Status;
  btnClienteCancelar.Visible  := not Status;
end;

procedure TfrmClientes.SetarPainelHeader(Status: Boolean=True);
begin
  pnlHeader.Enabled := Status;
end;

procedure TfrmClientes.SetarCampos(Operacao: Integer=1);
begin
  case Operacao of
    1:  begin
          dcbAtivo.Checked := True;
          dtpDataCadastro.Date := now;
        end;

    2:  begin
        end;
  end;
end;

procedure TfrmClientes.ListarClientes;
begin
  QryClientes.Close;
  QryClientes.SQL.Clear;
  QryClientes.SQL.Add('SELECT * FROM CLIENTES c');
  QryClientes.SQL.Add('LEFT JOIN TELEFONES t on t.IDCLIENTE = c.ID');
  QryClientes.SQL.Add('LEFT JOIN ENDERECOS e on e.IDCLIENTE = c.ID');
  QryClientes.Close;
  QryClientes.Open;
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
    try
      SaveSQL := TFDQuery.Create(Application);
      SaveSQL.Connection := Dm.FDConnection;
      SaveSQL.SQL.Clear;
      SaveSQL.SQL.Add('insert into CLIENTES ');
      SaveSQL.SQL.Add('(nome, tipo, cpf_cnpj, rg_ie, data_cadastro, ativo) ');
      SaveSQL.SQL.Add('values ');
      SaveSQL.SQL.Add('(:pNome, :pTipo, :pCpfCnpj, :pRgIe, :pCadastro, :pAtivo)');
      //
      SaveSQL.ParamByName('pNome').AsString := dbeNomeCliente.Text;
      SaveSQL.ParamByName('pTipo').AsString := 'F';

      if rdbPessoaJuridica.Checked then
        SaveSQL.ParamByName('pTipo').AsString  := 'J';

      SaveSQL.ParamByName('pCpfCnpj').AsString := dbeCPF_CNPJ.Text;
      SaveSQL.ParamByName('pRgIe').AsString := dbeRG_IE.Text;
      SaveSQL.ParamByName('pCadastro').AsDate := dtpDataCadastro.Date;
      SaveSQL.ParamByName('pAtivo').AsString := 'I';

      if dcbAtivo.Checked then
        SaveSQL.ParamByName('pAtivo').AsString := 'A';

      SaveLog(SaveSQL.SQL.Text);

      SaveSQL.ExecSQL;

      Result := SaveSQL.RowsAffected > 0;

      ShowMessage( BoolToStr(Result, True) );
    finally
      FreeAndNil(SaveSQL);

    end;
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

end.


