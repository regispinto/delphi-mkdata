unit uFunctions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.StrUtils,
  Data.DB, Vcl.Grids, FireDAC.Comp.Client, IniFiles;

  function ChangePointToComma(Value: string): string;
  function SaveLog(Log: string; Separator: Boolean=False): string;
  function NextID(Connection: TFDConnection; Table, Field: string): integer;
  function CheckIniParams(FileName: string='Config.ini'): Boolean;
  function GetFileFromUrl(Url: String): String;
  function LoadIni(Key1, Key2, DefaultValue: string; FileName: string='config.ini'): String;

  procedure SaveIni(Key1, Key2, aTexto: string; FileName: string='config.ini');
  procedure CreateIniParams(DriverName: string);
  procedure CreatePath(var Path: string);
  procedure CreateFile(Path: string);

Const
  CR = #13;

implementation

procedure SaveIni(Key1, Key2, aTexto: string; FileName: string='config.ini');
var
  ArqIni: TIniFile;

begin
  ArqIni := TIniFile.Create(System.SysUtils.GetCurrentDir + '\' + FileName);

  try
    ArqIni.WriteString(Key1, Key2, aTexto);
  finally
    ArqIni.Free;
  end;
end;

function LoadIni(Key1, Key2, DefaultValue: string; FileName: string='config.ini'): String;
var
  ArqIni: TIniFile;
  FilePath: String;

begin
  FilePath := ExtractFilePath(ParamStr(0)) + FileName;

  Result := DefaultValue;

  try
    ArqIni := TIniFile.Create(FilePath);

    if FileExists(FilePath) then
      Result := ArqIni.ReadString(Key1, Key2, DefaultValue)

  finally
    FreeAndNil(ArqIni)
  end;
end;

function CheckIniParams(FileName: string='Config.ini'): Boolean;
begin
  Result := True;

  if not (FileExists(FileName)) then
    begin
      CreateFile(FileName);
      Result := False;
    end;
end;

procedure CreateIniParams(DriverName: string);
begin
  case AnsiIndexStr(UpperCase(DriverName), ['MYSQL', 'FB']) of
    0:  begin
          SaveIni('BANCO', 'Port', '3306');
          SaveIni('BANCO', 'Database', 'db_dados');
          SaveIni('BANCO', 'Server', '127.0.0.1');
          SaveIni('BANCO', 'User', 'root');
          SaveIni('BANCO', 'Pass', 'root');
        end;

    1:  begin
          SaveIni('BANCO', 'Port', '3350');
          SaveIni('BANCO', 'Database', 'db_dados.fdb');
          SaveIni('BANCO', 'Server', '127.0.0.1');
          SaveIni('BANCO', 'User', 'SYSDBA');
          SaveIni('BANCO', 'Pass', 'masterkey');
        end;
  end;
end;

function ChangePointToComma(Value: string): string;
begin
  Result := Trim(StringReplace(Value, ',', '.', [rfReplaceall]));
end;

function NextID(Connection: TFDConnection; Table, Field: string): integer;
var
  QryConsulta: TFDQuery;

begin
  Result := 1;
  Try
    Connection.Connected := False;
    Connection.Connected := True;

    QryConsulta := TFDQuery.Create(nil);

    QryConsulta.Connection := Connection;
    QryConsulta.Close;
    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('select max(' + Field + ') as codigo from ' + Table);
    QryConsulta.Open;

    if QryConsulta.FieldByName('CODIGO').AsString <> '' then
      Result := QryConsulta.FieldByName('CODIGO').AsInteger + 1;

  finally
    FreeAndNil(QryConsulta);
  end;
end;

function SaveLog(Log: string; Separator: Boolean=False): string;
Var
  NameLog, TextLog: String;
  FileLog: TextFile;

begin
  NameLog := ExtractFilePath(Application.ExeName) + FormatDateTime('yyyymmdd', now) + '.log';

  AssignFile(FileLog, NameLog);

  if FileExists(NameLog) then
    Append(FileLog)
  else
    ReWrite(FileLog);

  if Not FileExists(ExtractFilePath(Application.ExeName) + NameLog) then
    FileCreate(ExtractFilePath(Application.ExeName) + NameLog);

  try
    TextLog := ('[' + FormatDateTime('hh:nn:ss', now) + '] - ' + Log);

    if Separator then
      TextLog := TextLog + CR + Dupestring('-', 40);

    WriteLn(FileLog, TextLog);
  finally
    CloseFile(FileLog);
  end;
end;

procedure CreatePath(var Path: String);
var
  LPath: String;

begin
  LPath := System.SysUtils.GetCurrentDir;
  Path := LPath + Path;
  ForceDirectories(Path);
end;

procedure CreateFile(Path: String);
var
  LFile: TextFile;

begin
  if not (FileExists(Path)) then
  begin
    try
      AssignFile(LFile, Path);
      Rewrite(LFile)
    finally
      CloseFile(LFile)
    end;
  end;
end;

function GetFileFromUrl(Url: String): String;
var
  pos: ShortInt;

begin
  pos := LastDelimiter('/', Url);

  Result := Copy(url, pos + 1, MaxInt);
end;

end.
