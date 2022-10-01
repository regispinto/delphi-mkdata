program MKData;

uses
  Vcl.Forms,
  uClientes in 'uClientes.pas' {frmClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.Run;
end.
