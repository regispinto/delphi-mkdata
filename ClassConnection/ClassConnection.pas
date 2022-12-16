unit ClassConnection;

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

      function GetDllDriver(Dll: string): Boolean;
      function CreateFolderBD: string;

      procedure SetConnectDatabase;
      procedure CreateDatabase;

      function ConnectionDatabase: Boolean;
      function ValidateDatabase: Boolean;
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
  //FDatabase := CreateFolderBD;

  FConnection.Params.Clear;
  FConnection.Params.Add('DriverID=' + DriverID);

  case AnsiIndexStr(UpperCase(DriverID), ['SQLITE', 'MYSQL', 'FB']) of
    0: begin
        FDatabase := CreateFolderBD;

        FConnection.Params.Add('OpenMode=' + 'ReadWrite');
       end;

    1: begin
        FServer   := LoadIni('BANCO', 'Server', '127.0.0.1');
        FUser     := LoadIni('BANCO', 'UserName', 'root');
        FPass     := LoadIni('BANCO', 'Password', 'root');
        FPort     := LoadIni('BANCO', 'Port', '3306');
        FDatabase := LoadIni('BANCO', 'Database', 'db_dados');

        FConnection.Params.Add('Server=' + FServer);
        FConnection.Params.Add('user_name=' + FUser);
        FConnection.Params.Add('password=' + FPass);
        FConnection.Params.Add('port=' + FPort);
        FConnection.Params.Add('database=' + FDatabase);
       end;

    2: begin
        FServer := LoadIni('BANCO', 'Server', '127.0.0.1');
        FUser   := LoadIni('BANCO', 'UserName', 'SYSDBA');
        FPass   := LoadIni('BANCO', 'Password', 'masterkey');
        FPort   := LoadIni('BANCO', 'Port', '3050');

        FConnection.Params.Add('Server='+ FServer);
        FConnection.Params.Add('user_name='+ FUser);
        FConnection.Params.Add('password='+ FPass);
        FConnection.Params.Add('port='+ FPort);
        FConnection.Params.Add('database=' + FDatabase);
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

function TConnect.ValidateDatabase: Boolean;
var
  Qry: TFDQuery;

begin
  try
    try
      Qry := TFDQuery.Create(nil);
      Qry.Connection := FConnection;

      Qry.SQL.Clear;
      Qry.Close;
      Qry.SQL.Add('show databases like ' + QuotedStr(FDatabase));
      SaveLog('ClassConnection.ValidateDatabase: ' + CR + Qry.SQL.Text);
      Qry.Open;

      Result := Qry.RowsAffected > 0;
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

procedure TConnect.CreateDatabase;
var
  Qry: TFDQuery;

begin
  try
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

      SaveLog('ClassConnection.CreateDatabase: ' + CR + Qry.SQL.Text);

      Qry.Prepare;
      Qry.ExecSQL;

      FMsgErr := '';
    except
      on e:Exception do
        FMsgErr := 'Erro ao criar o banco de dados ' + FDatabase + CR +
          'Erro: ' + CR + e.ToString;
    end;
  finally
    SaveLog('ClassConnection.CreateDatabase: ' + CR + FMsgErr);
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

end.

//Function FireBirdStarted: Boolean;
//Begin
//Result := ( FindWindow( ´FB_Guard´, Nil ) <> 0 ) ;
//End;
