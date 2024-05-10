unit View.OrcamentoCentroCusto;

interface

uses
  Generics.Collections,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.Buttons,
  Vcl.Mask,
  JvExMask,
  JvToolEdit,
  JvBaseEdits,
  LabeledCtrls,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Datasnap.DBClient,
  //
  Controller.Interfaces,
  Controller.Orcamento,
  Model.Orcamento, View.FrameResumoCentroCustoPai,
  View.FrameResumoCentroCustoFilho;

type
  TFOrcamentoCentroCusto = class(TForm)
    PanelFundo: TPanel;
    PanelGridCustos: TPanel;
    PanelResumoOrcamentos: TPanel;
    GridlResumoOrcamento: TDBGrid;
    PanelTitutoResumoOrcamentos: TPanel;
    PanelCamposCustoAdicionar: TPanel;
    EditCodigoCentroCusto: TLabeledEdit;
    EditValorCusto: TLabeledCalcEdit;
    ButtonAdicinarCusto: TSpeedButton;
    PanelRodape: TPanel;
    ButtonConfirmarOrcamento: TSpeedButton;
    CDSListaCustos: TClientDataSet;
    DSListasCustos: TDataSource;
    DSOrcamento: TDataSource;
    CDSListaCustosCodigo: TStringField;
    CDSListaCustosValorCusto: TFloatField;
    GridListaCustos: TDBGrid;
    CDSOrcamento: TClientDataSet;
    CDSOrcamentoId: TIntegerField;
    CDSOrcamentoTotal: TFloatField;
    FrameResumoCentroCustoPai: TFrameResumoCentroCustoPai;
    FrameResumoCentroCustoFilho: TFrameTituloResumoCentroCustoFilho;
    procedure ButtonAdicinarCustoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonConfirmarOrcamentoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FControllerOrcamento: TControllerOrcamento;
    FControllerCusto: TControllerCusto;
    FOrcamento : TOrcamento;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOrcamentoCentroCusto: TFOrcamentoCentroCusto;

implementation

{$R *.dfm}


procedure TFOrcamentoCentroCusto.ButtonAdicinarCustoClick(Sender: TObject);
 var
  LCusto: TCusto;
begin
  if EditCodigoCentroCusto.Text = EmptyStr then
    raise Exception.Create('Codigo do Centro de Custo não informado');

  if Length(EditCodigoCentroCusto.Text) <> 6 then
    raise Exception.Create('Formato do Codigo invalido, o codigo deve seguir o modelo PPFFF');

  if EditValorCusto.Value = 0 then
    raise Exception.Create('Valor do custo não informado');

  if EditValorCusto.Value < 0 then
    raise Exception.Create('Valor do custo informado incorretamente');


  LCusto := TCusto.Create;
  LCusto.CentroCusto.Codigo := EditCodigoCentroCusto.Text;
  LCusto.ValorCusto := EditValorCusto.Value;
  FOrcamento.ListaCustos.Add(LCusto);
  FControllerCusto.ListarDataSet(TList<TObject>(FOrcamento.ListaCustos));
  FControllerOrcamento.ListarDataSet(TObject(FOrcamento));
end;

procedure TFOrcamentoCentroCusto.ButtonConfirmarOrcamentoClick(Sender: TObject);
begin
  FControllerOrcamento.Incluir(TObject(FOrcamento));

  ShowMessage('Orcamento Concluido!'+#13+
   'Resumo Centro Custo Pai:'+FrameResumoCentroCustoPai.ListaResumoPai+#13+
   'Resumo Centro Custo Filho:'+FrameResumoCentroCustoFilho.ListaResumoFilho+#13+
   'Total Orcamento :' + FormatFloat('###,##0.00', FOrcamento.Total)
  );
  FOrcamento.Destroy;
  FOrcamento := TOrcamento.Create;
  FControllerOrcamento.ListarDataSet(TObject(FOrcamento));
  FControllerCusto.ListarDataSet(TList<TObject>(FOrcamento.ListaCustos));
  EditCodigoCentroCusto.Text := EmptyStr;
  EditValorCusto.Value := 0;
end;

procedure TFOrcamentoCentroCusto.FormCreate(Sender: TObject);
begin
  FControllerOrcamento := TControllerOrcamento.Create;
  FControllerOrcamento.DataSet := CDSOrcamento;

  FControllerCusto := TControllerCusto.Create;
  FControllerCusto.DataSet := CDSListaCustos;

  FOrcamento := TOrcamento.Create;
  FControllerOrcamento.ListarDataSet(TObject(FOrcamento));

  //
  FControllerOrcamento.AdicionarObserver(FrameResumoCentroCustoPai);
  FControllerOrcamento.AdicionarObserver(FrameResumoCentroCustoFilho);
end;

procedure TFOrcamentoCentroCusto.FormDestroy(Sender: TObject);
begin      
  FControllerOrcamento.Destroy;
  FControllerCusto.Create;
  if Assigned(FOrcamento) then
    FOrcamento.destroy;    
end;

end.
