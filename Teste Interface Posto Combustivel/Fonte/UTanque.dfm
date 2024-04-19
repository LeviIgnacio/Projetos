inherited FrmTanque: TFrmTanque
  Caption = 'FrmTanque'
  ClientHeight = 233
  ClientWidth = 502
  OnCreate = FormCreate
  ExplicitWidth = 508
  ExplicitHeight = 262
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Top = 57
    Width = 502
    Height = 176
    ExplicitTop = 57
    ExplicitWidth = 502
    ExplicitHeight = 176
    inherited TSFormulario: TTabSheet
      ExplicitWidth = 494
      ExplicitHeight = 148
      object Label1: TLabel [0]
        Left = 3
        Top = 3
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label2: TLabel [1]
        Left = 3
        Top = 49
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      inherited Panel2: TPanel
        Top = 102
        Width = 494
        ExplicitTop = 102
        ExplicitWidth = 494
        DesignSize = (
          494
          46)
        inherited BtnSalvar: TSpeedButton
          Left = 455
          ExplicitLeft = 455
        end
      end
      object Campo_id_tenque: TEdit
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
    end
    inherited TSLista: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 494
      ExplicitHeight = 148
      inherited DBGrid1: TDBGrid
        Width = 494
        Height = 109
        OnCellClick = DBGrid1CellClick
      end
      inherited Panel3: TPanel
        Width = 494
        ExplicitWidth = 494
      end
    end
  end
  inherited Panel1: TPanel
    Width = 502
    Height = 57
    ExplicitWidth = 502
    ExplicitHeight = 57
    inherited BtnAdicionar: TSpeedButton
      Left = 7
      Top = 12
      ExplicitLeft = 7
      ExplicitTop = 12
    end
    inherited BtnAlterar: TSpeedButton
      Left = 47
      Top = 12
      ExplicitLeft = 47
      ExplicitTop = 12
    end
    inherited BtnDeletar: TSpeedButton
      Left = 87
      Top = 12
      ExplicitLeft = 87
      ExplicitTop = 12
    end
  end
  inherited FDQuery1: TFDQuery
    SQL.Strings = (
      'SELECT id_tenque, dsc_nome FROM tanque')
    object FDQuery1ID_TENQUE: TIntegerField
      DisplayLabel = 'C'#243'digo do Tanque'
      FieldName = 'ID_TENQUE'
      Origin = 'ID_TENQUE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery1DSC_NOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DSC_NOME'
      Origin = 'DSC_NOME'
    end
  end
end
