object DataModuleConection: TDataModuleConection
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object FDConnectionFB: TFDConnection
    Params.Strings = (
      'Database=C:\OrcamentoCentroCusto\CENTROCUSTO.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Protocol=TCPIP'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    Left = 72
    Top = 24
  end
  object FDQueryFB: TFDQuery
    Connection = FDConnectionFB
    Left = 96
    Top = 96
  end
end
