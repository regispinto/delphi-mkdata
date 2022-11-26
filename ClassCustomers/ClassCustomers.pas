unit ClassCustomers;

interface

uses
  System.SysUtils, FireDAC.Comp.Client,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.UI, FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL;

  type
    TCustomers = Class
      private
        FConnection : TFDConnection;
        FDatabase: string;
        FCodigo : Integer;
        FNome : string;
        FCidade : string;
        FUF : string;
      public
        property Connection : TFDConnection read FConnection write FConnection;
        property Codigo : Integer read FCodigo write FCodigo;
        property Nome : String read FNome write FNome;
        property Cidade : String read FCidade write FCidade;
        property UF : String read FUF write FUF;

        constructor Create( Connection: TFDConnection; Database: string );
        destructor Destroy; Override;

        function Incluir(var Erro: String): Boolean;
        procedure Excluir(Numero: Integer);
        function Consultar(Texto: String=''): TFDQuery;

        function CreateTableCustomers: string;
        function InsertCustomersRecords(Cliente: TCustomers; Records: integer=20): Boolean;
    end;

var
  QryConsulta: TFDQuery;

implementation

{ TCustomers }

constructor TCustomers.Create(Connection: TFDConnection; Database: string);
begin
  FConnection := Connection;
  FDatabase := Database;
end;

function TCustomers.CreateTableCustomers: string;
Var
  QrySQL: TFDQuery;

begin
  try
    FConnection.Connected := False;
    FConnection.Params.Values['Database'] := FDatabase;
    FConnection.Connected := True;

    Result := '';

    try
      QrySQL := TFDQuery.Create(nil);
      QrySQL.Connection := FConnection;

      QrySQL.Close;
      QrySQL.SQL.Clear;
      QrySQL.SQL.Add('CREATE TABLE clientes (');
      QrySQL.SQL.Add('CodigoCliente int(8) primary key auto_increment, ');
      QrySQL.SQL.Add('Nome varchar(30) not null, ');
      QrySQL.SQL.Add('Cidade varchar (20) not null, ');
      QrySQL.SQL.Add('UF char(2) not null) ');
      QrySQL.SQL.Add('auto_increment = 1, ');
      QrySQL.SQL.Add('default charset = utf8');
      QrySQL.Prepare;
      QrySQL.ExecSQL;
    except
      on e:Exception do
        Result := e.ToString;
    end;

  finally
    FreeAndNil(QrySQL);

  end;
end;

destructor TCustomers.Destroy;
begin

  inherited;
end;

function TCustomers.Incluir(var Erro: String): Boolean;
var
  QrySQL: TFDQuery;

begin
  try
    Result := True;

    try
      QrySQL := TFDQuery.Create(nil);
      QrySQL.Connection := FConnection;

      QrySQL.Close;
      QrySQL.SQL.Clear;
      QrySQL.SQL.Add('insert into clientes ');
      QrySQL.SQL.Add('(CodigoCliente, Nome, Cidade, UF) ');
      QrySQL.SQL.Add('values ');
      QrySQL.SQL.Add('(:pCodigo, :pNome, :pCidade, :pUF)');

      QrySQL.ParamByName('pCodigo').AsInteger := FCodigo;
      QrySQL.ParamByName('pNome').AsString    := FNome;
      QrySQL.ParamByName('pCidade').AsString  := FCidade;
      QrySQL.ParamByName('pUF').AsString      := FUF;
      QrySQL.ExecSQL;

    except
      on e: Exception do begin
        Erro := E.Message;

        Result := False;
      end;
    end;

  finally
    FreeAndNil(QrySQL);

  end;
end;

function TCustomers.Consultar(Texto: String): TFDQuery;
var
  QrySQL: TFDQuery;

begin
  try
    QrySQL := TFDQuery.Create(nil);
    QrySQL.Connection := FConnection;

    try
      FConnection.Connected := False;
      FConnection.Connected := True;

      QrySQL.SQL.Clear;
      QrySQL.SQL.Add('Select CodigoCliente, Nome, Cidade, UF from CLIENTES c');

      if not Texto.IsEmpty then begin
        QrySQL.SQL.Add('where c.CodigoCliente = :pCodigo');
        QrySQL.ParamByName('pCodigo').AsString := Texto;
      end;

      QrySQL.Open;
    finally
      Result := QryConsulta;

    end;
  finally
    FreeAndNil(QrySQL);

  end;
end;

procedure TCustomers.Excluir(Numero: Integer);
begin
  //
end;

function TCustomers.InsertCustomersRecords(Cliente: TCustomers; Records: integer): Boolean;
Var
  Erro: String;
  x: Integer;

begin
  try
    Result := True;

    for x := 1 to Records do
      begin
        Cliente.Codigo  := x;
        Cliente.Nome    := 'CLIENTE ' + IntToStr(x);
        Cliente.Cidade  := 'PORTO ALEGRE';
        Cliente.UF      := 'RS';

        if not Cliente.Incluir(Erro) then begin
          Result := False;
          break;
        end;
      end;
  finally
    Cliente.Destroy;

  end;
end;

end.
