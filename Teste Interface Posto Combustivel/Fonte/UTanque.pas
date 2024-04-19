unit UTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UCadBasico, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls,
  Datasnap.DBClient, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, UModel.Tanque;

type
  TFrmTanque = class(TFrmCadBasico)
    Label1: TLabel;
    Campo_id_tenque: TEdit;
    Label2: TLabel;
    Campo_dsc_nome: TEdit;
    FDQuery1ID_TENQUE: TIntegerField;
    FDQuery1DSC_NOME: TStringField;
    procedure BtnSalvarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnAlterarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FTanque : TTanque;
  public
    { Public declarations }
  end;

var
  FrmTanque: TFrmTanque;

implementation

{$R *.dfm}

procedure TFrmTanque.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  Campo_id_tenque.Text := IntToStr(FTanque.id_tenque);
  Campo_dsc_nome.Text  := FTanque.dsc_nome;
end;

procedure TFrmTanque.BtnDeletarClick(Sender: TObject);
begin
  Campo_id_tenque.Text := IntToStr(FTanque.id_tenque);
  Campo_dsc_nome.Text  := FTanque.dsc_nome;

  if FTanque.id_tenque = 0 then
    Exit;

  inherited;
end;

procedure TFrmTanque.BtnSalvarClick(Sender: TObject);
begin
  FTanque.id_tenque := StrToIntDef(Campo_id_tenque.Text, 0);
  FTanque.dsc_nome  := Campo_dsc_nome.Text;
  inherited;
end;

procedure TFrmTanque.DBGrid1CellClick(Column: TColumn);
begin
  if FDQuery1.RecordCount <> 0 then
  begin
    FTanque.id_tenque := FDQuery1.FieldByName('id_tenque').Value;
    FTanque.dsc_nome  := FDQuery1.FieldByName('dsc_nome').Value;
  end;
  inherited;
end;

procedure TFrmTanque.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BtnAlterarClick(Self);
end;

procedure TFrmTanque.FormCreate(Sender: TObject);
begin
  inherited;
  FTanque := TTanque.Create;
  FModel_Object := FTanque;
end;

end.
