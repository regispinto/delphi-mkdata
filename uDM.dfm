object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 301
  Width = 402
  object FDConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\regis\Documents\Workspace\delphi-mkdata\Win32\' +
        'Debug\Database\mkdata.db'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 72
    Top = 64
  end
  object FDPhysSQLiteDriverLink: TFDPhysSQLiteDriverLink
    Left = 72
    Top = 120
  end
  object FDGUIxWaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 72
    Top = 184
  end
end
