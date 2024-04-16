unit UModel.Venda;

interface
  uses Pattern.ObjectModel, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TVenda = Class(TInterfacedObject, IObjectRTTI)
    function Gravar: Boolean;
    function Deletar: Boolean;
  private
    Fnum_valor: Currency;
    FDT_VENDA: TDate;
    FID_BOMBA: Integer;
    FID_VENDA: Integer;
    FDSC_CLIENTE: string;
    Fnum_quantidade: Currency;
    Fnum_imposto: Currency;
  public
    property ID_VENDA :Integer read FID_VENDA write FID_VENDA;
    property ID_BOMBA :Integer read FID_BOMBA write FID_BOMBA;
    property DSC_CLIENTE :string read FDSC_CLIENTE write FDSC_CLIENTE;
    property DT_VENDA :TDate read FDT_VENDA write FDT_VENDA;
    property num_quantidade :Currency read Fnum_quantidade write Fnum_quantidade;
    property num_valor :Currency read Fnum_valor write Fnum_valor;
    property num_imposto :Currency read Fnum_imposto write Fnum_imposto;
  end;

implementation
  uses UDM;

{ TVenda }

function TVenda.Deletar: Boolean;
var
  qryVenda: TFDQuery;
begin
  qryVenda := TFDQuery.Create(nil);

  try
    qryVenda.Connection := FrmDM.FDConnection1;
    qryVenda.SQL.Add(
      'select ID_VENDA, ID_BOMBA, DSC_CLIENTE, DT_VENDA, NUM_QUANTIDADE, '+
      'NUM_VALOR, NUM_IMPOSTO from VENDA WHERE ID_VENDA = :ID_VENDA ');
    qryVenda.ParamByName('ID_VENDA').Value := FID_VENDA;
    qryVenda.Open;

    if qryVenda.RecordCount <> 0 then
      qryVenda.Delete;

    Result := True;
  finally
    qryVenda.Close;
    qryVenda.Free;
  end;
end;

function TVenda.Gravar: Boolean;
var
  qryVenda: TFDQuery;
begin
  qryVenda := TFDQuery.Create(nil);

  try
    qryVenda.Connection := FrmDM.FDConnection1;
    qryVenda.SQL.Add(
      'select ID_VENDA, ID_BOMBA, DSC_CLIENTE, DT_VENDA, NUM_QUANTIDADE, '+
      'NUM_VALOR, NUM_IMPOSTO from VENDA WHERE ID_VENDA = :ID_VENDA ');
    qryVenda.ParamByName('ID_VENDA').Value := FID_VENDA;
    qryVenda.Open;

    if qryVenda.RecordCount = 0 then
      qryVenda.Insert
    else
      qryVenda.Edit;

    qryVenda.FieldByName('ID_VENDA').Value       := Self.FID_VENDA;
    qryVenda.FieldByName('ID_BOMBA').Value       := Self.FID_BOMBA;
    qryVenda.FieldByName('DSC_CLIENTE').Value    := Self.FDSC_CLIENTE;
    qryVenda.FieldByName('DT_VENDA').Value       := Self.FDT_VENDA;
    qryVenda.FieldByName('NUM_QUANTIDADE').Value := Self.FNUM_QUANTIDADE;
    qryVenda.FieldByName('NUM_VALOR').Value      := Self.FNUM_VALOR;
    qryVenda.FieldByName('NUM_IMPOSTO').Value    := Self.FNUM_IMPOSTO;
    qryVenda.Post;
    Result := True;
  finally
    qryVenda.Close;
    qryVenda.Free;
  end;
end;

end.
