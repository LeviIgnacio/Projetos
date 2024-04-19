unit URelReabasteciementos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, RLParser;

type
  TFrm_RelReabasteciemento = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    lblNomeTitulo: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    FDQuery1: TFDQuery;
    FDQuery1ID_TANQUE: TIntegerField;
    FDQuery1DSC_TANQUE: TStringField;
    FDQuery1DT_ABASTECIMENTO: TSQLTimeStampField;
    FDQuery1NUM_QUANTIDADE: TFMTBCDField;
    FDQuery1NUM_VALOR: TBCDField;
    FDQuery1NUM_TOTAL: TFMTBCDField;
    FDQuery1NUM_IMPOSTO: TFMTBCDField;
    FDQuery1NUM_TOTAL_IMPOSTO: TFMTBCDField;
    DataSource1: TDataSource;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLBand4: TRLBand;
    RLLabel6: TRLLabel;
    RLLabelTotalQuantidade: TRLLabel;
    RLLabelTotalValor: TRLLabel;
    RLLabelTotalImposto: TRLLabel;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3AfterPrint(Sender: TObject);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    FTotalQuantidade: Double;
    FTotalValor: Double;
    FTotalImposto: Double;
  public
    { Public declarations }
  end;

var
  Frm_RelReabasteciemento: TFrm_RelReabasteciemento;

implementation

{$R *.dfm}

procedure TFrm_RelReabasteciemento.RLBand3AfterPrint(Sender: TObject);
begin
  FTotalQuantidade := FTotalQuantidade + FDQuery1NUM_QUANTIDADE.AsFloat;
  FTotalValor := FTotalValor + FDQuery1NUM_TOTAL.AsFloat;
  FTotalImposto := FTotalImposto + FDQuery1NUM_TOTAL_IMPOSTO.AsFloat;
end;

procedure TFrm_RelReabasteciemento.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelTotalQuantidade.Caption := FormatFloat('0.00', FTotalQuantidade);
  RLLabelTotalValor.Caption := FormatFloat('0.00', FTotalValor);
  RLLabelTotalImposto.Caption := FormatFloat('0.00', FTotalImposto);
end;

procedure TFrm_RelReabasteciemento.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FTotalQuantidade := 0;
  FTotalValor := 0;
  FTotalImposto := 0;
end;

end.
