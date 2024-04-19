inherited FrmVenda: TFrmVenda
  Caption = 'Venda'
  ClientHeight = 290
  OnCreate = FormCreate
  ExplicitHeight = 319
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 237
    ExplicitHeight = 237
    inherited TSFormulario: TTabSheet
      ExplicitHeight = 209
      object Label1: TLabel [0]
        Left = 3
        Top = 3
        Width = 66
        Height = 13
        Caption = 'C'#243'digo Venda'
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
        Width = 68
        Height = 13
        Caption = 'C'#243'digo Bomba'
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
        Left = 495
        Top = 3
        Width = 56
        Height = 13
        Caption = 'Data Venda'
      end
      object Label9: TLabel [8]
        Left = 130
        Top = 3
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      inherited Panel2: TPanel
        Top = 163
        ExplicitTop = 163
      end
      object Campo_ID_VENDA: TEdit
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
        TabOrder = 6
        OnExit = Campo_NUM_QUANTIDADEExit
      end
      object Campo_ID_BOMBA: TEdit
        Left = 3
        Top = 68
        Width = 73
        Height = 21
        MaxLength = 2
        NumbersOnly = True
        TabOrder = 4
        OnChange = Campo_ID_BOMBAChange
      end
      object Campo_Dsc_BOMBA: TDBLookupComboBox
        Left = 82
        Top = 68
        Width = 407
        Height = 21
        KeyField = 'ID_BOMBA'
        ListField = 'DSC_NOME'
        ListSource = DsBomba
        TabOrder = 5
        OnClick = Campo_Dsc_BOMBAClick
      end
      object Campo_NUM_VALOR: TEdit
        Left = 82
        Top = 122
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 7
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
        TabOrder = 8
      end
      object Campo_NUM_IMPOSTO: TEdit
        Left = 240
        Top = 122
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 30
        TabOrder = 9
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
        TabOrder = 10
      end
      object Campo_DT_VENDA: TDateTimePicker
        Left = 495
        Top = 22
        Width = 109
        Height = 21
        Date = 45397.000000000000000000
        Time = 0.954438645836489700
        TabOrder = 3
      end
      object Campo_DSC_CLIENTE: TEdit
        Left = 130
        Top = 22
        Width = 359
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 50
        TabOrder = 2
      end
    end
    inherited TSLista: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 634
      ExplicitHeight = 209
      inherited DBGrid1: TDBGrid
        Height = 170
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
      '    v.ID_VENDA,'
      '    v.ID_BOMBA,'
      '    b.dsc_nome,'
      '    v.DSC_CLIENTE,'
      '    v.DT_VENDA,'
      '    v.NUM_QUANTIDADE,'
      '    v.NUM_VALOR,'
      '    v.NUM_IMPOSTO,'
      '    (NUM_QUANTIDADE * NUM_VALOR) AS NUM_TOTAL,'
      
        '    ((NUM_QUANTIDADE * NUM_VALOR) * (NUM_IMPOSTO / 100)) AS NUM_' +
        'TOTAL_IMPOSTO'
      'from'
      '    VENDA v'
      '    left join bomba b on v.id_bomba = b.id_bomba')
    Left = 256
    Top = 112
    object FDQuery1ID_VENDA: TIntegerField
      DisplayLabel = 'C'#243'digo de Venda'
      FieldName = 'ID_VENDA'
      Origin = 'ID_VENDA'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1ID_BOMBA: TIntegerField
      DisplayLabel = 'C'#243'digo de Bomba'
      FieldName = 'ID_BOMBA'
      Origin = 'ID_BOMBA'
    end
    object FDQuery1DSC_NOME: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Desc. Bomba'
      FieldName = 'DSC_NOME'
      Origin = 'DSC_NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuery1DSC_CLIENTE: TStringField
      DisplayLabel = 'Desc. Cliente'
      FieldName = 'DSC_CLIENTE'
      Origin = 'DSC_CLIENTE'
      Size = 50
    end
    object FDQuery1DT_VENDA: TSQLTimeStampField
      DisplayLabel = 'Data Venda'
      FieldName = 'DT_VENDA'
      Origin = 'DT_VENDA'
    end
    object FDQuery1NUM_QUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quntidade'
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
      DisplayLabel = 'Per. Imposto'
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
    Left = 296
    Top = 112
  end
  object QryBomba: TFDQuery
    Connection = FrmDM.FDConnection1
    SQL.Strings = (
      'SELECT ID_BOMBA, dsc_nome FROM BOMBA ')
    Left = 256
    Top = 64
  end
  object DsBomba: TDataSource
    DataSet = QryBomba
    Left = 296
    Top = 64
  end
end
