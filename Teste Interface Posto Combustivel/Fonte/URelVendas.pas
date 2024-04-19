unit URelVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelVendas = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    lblNomeTitulo: TRLLabel;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    FDQuery1DT_VENDA: TSQLTimeStampField;
    FDQuery1DSC_TANQUE: TStringField;
    FDQuery1DSC_BOMBA: TStringField;
    FDQuery1TOTAL_VALOR: TFMTBCDField;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLBand4: TRLBand;
    RLLabel6: TRLLabel;
    RLLabelTotal: TRLLabel;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand3AfterPrint(Sender: TObject);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
    FTotalValor: Double;
  public
    { Public declarations }
  end;

var
  FrmRelVendas: TFrmRelVendas;

implementation

{$R *.dfm}

procedure TFrmRelVendas.RLBand3AfterPrint(Sender: TObject);
begin
  FTotalValor := FTotalValor + FDQuery1TOTAL_VALOR.AsFloat;
end;

procedure TFrmRelVendas.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLLabelTotal.Caption := FormatFloat('0.00', FTotalValor);
end;

procedure TFrmRelVendas.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  FTotalValor := 0;
end;

end.
