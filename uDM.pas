unit uDM;

interface

uses
  System.SysUtils, System.Classes, StrUtils, Dialogs, Data.DB,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.UI, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL,

  uFunctions, ClassConnection, uCreateTables;

type
  TDM = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;

    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    Connection : TConnect;

    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses uClientes;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  Connection := TConnect.Create( FDConnection );

  try
    Connection.DriverID := 'SQLite';
    Connection.FileName := 'mkdata.db';
    Connection.Path     := 'Database';

    Connection.SetConnectDatabase;

    if not Connection.ConnectionDatabase then
      Connection.CreateDatabase;

    CreateUpedateDB;
  finally
    FreeAndNil(Connection)

  end;

  try
    frmClientes := TfrmClientes.Create(nil);
    frmClientes.ShowModal;
  finally
    FreeAndNil(frmClientes);
  end;

end;

end.
