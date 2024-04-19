unit UReabastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UCadBasico, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.DBCtrls, Vcl.StdCtrls, UModel.ABASTECIMENTO;

type
  TFrmReabastecimento = class(TFrmCadBasico)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Campo_ID_TANQUE_ABASTECIMENTO: TEdit;
    Campo_NUM_QUANTIDADE: TEdit;
    Campo_ID_TENQUE: TEdit;
    Campo_Dsc_TENQUE: TDBLookupComboBox;
    QryTanque: TFDQuery;
    DsTanque: TDataSource;
    Label4: TLabel;
    Campo_NUM_VALOR: TEdit;
    Label5: TLabel;
    Campo_NUM_TOTAL: TEdit;
    Label6: TLabel;
    Campo_NUM_IMPOSTO: TEdit;
    Label7: TLabel;
    Campo_NUM_TOTAL_IMPOSTO: TEdit;
    FDQuery1ID_TANQUE_ABASTECIMENTO: TIntegerField;
    FDQuery1ID_TANQUE: TIntegerField;
    FDQuery1DSC_TANQUE: TStringField;
    FDQuery1DT_ABASTECIMENTO: TSQLTimeStampField;
    FDQuery1NUM_QUANTIDADE: TFMTBCDField;
    FDQuery1NUM_VALOR: TBCDField;
    FDQuery1NUM_IMPOSTO: TFMTBCDField;
    FDQuery1NUM_TOTAL: TFMTBCDField;
    FDQuery1NUM_TOTAL_IMPOSTO: TFMTBCDField;
    Label8: TLabel;
    Campo_DT_ABASTECIMENTO: TDateTimePicker;
    procedure Campo_ID_TENQUEChange(Sender: TObject);
    procedure Campo_Dsc_TENQUEClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Campo_NUM_QUANTIDADEExit(Sender: TObject);
    procedure Campo_NUM_VALORExit(Sender: TObject);
    procedure Campo_NUM_IMPOSTOExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FTanque_Abastecimento: TTanque_Abastecimento;
    function CalcValorTotalReabastecimento: Currency;
    function CalcValorTotalImpostoReabastecimento: Currency;
    function ValidaCampos: Boolean;
  public
    { Public declarations }
  end;

var
  FrmReabastecimento: TFrmReabastecimento;

implementation
  uses URelReabasteciementos, UDM;
{$R *.dfm}

procedure TFrmReabastecimento.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  Campo_ID_TANQUE_ABASTECIMENTO.Text := IntToStr(FTanque_Abastecimento.id_tanque_abastecimento);
  Campo_ID_TENQUE.Text := IntToStr(FTanque_Abastecimento.id_tanque);
  Campo_DT_ABASTECIMENTO.DateTime := FTanque_Abastecimento.dt_abastecimento;
  Campo_num_quantidade.Text := FormatCurr('0.00', FTanque_Abastecimento.num_quantidade);
  Campo_num_valor.Text := FormatCurr('0.00', FTanque_Abastecimento.num_valor);
  Campo_num_imposto.Text := FormatCurr('0.00', FTanque_Abastecimento.num_imposto);
end;

procedure TFrmReabastecimento.BtnImprimirClick(Sender: TObject);
begin
  inherited;
  Frm_RelReabasteciemento := TFrm_RelReabasteciemento.Create(Self);
  Frm_RelReabasteciemento.FDQuery1.Open;
  Frm_RelReabasteciemento.RLReport1.PreviewModal;
  Frm_RelReabasteciemento.FDQuery1.Close;
  Frm_RelReabasteciemento.Free
end;

procedure TFrmReabastecimento.BtnSalvarClick(Sender: TObject);
begin
  if Not ValidaCampos then
  begin
    ShowMessage('Tem campo(s) com valor incorreto ou zerado!');
    Exit;
  end;

  FTanque_Abastecimento.id_tanque_abastecimento := StrToIntDef(Campo_ID_TANQUE_ABASTECIMENTO.Text, 0);
  FTanque_Abastecimento.id_tanque := StrToIntDef(Campo_ID_TENQUE.Text, 0);
  FTanque_Abastecimento.dt_abastecimento := Campo_DT_ABASTECIMENTO.DateTime;
  FTanque_Abastecimento.num_quantidade := StrToCurrDef(Campo_NUM_QUANTIDADE.Text, 0);
  FTanque_Abastecimento.num_valor := StrToCurrDef(Campo_NUM_VALOR.Text, 0);
  FTanque_Abastecimento.num_imposto := StrToCurrDef(Campo_NUM_IMPOSTO.Text, 0);
  inherited;
end;

