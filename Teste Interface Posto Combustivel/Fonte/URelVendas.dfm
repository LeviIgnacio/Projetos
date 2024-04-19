object FrmRelVendas: TFrmRelVendas
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Vendas'
  ClientHeight = 296
  ClientWidth = 796
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
    Left = 0
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
        Width = 121
        Height = 16
        Caption = 'Relat'#243'rio de Vendas'
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
      Height = 34
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel1: TRLLabel
        Left = 3
        Top = 12
        Width = 31
        Height = 16
        Caption = 'Data'
      end
      object RLLabel2: TRLLabel
        Left = 112
        Top = 12
        Width = 46
        Height = 16
        Caption = 'Tanque'
      end
      object RLLabel3: TRLLabel
        Left = 367
        Top = 12
        Width = 45
        Height = 16
        Caption = 'Bomba'
      end
      object RLLabel4: TRLLabel
        Left = 608
        Top = 12
        Width = 34
        Height = 16
        Caption = 'Valor'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 147
      Width = 718
      Height = 30
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      AfterPrint = RLBand3AfterPrint
      object RLDBText1: TRLDBText
        Left = 3
        Top = 6
        Width = 103
        Height = 16
        AutoSize = False
        DataField = 'DT_VENDA'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 112
        Top = 6
        Width = 249
        Height = 16
        AutoSize = False
        DataField = 'DSC_TANQUE'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 367
        Top = 6
        Width = 235
        Height = 16
        AutoSize = False
        DataField = 'DSC_BOMBA'
        DataSource = DataSource1
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 608
        Top = 6
        Width = 95
        Height = 16
        DataField = 'TOTAL_VALOR'
        DataSource = DataSource1
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 177
      Width = 718
      Height = 32
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      BeforePrint = RLBand4BeforePrint
      object RLLabel6: TRLLabel
        Left = 543
        Top = 6
        Width = 32
        Height = 16
        Caption = 'Total'
      end
      object RLLabelTotal: TRLLabel
        Left = 608
        Top = 6
        Width = 105
        Height = 16
        AutoSize = False
      end
    end
  end
  object FDQuery1: TFDQuery
    Connection = FrmDM.FDConnection1
    SQL.Strings = (
      'select'
      '    v.DT_VENDA,'
      '    t.dsc_nome as dsc_tanque,'
      '    b.dsc_nome as dsc_bomba,'
      '    Sum((NUM_QUANTIDADE * NUM_VALOR)) AS total_valor'
      'from'
      '    VENDA v'
      '    left join bomba b on v.id_bomba = b.id_bomba'
      '    left join tanque t on b.id_tanque = t.id_tenque'
      'group by'
      '    v.DT_VENDA,'
      '    t.dsc_nome,'
      '    b.dsc_nome'
      'order by'
      '    v.DT_VENDA,'
      '    t.dsc_nome,'
      '    b.dsc_nome')
    Left = 576
    Top = 8
    object FDQuery1DT_VENDA: TSQLTimeStampField
      FieldName = 'DT_VENDA'
      Origin = 'DT_VENDA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object FDQuery1DSC_TANQUE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DSC_TANQUE'
      Origin = 'DSC_NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuery1DSC_BOMBA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DSC_BOMBA'
      Origin = 'DSC_NOME'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQuery1TOTAL_VALOR: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_VALOR'
      Origin = 'TOTAL_VALOR'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 616
    Top = 8
  end
end
