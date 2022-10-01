unit uClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmClientes = class(TForm)
    pnlHeader: TPanel;
    pnlFooter: TPanel;
    pnlDetails: TPanel;
    edtPesquisa: TEdit;
    SpeedButton1: TSpeedButton;
    rbtInativos: TRadioButton;
    rdbAtivos: TRadioButton;
    rdbTodos: TRadioButton;
    lblPesquisa: TLabel;
    pnlMaster: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

end.
