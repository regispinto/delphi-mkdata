unit uCreateTables;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.StrUtils,
  Data.DB, Vcl.Grids, FireDAC.Comp.Client, IniFiles;

  procedure CreateUpedateDB;

  function GetTables(SQLText: String): TDataSet;

implementation

uses uDM, uFunctions, ClassConnection;


function GetTables(SQLText: String): TDataSet;
var
  SQL: TFDQuery;

begin
  try
    SQL := TFDQuery.Create(Application);

    try
      SQL.Connection := DM.FDConnection;
      SQL.SQL.Add(SQLText);

      SaveLog('uCreateTables.GetTables: ' + CR + SQL.SQL.Text);

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

procedure CreateUpedateDB;
var
  Tables: TDataSet;
  TextoSQL: TStringList;

begin
  try
    // Verifica a existência das tabelas no banco de dados
    Tables := GetTables('select name from sqlite_master where type="table"');

    TextoSQL := TStringList.Create;

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
    FreeAndNil(Tables);

  end;
end;

end.


procedure TConnect.CreateUpedateDB0;
var
  Tables: TDataSet;
  TextoSQL: TStringList;

begin
  TextoSQL := TStringList.Create;

  try
    {
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
    }
  finally
    FreeAndNil(TextoSQL);

  end;
end;

