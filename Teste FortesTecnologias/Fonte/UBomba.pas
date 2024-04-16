unit UBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UCadBasico, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.DBCtrls, UModel.Bomba;

type
  TFrmBomba = class(TFrmCadBasico)
    Label1: TLabel;
    Label2: TLabel;
    Campo_id_bomba: TEdit;
    Campo_dsc_nome: TEdit;
    Campo_ID_TENQUE: TEdit;
    Label3: TLabel;
    Campo_Dsc_TENQUE: TDBLookupComboBox;
    QryTanque: TFDQuery;
    DsTanque: TDataSource;
    FDQuery1ID_BOMBA: TIntegerField;
    FDQuery1ID_TANQUE: TIntegerField;
    FDQuery1DSC_NOME: TStringField;
    FDQuery1DSC_TANQUE: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Campo_Dsc_TENQUEClick(Sender: TObject);
    procedure Campo_ID_TENQUEChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FBomba: TBomba;
  public
    { Public declarations }
  end;

var
  FrmBomba: TFrmBomba;

implementation

{$R *.dfm}

procedure TFrmBomba.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  Campo_id_bomba.Text     := IntToStr(FBomba.id_bomba);
  Campo_ID_TENQUE.Text    := IntToStr(FBomba.id_tanque);
  Campo_dsc_nome.Text     := FBomba.dsc_nome;
end;

procedure TFrmBomba.BtnDeletarClick(Sender: TObject);
begin
  Campo_id_bomba.Text     := IntToStr(FBomba.id_bomba);
  Campo_ID_TENQUE.Text    := IntToStr(FBomba.id_tanque);
  Campo_dsc_nome.Text     := FBomba.dsc_nome;

  if FBomba.id_bomba = 0 then
    Exit;

  inherited;
end;

procedure TFrmBomba.BtnSalvarClick(Sender: TObject);
begin
  FBomba.id_bomba  := StrToIntDef(Campo_id_bomba.Text, 0);
  FBomba.id_tanque := StrToIntDef(Campo_ID_TENQUE.Text, 0);
  FBomba.dsc_nome  := Campo_dsc_nome.Text;
  inherited;
end;

procedure TFrmBomba.Campo_Dsc_TENQUEClick(Sender: TObject);
begin
  inherited;
  Campo_ID_TENQUE.Text := IntToStr(Campo_Dsc_TENQUE.KeyValue);
end;

procedure TFrmBomba.Campo_ID_TENQUEChange(Sender: TObject);
begin
  inherited;
  Campo_Dsc_TENQUE.KeyValue := StrToIntDef(Campo_ID_TENQUE.Text,0);
end;

procedure TFrmBomba.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  FBomba.id_bomba  := FDQuery1.FieldByName('id_bomba').Value;
  FBomba.id_tanque := FDQuery1.FieldByName('id_tanque').Value;
  FBomba.dsc_nome  := FDQuery1.FieldByName('dsc_nome').Value;
end;

procedure TFrmBomba.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BtnAlterarClick(Self);
end;

procedure TFrmBomba.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  QryTanque.Close;
end;

procedure TFrmBomba.FormCreate(Sender: TObject);
begin
  inherited;
  FBomba := TBomba.Create;
  FModel_Object := FBomba;
end;

procedure TFrmBomba.FormShow(Sender: TObject);
begin
  inherited;
  QryTanque.Open;
end;

end.
