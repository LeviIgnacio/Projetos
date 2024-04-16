unit UDashboard;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Pattern.Observer, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmeDashboard = class(TFrame, IObserver)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    QryVendas: TFDQuery;
    QryVendasDSC_TANQUE: TStringField;
    QryVendasDSC_BOMBA: TStringField;
    QryVendasTOTAL_VALOR: TFMTBCDField;
    dsVendas: TDataSource;
    QryTanque: TFDQuery;
    QryTanqueDSC_TANQUE: TStringField;
    DSTanque: TDataSource;
    QryTanqueNUM_QUANTIDADE: TFMTBCDField;
    QryTanqueNUM_TOTAL: TFMTBCDField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Atualizar;
  end;

implementation

{$R *.dfm}

{ TFrmeDashboard }

procedure TFrmeDashboard.Atualizar;
begin
  QryVendas.Refresh;
  QryTanque.Refresh;
end;

end.
