program MKData;

uses
  Vcl.Forms,
  uClientes in 'uClientes.pas' {frmClientes},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFunctions in 'GenericFunctions\uFunctions.pas',
  uClassConnection in 'ClassConnection\uClassConnection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
