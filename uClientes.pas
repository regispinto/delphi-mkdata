unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Mask, Vcl.DBCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

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
    Label1: TLabel;
    GroupBox1: TGroupBox;
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
  private
    procedure SetarBotoesTelefone(Status: Boolean=True);
    procedure SetarPainelMestre(Status: Boolean=False);
    procedure SetarBotoesCliente(Status: Boolean=False);
    procedure SetarPainelHeader(Status: Boolean=True);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  dtpDataCadastro.Date := Now;

  SetarBotoesTelefone;

  SetarPainelMestre;

  SetarBotoesCliente(True);
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
  SetarPainelHeader(False);

  SetarPainelMestre(True);

  SetarBotoesCliente(False);

  dbeNomeCliente.SetFocus;
end;

procedure TfrmClientes.btnClienteGravarClick(Sender: TObject);
begin
  SetarPainelMestre();

  SetarBotoesCliente(True);
end;

procedure TfrmClientes.btnClienteCancelarClick(Sender: TObject);
begin
  SetarPainelMestre();

  SetarBotoesCliente(True);
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

end.
