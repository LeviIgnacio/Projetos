inherited FrmBomba: TFrmBomba
  Caption = 'Bomba'
  ClientHeight = 281
  ClientWidth = 507
  OnCreate = FormCreate
  ExplicitWidth = 513
  ExplicitHeight = 310
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 507
    Height = 228
    ExplicitWidth = 507
    ExplicitHeight = 228
    inherited TSFormulario: TTabSheet
      ExplicitWidth = 499
      ExplicitHeight = 200
      object Label1: TLabel [0]
        Left = 3
        Top = 3
        Width = 68
        Height = 13
        Caption = 'C'#243'digo Bomba'
      end
      object Label2: TLabel [1]
        Left = 3
        Top = 49
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object Label3: TLabel [2]
        Left = 3
        Top = 99
        Width = 72
        Height = 13
        Caption = 'C'#243'digo Tanque'
      end
      inherited Panel2: TPanel
        Top = 154
        Width = 499
        ExplicitTop = 154
        ExplicitWidth = 499
        inherited BtnSalvar: TSpeedButton
          Left = 462
          ExplicitLeft = 462
        end
      end
      object Campo_id_bomba: TEdit
        Left = 3
        Top = 22
        Width = 121
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 1
      end
      object Campo_dsc_nome: TEdit
        Left = 3
        Top = 68
        Width = 486
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 20
        TabOrder = 2
      end
      object Campo_ID_TENQUE: TEdit
        Left = 3
        Top = 118
        Width = 73
        Height = 21
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 3
        OnChange = Campo_ID_TENQUEChange
      end
      object Campo_Dsc_TENQUE: TDBLookupComboBox
        Left = 82
        Top = 118
        Width = 407
        Height = 21
        KeyField = 'ID_TENQUE'
        ListField = 'DSC_NOME'
        ListSource = DsTanque
        TabOrder = 4
        OnClick = Campo_Dsc_TENQUEClick
      end
    end
    inherited TSLista: TTabSheet
      ExplicitWidth = 499
      ExplicitHeight = 200
      inherited DBGrid1: TDBGrid
        Width = 499
        Height = 161
        OnCellClick = DBGrid1CellClick
      end
      inherited Panel3: TPanel
        Width = 499
        ExplicitWidth = 499
      end
    end
  end
  inherited Panel1: TPanel
    Width = 507
    ExplicitWidth = 507
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      
        'SELECT b.id_bomba, b.id_tanque, b.dsc_nome, t.dsc_nome as dsc_ta' +
        'nque'
      'FROM bomba b left join tanque t on b.id_tanque = t.id_tenque')
    object FDQuery1ID_BOMBA: TIntegerField
      DisplayLabel = 'C'#243'digo do Bomba'
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1ID_TANQUE: TIntegerField
      DisplayLabel = 'C'#243'digo do Tanque'
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
    end
    object FDQuery1DSC_NOME: TStringField
      DisplayLabel = 'Descri'#231#227'o da Bomba'
      FieldName = 'DSC_NOME'
      Origin = 'DSC_NOME'
    end
    object FDQuery1DSC_TANQUE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Descri'#231#227'o Tanque'
      FieldName = 'DSC_TANQUE'
      Origin = 'DSC_NOME'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object QryTanque: TFDQuery
    Connection = FrmDM.FDConnection1
    SQL.Strings = (
      'SELECT id_tenque, dsc_nome FROM tanque ')
    Left = 256
    Top = 64
  end
  object DsTanque: TDataSource
    DataSet = QryTanque
    Left = 296
    Top = 64
  end
end
