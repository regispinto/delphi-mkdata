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
    pnlMaster: TPanel;
    edtPesquisa: TEdit;
    RadioGroup1: TRadioGroup;
    SpeedButton1: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
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
