unit UModel.ABASTECIMENTO;

interface
  uses Pattern.ObjectModel, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TTanque_Abastecimento = Class(TInterfacedObject, IObjectRTTI)
    function Gravar: Boolean;
    function Deletar: Boolean;
  private
    Fnum_valor: Currency;
    Fid_Tanque_Abastecimento: Integer;
    Fnum_quantidade: Currency;
    Fid_tanque: Integer;
    Fnum_imposto: Currency;
    Fdt_abastecimento: TDateTime;
  public
    property id_tanque_abastecimento :Integer read Fid_Tanque_Abastecimento write Fid_Tanque_Abastecimento;
    property id_tanque :Integer read Fid_tanque write Fid_tanque;
    property dt_abastecimento :TDateTime read Fdt_abastecimento write Fdt_abastecimento;
    property num_quantidade :Currency read Fnum_quantidade write Fnum_quantidade;
    property num_valor :Currency read Fnum_valor write Fnum_valor;
    property num_imposto :Currency read Fnum_imposto write Fnum_imposto;
  end;

implementation
  uses UDM;

{ TTanque_Abastecimento }

function TTanque_Abastecimento.Deletar: Boolean;
var
  qryAbastecimento: TFDQuery;
begin
  qryAbastecimento := TFDQuery.Create(nil);

  try
    qryAbastecimento.Connection := FrmDM.FDConnection1;
    qryAbastecimento.SQL.Add(
      'select ID_TANQUE_ABASTECIMENTO, ID_TANQUE, DT_ABASTECIMENTO, '+
      'NUM_QUANTIDADE, NUM_VALOR, NUM_IMPOSTO '+
      'from TANQUE_ABASTECIMENTO WHERE ID_TANQUE_ABASTECIMENTO = :ID_TANQUE_ABASTECIMENTO ');
    qryAbastecimento.ParamByName('ID_TANQUE_ABASTECIMENTO').Value := FID_TANQUE_ABASTECIMENTO;
    qryAbastecimento.Open;

    if qryAbastecimento.RecordCount <> 0 then
      qryAbastecimento.Delete;

    Result := True;
  finally
    qryAbastecimento.Close;
    qryAbastecimento.Free;
  end;
end;

function TTanque_Abastecimento.Gravar: Boolean;
var
  qryAbastecimento: TFDQuery;
begin
  qryAbastecimento := TFDQuery.Create(nil);

  try
    qryAbastecimento.Connection := FrmDM.FDConnection1;
    qryAbastecimento.SQL.Add(
      'select ID_TANQUE_ABASTECIMENTO, ID_TANQUE, DT_ABASTECIMENTO, '+
      'NUM_QUANTIDADE, NUM_VALOR, NUM_IMPOSTO '+
      'from TANQUE_ABASTECIMENTO WHERE ID_TANQUE_ABASTECIMENTO = :ID_TANQUE_ABASTECIMENTO ');
    qryAbastecimento.ParamByName('ID_TANQUE_ABASTECIMENTO').Value := FID_TANQUE_ABASTECIMENTO;
    qryAbastecimento.Open;

    if qryAbastecimento.RecordCount = 0 then
      qryAbastecimento.Insert
    else
      qryAbastecimento.Edit;

    qryAbastecimento.FieldByName('ID_TANQUE_ABASTECIMENTO').Value := Self.Fid_Tanque_Abastecimento;
    qryAbastecimento.FieldByName('DT_ABASTECIMENTO').Value        := Self.Fdt_abastecimento;
    qryAbastecimento.FieldByName('ID_TANQUE').Value               := Self.Fid_tanque;
    qryAbastecimento.FieldByName('NUM_QUANTIDADE').Value          := Self.Fnum_quantidade;
    qryAbastecimento.FieldByName('NUM_VALOR').Value               := Self.Fnum_valor;
    qryAbastecimento.FieldByName('NUM_IMPOSTO').Value             := Self.Fnum_imposto;
    qryAbastecimento.Post;
    Result := True;
  finally
    qryAbastecimento.Close;
    qryAbastecimento.Free;
  end;
end;

end.
