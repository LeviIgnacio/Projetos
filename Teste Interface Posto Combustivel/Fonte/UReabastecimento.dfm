inherited FrmReabastecimento: TFrmReabastecimento
  Caption = 'Reabastecimento'
  ClientHeight = 286
  OnCreate = FormCreate
  ExplicitHeight = 315
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 233
    ExplicitHeight = 233
    inherited TSFormulario: TTabSheet
      ExplicitHeight = 205
      object Label1: TLabel [0]
        Left = 5
        Top = 3
        Width = 119
        Height = 13
        Caption = 'C'#243'digo Reabastecimento'
      end
      object Label2: TLabel [1]
        Left = 3
        Top = 103
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object Label3: TLabel [2]
        Left = 3
        Top = 49
        Width = 72
        Height = 13
        Caption = 'C'#243'digo Tanque'
      end
      object Label4: TLabel [3]
        Left = 82
        Top = 103
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label5: TLabel [4]
        Left = 161
        Top = 103
        Width = 24
        Height = 13
        Caption = 'Total'
      end
      object Label6: TLabel [5]
        Left = 240
        Top = 103
        Width = 53
        Height = 13
        Caption = '% Imposto'
      end
      object Label7: TLabel [6]
        Left = 319
        Top = 103
        Width = 66
        Height = 13
        Caption = 'Total Imposto'
      end
      object Label8: TLabel [7]
        Left = 130
        Top = 3
        Width = 109
        Height = 13
        Caption = 'Data Reabastecimento'
      end
      inherited Panel2: TPanel
        Top = 159
        ExplicitTop = 159
      end
      object Campo_ID_TANQUE_ABASTECIMENTO: TEdit
        Left = 3
        Top = 22
        Width = 121
        Height = 21
        Color = cl3DLight
        ReadOnly = True
        TabOrder = 1
      end
      object Campo_NUM_QUANTIDADE: TEdit
        Left = 3
        Top = 122
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 5
        OnExit = Campo_NUM_QUANTIDADEExit
      end
      object Campo_ID_TENQUE: TEdit
        Left = 3
        Top = 68
        Width = 73
        Height = 21
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 3
        OnChange = Campo_ID_TENQUEChange
      end
      object Campo_Dsc_TENQUE: TDBLookupComboBox
        Left = 82
        Top = 68
        Width = 407
        Height = 21
        KeyField = 'ID_TENQUE'
        ListField = 'DSC_NOME'
        ListSource = DsTanque
        TabOrder = 4
        OnClick = Campo_Dsc_TENQUEClick
      end
      object Campo_NUM_VALOR: TEdit
        Left = 82
        Top = 122
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 6
        OnExit = Campo_NUM_VALORExit
      end
      object Campo_NUM_TOTAL: TEdit
        Left = 161
        Top = 122
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        Color = cl3DLight
        MaxLength = 30
        ReadOnly = True
        TabOrder = 7
      end
      object Campo_NUM_IMPOSTO: TEdit
        Left = 240
        Top = 122
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 8
        OnExit = Campo_NUM_IMPOSTOExit
      end
      object Campo_NUM_TOTAL_IMPOSTO: TEdit
        Left = 319
        Top = 122
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        Color = cl3DLight
        MaxLength = 30
        ReadOnly = True
        TabOrder = 9
      end
      object Campo_DT_ABASTECIMENTO: TDateTimePicker
        Left = 130
        Top = 22
        Width = 109
        Height = 21
        Date = 45397.000000000000000000
        Time = 0.954438645836489700
        TabOrder = 2
      end
    end
    inherited TSLista: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 634
      ExplicitHeight = 205
      inherited DBGrid1: TDBGrid
        Height = 166
        OnCellClick = DBGrid1CellClick
      end
      inherited Panel3: TPanel
        inherited BtnImprimir: TSpeedButton
          OnClick = BtnImprimirClick
        end
      end
    end
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      'select'
      '    ID_TANQUE_ABASTECIMENTO,'
      '    ID_TANQUE,'
      '    T.dsc_nome AS DSC_TANQUE,'
      '    DT_ABASTECIMENTO,'
      '    NUM_QUANTIDADE,'
      '    NUM_VALOR,'
      '    NUM_IMPOSTO,'
      '    (NUM_QUANTIDADE * NUM_VALOR) AS NUM_TOTAL,'
      
        '    ((NUM_QUANTIDADE * NUM_VALOR) * (NUM_IMPOSTO / 100)) AS NUM_' +
        'TOTAL_IMPOSTO'
      'from'
      '    TANQUE_ABASTECIMENTO A'
      '    left join tanque T ON A.id_tanque = T.id_tenque')
    Left = 256
    Top = 120
    object FDQuery1ID_TANQUE_ABASTECIMENTO: TIntegerField
      DisplayLabel = 'C'#243'digo de Abastecimento'
      FieldName = 'ID_TANQUE_ABASTECIMENTO'
      Origin = 'ID_TANQUE_ABASTECIMENTO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1ID_TANQUE: TIntegerField
      DisplayLabel = 'C'#243'digo de Tanque'
      FieldName = 'ID_TANQUE'
      Origin = 'ID_TANQUE'
    end
    object FDQuery1DSC_TANQUE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Desc. Tanque'
      FieldName = 'DSC_TANQUE'
      Origin = 'DSC_NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuery1DT_ABASTECIMENTO: TSQLTimeStampField
      DisplayLabel = 'Data Abastecimento'
      FieldName = 'DT_ABASTECIMENTO'
      Origin = 'DT_ABASTECIMENTO'
    end
    object FDQuery1NUM_QUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'NUM_QUANTIDADE'
      Origin = 'NUM_QUANTIDADE'
      Precision = 18
      Size = 2
    end
    object FDQuery1NUM_VALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'NUM_VALOR'
      Origin = 'NUM_VALOR'
      Precision = 18
    end
    object FDQuery1NUM_TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Total'
      FieldName = 'NUM_TOTAL'
      Origin = 'NUM_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
      Size = 6
    end
    object FDQuery1NUM_IMPOSTO: TFMTBCDField
      DisplayLabel = 'Perc. Imposto'
      FieldName = 'NUM_IMPOSTO'
      Origin = 'NUM_IMPOSTO'
      Precision = 18
      Size = 2
    end
    object FDQuery1NUM_TOTAL_IMPOSTO: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Imposto'
      FieldName = 'NUM_TOTAL_IMPOSTO'
      Origin = 'NUM_TOTAL_IMPOSTO'
      ProviderFlags = []
      ReadOnly = True
      Precision = 18
    end
  end
  inherited DataSource1: TDataSource
    Left = 304
    Top = 120
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
