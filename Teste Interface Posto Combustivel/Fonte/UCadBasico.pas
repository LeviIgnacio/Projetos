unit UCadBasico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.ComCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Datasnap.DBClient, System.Generics.Collections, Pattern.Subject,
  Pattern.Observer, Vcl.StdCtrls, Pattern.ObjectModel, System.UITypes;

type
  TFrmCadBasico = class(TForm, ISubject)
    PageControl1: TPageControl;
    TSFormulario: TTabSheet;
    TSLista: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    BtnAdicionar: TSpeedButton;
    BtnAlterar: TSpeedButton;
    BtnDeletar: TSpeedButton;
    Panel3: TPanel;
    BtnImprimir: TSpeedButton;
    BtnSalvar: TSpeedButton;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnAdicionarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnDeletarClick(Sender: TObject);
    procedure BtnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }

    // Variável par armazenar a lista de Observers
    FObservers: TList<IObserver>;

    // Método responsável por notificar os Observers registrados
    procedure Notificar;
    procedure LimpaCampo;
  published
      // Modelo de dados
    FModel_Object: IObjectRTTI;
  public
    { Public declarations }
     constructor Create(AOwner: TComponent) ; override;
     destructor Destroy; override;

    // Método para adicionar Observers à lista
    procedure AdicionarObserver(Observer: IObserver);

    // Métodos para remover Observers da lista
    procedure RemoverObserver(Observer: IObserver);
  end;

var
  FrmCadBasico: TFrmCadBasico;

implementation
  uses UDM;

{$R *.dfm}

procedure TFrmCadBasico.LimpaCampo;
var
   i: Integer;
begin
  //Contador que verifica todos os componentes do Form
  for i := 0 to ComponentCount -1 do
  begin
    //Verifica se o objeto é do tipo TEdit
    if (Components[i] is TEdit) then
        (Components[i] as TEdit).Clear;

    //Verifica se o objeto é do tipo TMemo
    if (Components[i] is TMemo) then
       (Components[i] as TMemo).Clear;
  end;
end;

procedure TFrmCadBasico.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if FDQuery1.Active then
    FDQuery1.Close;
end;

procedure TFrmCadBasico.FormShow(Sender: TObject);
begin
  FDQuery1.Open;
  PageControl1.ActivePage := TSLista;
end;

procedure TFrmCadBasico.AdicionarObserver(Observer: IObserver);
begin
  // Adiciona o Observer à lista
  FObservers.Add(Observer);
end;

procedure TFrmCadBasico.Notificar;
var
  Observer: IObserver;
begin
  // Percorre a lista de Observers para enviar a notificação
  for Observer in FObservers do
  begin
    // Chama o método "Atualizar" do Observer
    Observer.Atualizar;
  end;
end;

procedure TFrmCadBasico.RemoverObserver(Observer: IObserver);
begin
  // Remove o Observer da lista
  FObservers.Delete(FObservers.IndexOf(Observer));
end;

procedure TFrmCadBasico.BtnAdicionarClick(Sender: TObject);
begin
  LimpaCampo;
  PageControl1.ActivePage := TSFormulario;
end;

procedure TFrmCadBasico.BtnAlterarClick(Sender: TObject);
begin
  LimpaCampo;
  PageControl1.ActivePage := TSFormulario;
end;

procedure TFrmCadBasico.BtnDeletarClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente deletar esse registro?',
                mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    FModel_Object.Deletar;
    LimpaCampo;
    FDQuery1.Refresh;
    Notificar;
  end;
end;

procedure TFrmCadBasico.BtnSalvarClick(Sender: TObject);
begin
  if MessageDlg('Deseja salvar este registro?',
                mtInformation, [mbYes, mbNo], 0) = mrYes then
  begin
    FModel_Object.Gravar;
    FDQuery1.Refresh;
    Notificar;
  end;
end;

constructor TFrmCadBasico.Create(AOwner: TComponent);
begin
  inherited;
  // Cria a lista de Observers
  FObservers := TList<IObserver>.Create;
end;

procedure TFrmCadBasico.DBGrid1DblClick(Sender: TObject);
begin
  BtnAlterarClick(Self);
end;

destructor TFrmCadBasico.Destroy;
begin
  // Libera a lista de observers da memória
  FObservers.Free;
  inherited;
end;

end.
