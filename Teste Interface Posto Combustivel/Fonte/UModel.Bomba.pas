unit UModel.Bomba;

interface
  uses Pattern.ObjectModel, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TBomba = Class(TInterfacedObject, IObjectRTTI)
    function Gravar: Boolean;
    function Deletar: Boolean;
  private
    Fid_bomba: Integer;
    Fid_tanque: Integer;
    Fdsc_nome: string;
  public
    property id_bomba :Integer read Fid_bomba write Fid_bomba;
    property id_tanque :Integer read Fid_tanque write Fid_tanque;
    property dsc_nome :string read Fdsc_nome write Fdsc_nome;
  end;

implementation
  uses UDM;

{ TBomba }

function TBomba.Deletar: Boolean;
var
  qryBomba: TFDQuery;
begin
  qryBomba := TFDQuery.Create(nil);

  try
    qryBomba.Connection := FrmDM.FDConnection1;
    qryBomba.SQL.Add(
      'SELECT id_bomba, id_tanque, dsc_nome ' +
      'FROM bomba WHERE id_bomba = :id_bomba ');
    qryBomba.ParamByName('id_bomba').Value := Fid_bomba;
    qryBomba.Open;

    if qryBomba.RecordCount <> 0 then
      qryBomba.Delete;

    Result := True;
  finally
    qryBomba.Close;
    qryBomba.Free;
  end;
end;

function TBomba.Gravar: Boolean;
var
  qryBomba: TFDQuery;
begin
  qryBomba := TFDQuery.Create(nil);

  try
    qryBomba.Connection := FrmDM.FDConnection1;
    qryBomba.SQL.Add(
      'SELECT id_bomba, id_tanque, dsc_nome ' +
      'FROM bomba WHERE id_bomba = :id_bomba ');
    qryBomba.ParamByName('id_bomba').Value := Fid_bomba;
    qryBomba.Open;

    if qryBomba.RecordCount = 0 then
      qryBomba.Insert
    else
      qryBomba.Edit;

    qryBomba.FieldByName('id_bomba').Value := Self.Fid_bomba;
    qryBomba.FieldByName('id_tanque').Value := Self.Fid_tanque;
    qryBomba.FieldByName('dsc_nome').Value  := Self.Fdsc_nome;

    qryBomba.Post;
    Result := True;
  finally
    qryBomba.Close;
    qryBomba.Free;
  end;
end;


end.
