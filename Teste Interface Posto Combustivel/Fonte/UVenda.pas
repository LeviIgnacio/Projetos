unit UVenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  UCadBasico, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.ComCtrls, UModel.Venda, Vcl.DBCtrls, Vcl.StdCtrls;

type
  TFrmVenda = class(TFrmCadBasico)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Campo_ID_VENDA: TEdit;
    Campo_NUM_QUANTIDADE: TEdit;
    Campo_ID_BOMBA: TEdit;
    Campo_Dsc_BOMBA: TDBLookupComboBox;
    Campo_NUM_VALOR: TEdit;
    Campo_NUM_TOTAL: TEdit;
    Campo_NUM_IMPOSTO: TEdit;
    Campo_NUM_TOTAL_IMPOSTO: TEdit;
    QryBomba: TFDQuery;
    DsBomba: TDataSource;
    FDQuery1ID_VENDA: TIntegerField;
    FDQuery1ID_BOMBA: TIntegerField;
    FDQuery1DSC_NOME: TStringField;
    FDQuery1DSC_CLIENTE: TStringField;
    FDQuery1DT_VENDA: TSQLTimeStampField;
    FDQuery1NUM_QUANTIDADE: TFMTBCDField;
    FDQuery1NUM_VALOR: TBCDField;
    FDQuery1NUM_IMPOSTO: TFMTBCDField;
    FDQuery1NUM_TOTAL: TFMTBCDField;
    FDQuery1NUM_TOTAL_IMPOSTO: TFMTBCDField;
    Campo_DT_VENDA: TDateTimePicker;
    Label8: TLabel;
    Label9: TLabel;
    Campo_DSC_CLIENTE: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure Campo_Dsc_BOMBAClick(Sender: TObject);
    procedure Campo_ID_BOMBAChange(Sender: TObject);
    procedure Campo_NUM_IMPOSTOExit(Sender: TObject);
    procedure Campo_NUM_QUANTIDADEExit(Sender: TObject);
    procedure Campo_NUM_VALORExit(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
    FVenda: TVenda;
    function CalcValorTotalVenda: Currency;
    function CalcValorTotalImpostoVenda: Currency;
    function ValidaCampos: Boolean;
  public
    { Public declarations }
  end;

var
  FrmVenda: TFrmVenda;

implementation
  uses URelVendas, UDM;
{$R *.dfm}

procedure TFrmVenda.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  Campo_ID_VENDA.Text := IntToStr(FVenda.ID_VENDA);
  Campo_ID_BOMBA.Text := IntToStr(FVenda.ID_BOMBA);
  Campo_DT_VENDA.DateTime := FVenda.DT_VENDA;
  Campo_DSC_CLIENTE.Text := FVenda.DSC_CLIENTE;
  Campo_num_quantidade.Text := FormatCurr('0.00', FVenda.num_quantidade);
  Campo_num_valor.Text := FormatCurr('0.00', FVenda.num_valor);
  Campo_num_imposto.Text := FormatCurr('0.00', FVenda.num_imposto);
end;

procedure TFrmVenda.BtnImprimirClick(Sender: TObject);
begin
  inherited;
  FrmRelVendas := TFrmRelVendas.Create(Self);
  FrmRelVendas.FDQuery1.Open;
  FrmRelVendas.RLReport1.PreviewModal;
  FrmRelVendas.Close;
  FrmRelVendas.Free;
end;

procedure TFrmVenda.BtnSalvarClick(Sender: TObject);
begin
  if Not ValidaCampos then
  begin
    ShowMessage('Tem campo(s) com valor incorreto ou zerado!');
    Exit;
  end;

  FVenda.ID_VENDA := StrToIntDef(Campo_ID_VENDA.Text, 0);
  FVenda.ID_BOMBA := StrToIntDef(Campo_ID_BOMBA.Text, 0);
  FVenda.DT_VENDA := Campo_DT_VENDA.DateTime;
  FVenda.DSC_CLIENTE := Campo_DSC_CLIENTE.Text;
  FVenda.num_quantidade := StrToCurrDef(Campo_NUM_QUANTIDADE.Text, 0);
  FVenda.num_valor := StrToCurrDef(Campo_NUM_VALOR.Text, 0);
  FVenda.num_imposto := StrToCurrDef(Campo_NUM_IMPOSTO.Text, 0);
  inherited;
end;

function TFrmVenda.CalcValorTotalImpostoVenda: Currency;
begin
  Result := CalcValorTotalVenda *
    (StrToCurrDef(Campo_NUM_IMPOSTO.Text, 0) / 100);
end;

function TFrmVenda.CalcValorTotalVenda: Currency;
begin
  Result :=
    StrToCurrDef(Campo_NUM_VALOR.Text, 0) *
    StrToCurrDef(Campo_NUM_QUANTIDADE.Text, 0);
end;

procedure TFrmVenda.Campo_Dsc_BOMBAClick(Sender: TObject);
begin
  inherited;
  Campo_ID_BOMBA.Text := IntToStr(Campo_Dsc_BOMBA.KeyValue);
end;

procedure TFrmVenda.Campo_ID_BOMBAChange(Sender: TObject);
begin
  inherited;
  Campo_Dsc_BOMBA.KeyValue := StrToIntDef(Campo_ID_BOMBA.Text,0);
end;

procedure TFrmVenda.Campo_NUM_IMPOSTOExit(Sender: TObject);
begin
  inherited;
  Campo_NUM_TOTAL_IMPOSTO.Text := FormatCurr('0.00', CalcValorTotalImpostoVenda);
end;

procedure TFrmVenda.Campo_NUM_QUANTIDADEExit(Sender: TObject);
begin
  inherited;
  if StrToCurrDef(Campo_NUM_QUANTIDADE.Text, -1) < 0 then
  begin
    ShowMessage('Valor Incorreto!');
    Exit;
  end;

  Campo_NUM_TOTAL.Text := FormatCurr('0.00', CalcValorTotalVenda);
  Campo_NUM_TOTAL_IMPOSTO.Text := FormatCurr('0.00', CalcValorTotalImpostoVenda);
  Campo_NUM_QUANTIDADE.Text := FormatCurr('0.00', StrToCurrDef(Campo_NUM_QUANTIDADE.Text, 0));
end;

procedure TFrmVenda.Campo_NUM_VALORExit(Sender: TObject);
begin
  inherited;
  if StrToCurrDef(Campo_NUM_VALOR.Text, -1) < 0 then
  begin
    ShowMessage('Valor Incorreto!');
    Exit;
  end;

  Campo_NUM_TOTAL.Text := FormatCurr('0.00', CalcValorTotalVenda);
  Campo_NUM_TOTAL_IMPOSTO.Text := FormatCurr('0.00', CalcValorTotalImpostoVenda);
  Campo_NUM_VALOR.Text := FormatCurr('0.00', StrToCurrDef(Campo_NUM_VALOR.Text, 0));
end;

procedure TFrmVenda.DBGrid1CellClick(Column: TColumn);
begin
  inherited;
  FVenda.ID_VENDA := FDQuery1.FieldByName('ID_VENDA').Value;
  FVenda.ID_BOMBA := FDQuery1.FieldByName('ID_BOMBA').Value;
  FVenda.DT_VENDA := Campo_DT_VENDA.DateTime;
  FVenda.DSC_CLIENTE := Campo_DSC_CLIENTE.Text;
  FVenda.num_quantidade := FDQuery1.FieldByName('num_quantidade').Value;
  FVenda.num_valor := FDQuery1.FieldByName('num_valor').Value;
  FVenda.num_imposto := FDQuery1.FieldByName('num_imposto').Value;
end;

procedure TFrmVenda.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  BtnAlterarClick(Self);
end;

procedure TFrmVenda.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  QryBomba.Close;
end;

procedure TFrmVenda.FormCreate(Sender: TObject);
begin
  inherited;
  FVenda := TVenda.Create;
  FModel_Object := FVenda;
end;

procedure TFrmVenda.FormShow(Sender: TObject);
begin
  inherited;
  QryBomba.Open;
  Campo_DT_VENDA.DateTime := Now;
end;

function TFrmVenda.ValidaCampos: Boolean;
begin
  Result := True;

  if StrToCurrDef(Campo_NUM_QUANTIDADE.Text, -1) < 0 then
    Result := False;

  if StrToCurrDef(Campo_NUM_VALOR.Text, -1) < 0 then
    Result := False;

  if StrToCurrDef(Campo_NUM_IMPOSTO.Text, -1) < 0 then
    Result := False;

  if StrToIntDef(Campo_ID_BOMBA.Text, -1) < 0 then
    Result := False;

end;

end.