function TFrmReabastecimento.CalcValorTotalImpostoReabastecimento: Currency;
begin
  Result := CalcValorTotalReabastecimento *
    (StrToCurrDef(Campo_NUM_IMPOSTO.Text, 0) / 100);
end;

function TFrmReabastecimento.CalcValorTotalReabastecimento: Currency;
begin
  Result :=
    StrToCurrDef(Campo_NUM_VALOR.Text, 0) *
    StrToCurrDef(Campo_NUM_QUANTIDADE.Text, 0);
end;

procedure TFrmReabastecimento.Campo_Dsc_TENQUEClick(Sender: TObject);
begin
  inherited;
  Campo_ID_TENQUE.Text := IntToStr(Campo_Dsc_TENQUE.KeyValue);
end;

procedure TFrmReabastecimento.Campo_ID_TENQUEChange(Sender: TObject);
begin
  inherited;
  Campo_Dsc_TENQUE.KeyValue := StrToIntDef(Campo_ID_TENQUE.Text,0);
end;

procedure TFrmReabastecimento.Campo_NUM_IMPOSTOExit(Sender: TObject);
begin
  inherited;
  Campo_NUM_TOTAL_IMPOSTO.Text := FormatCurr('0.00', CalcValorTotalImpostoReabastecimento);
end;

procedure TFrmReabastecimento.Campo_NUM_QUANTIDADEExit(Sender: TObject);
begin
  inherited;
  if StrToCurrDef(Campo_NUM_QUANTIDADE.Text, -1) < 0 then
  begin
    ShowMessage('Valor Incorreto!');
    Exit;
  end;

  Campo_NUM_TOTAL.Text := FormatCurr('0.00', CalcValorTotalReabastecimento);
  Campo_NUM_TOTAL_IMPOSTO.Text := FormatCurr('0.00', CalcValorTotalImpostoReabastecimento);
  Campo_NUM_QUANTIDADE.Text := FormatCurr('0.00', StrToCurrDef(Campo_NUM_QUANTIDADE.Text, 0));
end;

procedure TFrmReabastecimento.Campo_NUM_VALORExit(Sender: TObject);
begin
  inherited;
  if StrToCurrDef(Campo_NUM_VALOR.Text, -1) < 0 then
  begin
    ShowMessage('Valor Incorreto!');
    Exit;
  end;

  Campo_NUM_TOTAL.Text := FormatCurr('0.00', CalcValorTotalReabastecimento);
  Campo_NUM_TOTAL_IMPOSTO.Text := FormatCurr('0.00', CalcValorTotalImpostoReabastecimento);
  Campo_NUM_VALOR.Text := FormatCurr('0.00', StrToCurrDef(Campo_NUM_VALOR.Text, 0));
end;

procedure TFrmReabastecimento.DBGrid1CellClick(Column: TColumn);
begin
  FTanque_Abastecimento.id_tanque_abastecimento := FDQuery1.FieldByName('id_tanque_abastecimento').Value;
  FTanque_Abastecimento.id_tanque := FDQuery1.FieldByName('id_tanque').Value;
  FTanque_Abastecimento.dt_abastecimento := Campo_DT_ABASTECIMENTO.DateTime;
  FTanque_Abastecimento.num_quantidade := FDQuery1.FieldByName('num_quantidade').Value;
  FTanque_Abastecimento.num_valor := FDQuery1.FieldByName('num_valor').Value;
  FTanque_Abastecimento.num_imposto := FDQuery1.FieldByName('num_imposto').Value;
  inherited;
end;

procedure TFrmReabastecimento.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BtnAlterarClick(Self);
end;

procedure TFrmReabastecimento.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  QryTanque.Close;
end;

procedure TFrmReabastecimento.FormCreate(Sender: TObject);
begin
  inherited;
  FTanque_Abastecimento := TTanque_Abastecimento.Create;
  FModel_Object := FTanque_Abastecimento;
end;

procedure TFrmReabastecimento.FormShow(Sender: TObject);
begin
  inherited;
  QryTanque.Open;
  Campo_DT_ABASTECIMENTO.DateTime := Now;
end;

function TFrmReabastecimento.ValidaCampos: Boolean;
begin
  Result := True;

  if StrToCurrDef(Campo_NUM_QUANTIDADE.Text, -1) < 0 then
    Result := False;

  if StrToCurrDef(Campo_NUM_VALOR.Text, -1) < 0 then
    Result := False;

  if StrToCurrDef(Campo_NUM_IMPOSTO.Text, -1) < 0 then
    Result := False;

  if StrToIntDef(Campo_ID_TENQUE.Text, -1) < 0 then
    Result := False;

end;

end.
