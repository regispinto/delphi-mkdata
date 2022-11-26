unit uClassConnection;

interface

uses
    IniFiles, SysUtils, Forms, Dialogs, StrUtils, Data.DB, System.Classes,

    FireDAC.Phys.MySQLDef, FireDAC.Phys.MySQL, FireDAC.Comp.Client, FireDAC.Stan.Intf,
    FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
    FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,

    FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
    FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, FireDAC.Stan.Param,
    FireDAC.Phys.IBBase, FireDAC.Phys.FB, FireDAC.Phys.IBWrapper,

    FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
    FireDAC.Comp.UI,

    uFunctions;

type
   TConnect = class
   private
      FConnection: TFDConnection;
      FPath: string;
      FFileName: string;
      FServer: string;
      FPort: string;
      FDatabase: string;
      FPass: string;
      FUser: string;
      FDriver: string;
      FDriverID: string;
      FOpenMode: string;
      FSection: string;
      FMsgErr: string;

   public
      property Connection : TFDConnection read FConnection write FConnection;
      property Path: string read FPath write FPath;
      property FileName: string read FFileName write FFileName;
      property Server: string read FServer write FServer;
      property Port: string read FPort write FPort;
      property Database: string read FDatabase write FDatabase;
      property Pass: string read FPass write FPass;
      property User: string read FUser write FUser;
      property Driver: string read FDriver write FDriver;
      property DriverID: string read FDriverID write FDriverID;
      property OpenMode: string read FOpenMode write FOpenMode;
      property Section: string read FSection write FSection;
      property MsgErr: string read FMsgErr write FMsgErr;

      constructor Create (NameConnection: TFDConnection);
      destructor Destroy; Override;

      function GetTables(SQLText: string): TDataSet;
      function GetDllDriver(Dll: string): Boolean;
      function CreateFolderBD: string;

      procedure SetConnectDatabase;
      function ConnectionDatabase: Boolean;
      function CreateDatabase: Boolean;

      procedure CreateUpedateDB;
   end;

implementation

{ TConnect }

constructor TConnect.Create(NameConnection: TFDConnection);
begin
  FConnection := NameConnection;
end;

destructor TConnect.Destroy;
begin
  FConnection.Connected := False;

  inherited;
end;

Function TConnect.CreateFolderBD: string;
var
  LPath: String;

begin
  LPath := '\' + FPath;
  CreatePath(LPath);

  LPath := LPath + '\' + FFileName;
  CreateFile(LPath);

  Result := LPath;
end;

procedure TConnect.SetConnectDatabase;
begin
  FDatabase := CreateFolderBD;

  FConnection.Params.Clear;
  FConnection.Params.Add('DriverID=' + DriverID);
  FConnection.Params.Add('Database=' + FDatabase);

  case AnsiIndexStr(UpperCase(DriverID), ['SQLITE', 'MYSQL', 'FB']) of
    0: begin
        FConnection.Params.Add('OpenMode=' + 'ReadWrite');
       end;

    1: begin
        FServer := LoadIni('BANCO', 'Server', '127.0.0.1');
        FUser   := LoadIni('BANCO', 'UserName', 'root');
        FPass   := LoadIni('BANCO', 'Password', '123456');
        FPort   := LoadIni('BANCO', 'Port', '3306');

        FConnection.Params.Add('Server=' + FServer);
        FConnection.Params.Add('user_name=' + FUser);
        FConnection.Params.Add('password=' + FPass);
        FConnection.Params.Add('port=' + FPort);
       end;

    2: begin
        FServer := LoadIni('BANCO', 'Server', '127.0.0.1');
        FUser := LoadIni('BANCO', 'UserName', 'SYSDBA');
        FPass := LoadIni('BANCO', 'Password', 'masterkey');
        FPort := LoadIni('BANCO', 'Port', '3050');

        FConnection.Params.Add('Server='+ FServer);
        FConnection.Params.Add('user_name='+ FUser);
        FConnection.Params.Add('password='+ FPass);
        FConnection.Params.Add('port='+ FPort);
       end;
  end;

  FConnection.LoginPrompt := False;
end;

function TConnect.ConnectionDatabase: Boolean;
begin
  try
    Result := True;

    FConnection.Connected := False;
    FConnection.Connected := True;
  Except
    on E:Exception do
    begin
      FMsgErr := e.Message;

      Result := False;
    end;
  end;
end;

function TConnect.CreateDatabase: Boolean;
var
  Qry: TFDQuery;

