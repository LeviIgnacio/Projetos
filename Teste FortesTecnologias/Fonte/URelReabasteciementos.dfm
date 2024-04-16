object Frm_RelReabasteciemento: TFrm_RelReabasteciemento
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Reabasteciemento'
  ClientHeight = 312
  ClientWidth = 952
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 8
    Top = -2
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RLReport1BeforePrint
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btTitle
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object lblNomeTitulo: TRLLabel
        Left = 280
        Top = 24
        Width = 178
        Height = 16
        Caption = 'Relat'#243'rio de Reabastecimento'
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 53
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 628
        Top = 53
        Width = 87
        Height = 16
        Anchors = [fkRight]
        Info = itPageNumber
        Text = ''
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 28
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = True
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 3
        Top = 6
        Width = 31
        Height = 16
        Caption = 'Data'
      end
      object RLLabel2: TRLLabel
        Left = 96
        Top = 6
        Width = 46
        Height = 16
        Caption = 'Tanque'
      end
      object RLLabel3: TRLLabel
        Left = 368
        Top = 6
        Width = 70
        Height = 16
        Caption = 'Quantidade'
      end
      object RLLabel4: TRLLabel
        Left = 492
        Top = 6
        Width = 66
        Height = 16
        Caption = 'Valor Total'
      end
      object RLLabel5: TRLLabel
        Left = 608
        Top = 6
        Width = 82
        Height = 16
        Caption = 'Total Imposto'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 141
      Width = 718
      Height = 34
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      AfterPrint = RLBand3AfterPrint
      object RLDBText1: TRLDBText
        Left = 3
        Top = 6
        Width = 86
        Height = 16
        AutoSize = False
        DataField = 'DT_ABASTECIMENTO'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 95
        Top = 6
        Width = 266
        Height = 16
        AutoSize = False
        DataField = 'DSC_TANQUE'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 367
        Top = 6
        Width = 70
        Height = 16
        DataField = 'NUM_QUANTIDADE'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 492
        Top = 6
        Width = 66
        Height = 16
        DataField = 'NUM_TOTAL'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 608
        Top = 6
        Width = 84
        Height = 16
        DataField = 'NUM_TOTAL_IMPOSTO'
        DataSource = DataSource1
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 175
      Width = 718
      Height = 30
      BandType = btSummary
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = RLBand4BeforePrint
      object RLLabel6: TRLLabel
        Left = 303
        Top = 6
        Width = 32
        Height = 16
        Caption = 'Total'
      end
      object RLLabelTotalQuantidade: TRLLabel
        Left = 368
        Top = 6
        Width = 105
        Height = 16
        AutoSize = False
      end
      object RLLabelTotalValor: TRLLabel
        Left = 492
        Top = 6
        Width = 101
        Height = 16
        AutoSize = False
      end
      object RLLabelTotalImposto: TRLLabel
        Left = 608
        Top = 3
        Width = 125
        Height = 16
      end
    end
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FrmDM.FDConnection1
    SQL.Strings = (
      'select'
      '    DT_ABASTECIMENTO,'
      '    ID_TANQUE,'
      '    T.dsc_nome AS DSC_TANQUE,'
      '    Sum(NUM_QUANTIDADE) as NUM_QUANTIDADE,'
      '    Sum(NUM_VALOR) as NUM_VALOR,'
      '    Sum((NUM_QUANTIDADE * NUM_VALOR)) AS NUM_TOTAL,'
      '    Sum(NUM_IMPOSTO) as NUM_IMPOSTO,'
      
        '    Sum(((NUM_QUANTIDADE * NUM_VALOR) * (NUM_IMPOSTO / 100))) AS' +
        ' NUM_TOTAL_IMPOSTO'
      'from'
      '    TANQUE_ABASTECIMENTO A'
      '    left join tanque T ON A.id_tanque = T.id_tenque'
      'group by DT_ABASTECIMENTO, ID_TANQUE, T.dsc_nome'
      'order by DT_ABASTECIMENTO')
    Left = 720
    Top = 128
    object FDQuery1DT_ABASTECIMENTO: TSQLTimeStampField
      DisplayLabel = 'Data Abastecimento'
      FieldName = 'DT_ABASTECIMENTO'
      Origin = 'DT_ABASTECIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
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
    object FDQuery1NUM_QUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade'
      FieldName = 'NUM_QUANTIDADE'
      Origin = 'NUM_QUANTIDADE'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object FDQuery1NUM_VALOR: TBCDField
      DisplayLabel = 'Valor'
      FieldName = 'NUM_VALOR'
      Origin = 'NUM_VALOR'
      DisplayFormat = '0.00'
      Precision = 18
    end
    object FDQuery1NUM_TOTAL: TFMTBCDField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Valor Total'
      FieldName = 'NUM_TOTAL'
      Origin = 'NUM_TOTAL'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 6
    end
    object FDQuery1NUM_IMPOSTO: TFMTBCDField
      DisplayLabel = 'Perc. Imposto'
      FieldName = 'NUM_IMPOSTO'
      Origin = 'NUM_IMPOSTO'
      DisplayFormat = '0.00'
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
      DisplayFormat = '0.00'
      Precision = 18
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 768
    Top = 128
  end
end
