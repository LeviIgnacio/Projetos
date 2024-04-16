object FrmDM: TFrmDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=C:\Teste FortesTecnologias\Banco\DBTESTE.FDB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'Server=localhost')
    LoginPrompt = False
    Left = 32
    Top = 8
  end
  object QryExec: TFDQuery
    Connection = FDConnection1
    Left = 112
    Top = 8
  end
end