begin
  try
    Result := True;

    FConnection.Connected := False;
    FConnection.Params.Values['Database'] := '';
    FConnection.Connected := True;

    try
      Qry := TFDQuery.Create(nil);
      Qry.Connection := FConnection;

      Qry.SQL.Clear;
      Qry.SQL.Add('create database ' + FDatabase);
      Qry.SQL.Add(' character set utf8');
      Qry.SQL.Add(' collate = utf8_bin');

      SaveLog(Qry.SQL.Text);

      Qry.Prepare;

      Qry.ExecSQL;

      FMsgErr := '';
    except
      on e:Exception do
        begin
          FMsgErr := e.ToString;

          Result := False;
        end;
    end;

  finally
    FreeAndNil(Qry)

  end;
end;

function TConnect.GetDllDriver(Dll: String): Boolean;
begin
  Result := True;

  if not (FileExists(Dll)) then
    begin
      ShowMessage('Arquivo ' + Dll + ' não foi localizado.' +#13+ 'Favor verificar!');

      Result := False;
    end;
end;

function TConnect.GetTables(SQLText: String): TDataSet;
var
  SQL: TFDQuery;

begin
  try
    SQL := TFDQuery.Create(Application);

    try
      SQL.Connection := FConnection;
      SQL.SQL.Add(SQLText);
      SQL.Open;

      Result := SQL;
    finally
      //FreeAndNil(SQL);

    end;
  except
    on E:Exception do
    begin
      Result := nil;

      raise Exception.Create('Atenção ocorreu um erro ' +#13+ e.ToString);
    end;
  end;
end;

procedure TConnect.CreateUpedateDB;
var
  Tables: TDataSet;
  TextoSQL: TStringList;

begin
  TextoSQL := TStringList.Create;

  try
    Tables := nil;
    Tables := GetTables('select name from sqlite_master where type="table"');

    if not Tables.Locate('name', 'CLIENTES', []) then
      begin
        TextoSQL.Clear;
        TextoSQL.Add('CREATE TABLE CLIENTES( ');
        TextoSQL.Add('  ID INTEGER NOT NULL UNIQUE, ');
        TextoSQL.Add('  NOME VARCHAR(40) NOT NULL, ');
        TextoSQL.Add('  TIPO CHAR(1) NOT NULL, ');
        TextoSQL.Add('  CPF_CNPJ VARCHAR(14) NOT NULL, ');
        TextoSQL.Add('  RG_IE VARCHAR(14), ');
        TextoSQL.Add('  DATA_CADASTRO DATE NOT NULL, ');
        TextoSQL.Add('  ATIVO CHAR(1), ');
        TextoSQL.Add('  PRIMARY KEY(ID AUTOINCREMENT)) ');

        SaveLog(TextoSQL.Text);

        FConnection.ExecSQL(TextoSQL.Text);
      end;

    if not Tables.Locate('name', 'TELEFONES', []) then
      begin
        TextoSQL.Clear;
        TextoSQL.Add('CREATE TABLE TELEFONES ( ');
        TextoSQL.Add('	ID INTEGER NOT NULL UNIQUE, ');
        TextoSQL.Add('	IDCLIENTE	INTEGER NOT NULL, ');
        TextoSQL.Add('	DDD	INTEGER NOT NULL, ');
        TextoSQL.Add('	NUMERO NUMERIC NOT NULL, ');
        TextoSQL.Add('	PRIMARY KEY(ID AUTOINCREMENT)) ');

        SaveLog(TextoSQL.Text);

        FConnection.ExecSQL(TextoSQL.Text);
      end;

    if not Tables.Locate('name', 'ENDERECOS', []) then
      begin
        TextoSQL.Clear;
        TextoSQL.Add('CREATE TABLE ENDERECOS ( ');
        TextoSQL.Add('	ID INTEGER NOT NULL UNIQUE,');
        TextoSQL.Add('	IDCLIENTE INTEGER NOT NULL,');
        TextoSQL.Add('	CEP VARCHAR(8) NOT NULL,');
        TextoSQL.Add('	LOGRADOURO CHAR(50) NOT NULL,');
        TextoSQL.Add('	NUMERO CHAR(5) NOT NULL,');
        TextoSQL.Add('	COMPLEMENTO	CHAR(10),');
        TextoSQL.Add('	BAIRRO CHAR(40),');
        TextoSQL.Add('	CIDADE CHAR(40),');
        TextoSQL.Add('	ESTADO CHAR(30),');
        TextoSQL.Add('	PAIS CHAR(20),');
        TextoSQL.Add('	PRIMARY KEY(ID AUTOINCREMENT) )');

        SaveLog(TextoSQL.Text);

        FConnection.ExecSQL(TextoSQL.Text);
      end;

  finally
    FreeAndNil(TextoSQL);

  end;
end;
end.

//Function FireBirdStarted: Boolean;
//Begin
//Result := ( FindWindow( ´FB_Guard´, Nil ) <> 0 ) ;
//End;
