object FrmeDashboard: TFrmeDashboard
  Left = 0
  Top = 0
  Width = 936
  Height = 644
  TabOrder = 0
  object GroupBox1: TGroupBox
    Left = 3
    Top = 3
    Width = 414
    Height = 278
    Caption = 'Total por Tanque'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 14
      Width = 412
      Height = 263
      Align = alClient
      BorderStyle = bsNone
      DataSource = DSTanque
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DSC_TANQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_QUANTIDADE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_TOTAL'
          Visible = True
        end>
    end
  end
  object GroupBox2: TGroupBox
    Left = 3
    Top = 287
    Width = 414
    Height = 278
    Caption = 'Total vendas por bomba'
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object DBGrid2: TDBGrid
      Left = 1
      Top = 14
      Width = 412
      Height = 263
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsVendas
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DSC_TANQUE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DSC_BOMBA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_VALOR'
          Visible = True
        end>
    end
  end
  object QryVendas: TFDQuery
    Connection = FrmDM.FDConnection1
    SQL.Strings = (
      'select'
      '    t.dsc_nome as dsc_tanque,'
      '    b.dsc_nome as dsc_bomba,'
      '    Sum((NUM_QUANTIDADE * NUM_VALOR)) AS total_valor'
      'from'
      '    VENDA v'
      '    left join bomba b on v.id_bomba = b.id_bomba'
      '    left join tanque t on b.id_tanque = t.id_tenque'
      'group by'
      '    t.dsc_nome,'
      '    b.dsc_nome'
      'order by'
      '    t.dsc_nome,'
      '    b.dsc_nome')
    Left = 64
    Top = 336
    object QryVendasDSC_TANQUE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Tanque'
      FieldName = 'DSC_TANQUE'
      Origin = 'DSC_NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryVendasDSC_BOMBA: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Bomba'
      FieldName = 'DSC_BOMBA'
      Origin = 'DSC_NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryVendasTOTAL_VALOR: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'TOTAL'
      FieldName = 'TOTAL_VALOR'
      Origin = 'TOTAL_VALOR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 6
    end
  end
  object dsVendas: TDataSource
    DataSet = QryVendas
    Left = 104
    Top = 336
  end
  object QryTanque: TFDQuery
    Connection = FrmDM.FDConnection1
    SQL.Strings = (
      'select'
      '    ID_TANQUE,'
      '    T.dsc_nome AS DSC_TANQUE,'
      '    Sum(NUM_QUANTIDADE) as NUM_QUANTIDADE,'
      '    Sum((NUM_QUANTIDADE * NUM_VALOR)) AS NUM_TOTAL'
      'from'
      '    TANQUE_ABASTECIMENTO A'
      '    left join tanque T ON A.id_tanque = T.id_tenque'
      'group by ID_TANQUE, T.dsc_nome'
      'order by ID_TANQUE, T.dsc_nome'
      '')
    Left = 128
    Top = 80
    object QryTanqueDSC_TANQUE: TStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Desc. Tanque'
      FieldName = 'DSC_TANQUE'
      Origin = 'DSC_NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object QryTanqueNUM_QUANTIDADE: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Quantidade'
      FieldName = 'NUM_QUANTIDADE'
      Origin = 'NUM_QUANTIDADE'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object QryTanqueNUM_TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Total'
      FieldName = 'NUM_TOTAL'
      Origin = 'NUM_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 6
    end
  end
  object DSTanque: TDataSource
    DataSet = QryTanque
    Left = 176
    Top = 80
  end
end
