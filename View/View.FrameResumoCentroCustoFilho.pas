unit View.FrameResumoCentroCustoFilho;

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
  Vcl.Dialogs, Data.DB,
  Datasnap.DBClient,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  //
  Controller.CentroCusto,
  Model.DTO.CentroCustoFilho,
  Model.Orcamento,
  Observer.Orcamento;

type
  TFrameTituloResumoCentroCustoFilho = class(TFrame,IObserver)
    CDSResumoCentroCustoFilho: TClientDataSet;
    CDSResumoCentroCustoFilhoCodigo: TStringField;
    CDSResumoCentroCustoFilhoCodigoPai: TStringField;
    CDSResumoCentroCustoFilhoTotal: TFloatField;
    DSResumoCentroCustoFilho: TDataSource;
    PanelResumoCentroCustoFilho: TPanel;
    GridlResumoCentroCustoFilho: TDBGrid;
    PanelTituloResumoCentroCustoFilho: TPanel;
  private
    FCustosFilho : TList<TCentroCustoFilho>;
    FController : TControllerCentroCustoFilho;
    function RetornaFilho(ACodigoCC:String): TCentroCustoFilho;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Atualizar(Notificacao: TOrcamento);
    function ListaResumoFilho : string;
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TFrameTituloResumoCentroCustoFilho.Atualizar(Notificacao: TOrcamento);
var
  LCusto : TCusto;
  LCustoFilho : TCentroCustoFilho;
begin
   FCustosFilho := TList<TCentroCustoFilho>.Create;
  CDSResumoCentroCustoFilho.EmptyDataSet;
  for LCusto in Notificacao.ListaCustos do
  begin
    LCustoFilho := RetornaFilho(LCusto.CentroCusto.Codigo);
    if not Assigned(LCustoFilho) then
    begin
      LCustoFilho := TCentroCustoFilho.Create;
      FCustosFilho.Add(LCustoFilho);
    end;
    LCustoFilho.GetCodFilho(LCusto.CentroCusto.Codigo);
    LCustoFilho.Total := LCustoFilho.Total + LCusto.ValorCusto;

  end;
  FController.ListarDataSet(TList<TObject>(FCustosFilho));
end;

constructor TFrameTituloResumoCentroCustoFilho.Create(AOwner: TComponent);
begin
  inherited;
   FController  := TControllerCentroCustoFilho.Create;
   FController.DataSet := CDSResumoCentroCustoFilho;
end;

destructor TFrameTituloResumoCentroCustoFilho.Destroy;
begin
  FController.Destroy;
  inherited;
end;

function TFrameTituloResumoCentroCustoFilho.ListaResumoFilho: string;
var
  LCustoFilho : TCentroCustoFilho;
begin
  Result := EmptyStr;
  if FCustosFilho.Count > 0 then  FCustosFilho.First;
  for LCustoFilho in FCustosFilho do
  begin
    Result :=Result + LCustoFilho.CodigoPai+LCustoFilho.Codigo+':'+FormatFloat('###,##0.00',LCustoFilho.Total)+'||';
  end;
  if Result.TrimRight.EndsWith('||') then
    Result := Copy(Result, 1, Result.LastIndexOf('||'));
end;

function TFrameTituloResumoCentroCustoFilho.RetornaFilho(ACodigoCC: String): TCentroCustoFilho;
 var
  LCustoFilho : TCentroCustoFilho;
begin
  Result := nil;
  if FCustosFilho.Count > 0 then  FCustosFilho.First;
  for LCustoFilho in FCustosFilho do
  begin
    if LCustoFilho.CodigoPai + LCustoFilho.Codigo = ACodigoCC then
      Result := LCustoFilho;
  end;
end;

end.
