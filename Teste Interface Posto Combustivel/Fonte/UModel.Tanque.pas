unit UModel.Tanque;

interface
  uses Pattern.ObjectModel, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
 TTanque = Class(TInterfacedObject, IObjectRTTI)
    function Gravar: Boolean;
    function Deletar: Boolean;
  private
    Fid_tenque: Integer;
    Fdsc_nome: String;
 public
    property id_tenque :Integer read Fid_tenque write Fid_tenque;
    property dsc_nome :String read Fdsc_nome write Fdsc_nome;
 End;

implementation
  uses UDM;
{ TTanque }

function TTanque.Gravar: Boolean;
var
  qryTanque: TFDQuery;
begin
  qryTanque := TFDQuery.Create(nil);

  try
    qryTanque.Connection := FrmDM.FDConnection1;
    qryTanque.SQL.Add('SELECT id_tenque, dsc_nome '+
                      'FROM tanque WHERE id_tenque = :id_tenque ');
    qryTanque.ParamByName('id_tenque').Value := Fid_tenque;
    qryTanque.Open;

    if qryTanque.RecordCount = 0 then
      qryTanque.Insert
    else
      qryTanque.Edit;

    qryTanque.FieldByName('id_tenque').Value := Self.Fid_tenque;
    qryTanque.FieldByName('dsc_nome').Value  := Self.Fdsc_nome;

    qryTanque.Post;
    Result := True;
  finally
    qryTanque.Close;
    qryTanque.Free;
  end;
end;

function TTanque.Deletar: Boolean;
var
  qryTanque: TFDQuery;
begin
  qryTanque := TFDQuery.Create(nil);

  try
    qryTanque.Connection := FrmDM.FDConnection1;
    qryTanque.SQL.Add(
      'SELECT id_tenque, dsc_nome FROM tanque WHERE id_tenque = :id_tenque '
      );
    qryTanque.ParamByName('id_tenque').Value := Fid_tenque;
    qryTanque.Open;

    if qryTanque.RecordCount <> 0 then
      qryTanque.Delete;

    Result := True;
  finally
    qryTanque.Close;
    qryTanque.Free;
  end;
end;

end.
