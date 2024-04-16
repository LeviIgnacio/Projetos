program Levi_Teste;

uses
  Vcl.Forms,
  UPrincipal in 'UPrincipal.pas' {FrmPrincipal},
  UCadBasico in 'UCadBasico.pas' {FrmCadBasico},
  UDM in 'UDM.pas' {FrmDM: TDataModule},
  UModel.Tanque in 'UModel.Tanque.pas',
  UModel.Bomba in 'UModel.Bomba.pas',
  Pattern.Observer in 'Pattern.Observer.pas',
  Pattern.Subject in 'Pattern.Subject.pas',
  UDashboard in 'UDashboard.pas' {FrmeDashboard: TFrame},
  UTanque in 'UTanque.pas' {FrmTanque},
  Pattern.ObjectModel in 'Pattern.ObjectModel.pas',
  UBomba in 'UBomba.pas' {FrmBomba},
  UReabastecimento in 'UReabastecimento.pas' {FrmReabastecimento},
  UModel.ABASTECIMENTO in 'UModel.ABASTECIMENTO.pas',
  UVenda in 'UVenda.pas' {FrmVenda},
  UModel.Venda in 'UModel.Venda.pas',
  URelReabasteciementos in 'URelReabasteciementos.pas' {Frm_RelReabasteciemento},
  URelVendas in 'URelVendas.pas' {FrmRelVendas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
