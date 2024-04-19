unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Imaging.jpeg, UDashboard;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Image1: TImage;
    FrmeDashboard1: TFrmeDashboard;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation
  uses UDM, UTanque, UBomba, UReabastecimento, UVenda;
{$R *.dfm}

procedure TFrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FrmeDashboard1.QryVendas.Close;
  FrmeDashboard1.QryTanque.Close;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  FrmDM := TFrmDM.Create(Self);
  FrmeDashboard1.QryVendas.Open;
  FrmeDashboard1.QryTanque.Open;
end;

procedure TFrmPrincipal.SpeedButton1Click(Sender: TObject);
begin
  FrmTanque := TFrmTanque.Create(Self);
  // Registra os Observers, adicionando-os na lista do Concrete Subject
  FrmTanque.AdicionarObserver(FrmeDashboard1);
  FrmTanque.ShowModal;
  FrmTanque.RemoverObserver(FrmeDashboard1);
  FrmTanque.Free;
end;

procedure TFrmPrincipal.SpeedButton2Click(Sender: TObject);
begin
  FrmBomba := TFrmBomba.Create(Self);
  // Registra os Observers, adicionando-os na lista do Concrete Subject
  FrmBomba.AdicionarObserver(FrmeDashboard1);
  FrmBomba.ShowModal;
  FrmBomba.RemoverObserver(FrmeDashboard1);
  FrmBomba.Free;
end;

procedure TFrmPrincipal.SpeedButton3Click(Sender: TObject);
begin
  FrmReabastecimento := TFrmReabastecimento.Create(Self);
  // Registra os Observers, adicionando-os na lista do Concrete Subject
  FrmReabastecimento.AdicionarObserver(FrmeDashboard1);
  FrmReabastecimento.ShowModal;
  FrmReabastecimento.RemoverObserver(FrmeDashboard1);
  FrmReabastecimento.Free;
end;

procedure TFrmPrincipal.SpeedButton4Click(Sender: TObject);
begin
  FrmVenda := TFrmVenda.Create(Self);
  // Registra os Observers, adicionando-os na lista do Concrete Subject
  FrmVenda.AdicionarObserver(FrmeDashboard1);
  FrmVenda.ShowModal;
  FrmVenda.RemoverObserver(FrmeDashboard1);
  FrmVenda.Free;
end;

end.
