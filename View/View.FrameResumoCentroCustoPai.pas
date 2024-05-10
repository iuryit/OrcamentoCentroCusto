unit View.FrameResumoCentroCustoPai;

interface

uses
  Generics.Collections,
  System.Classes,
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Datasnap.DBClient,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.ExtCtrls,
  //
  Controller.CentroCusto,
  Model.DTO.CentroCustoPai,
  Model.Orcamento,
  Observer.Orcamento;

type
  TFrameResumoCentroCustoPai = class(TFrame, IObserver)
    PanelResumoCentroCustoPai: TPanel;
    GridlResumoCentroCustoPai: TDBGrid;
    PanelTituloResumoCentroCustoPai: TPanel;
    DSResumoCentroCustoPai: TDataSource;
    CDSResumoCentroCustoPai: TClientDataSet;
    CDSResumoCentroCustoPaiCodigo: TStringField;
    CDSResumoCentroCustoPaiTotal: TFloatField;
  private
    FCustosPai : TList<TCentroCustoPai>;
    FController : TControllerCentroCustoPai;
    function RetornaPai(ACodigoCC:String): TCentroCustoPai;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Atualizar(Notificacao: TOrcamento);
    function ListaResumoPai : string;
  end;


implementation

{$R *.dfm}

{ TFrameResumoCentroCustoPai }

procedure TFrameResumoCentroCustoPai.Atualizar(Notificacao: TOrcamento);
var
  LCusto : TCusto;
  LCustoPai : TCentroCustoPai;
begin
  FCustosPai := TList<TCentroCustoPai>.Create;
  CDSResumoCentroCustoPai.EmptyDataSet;
  for LCusto in Notificacao.ListaCustos do
  begin
    LCustoPai := RetornaPai(LCusto.CentroCusto.Codigo);
    if not Assigned(LCustoPai) then
    begin
      LCustoPai := TCentroCustoPai.Create;
      FCustosPai.Add(LCustoPai);
    end;
    LCustoPai.GetCodPai(LCusto.CentroCusto.Codigo);
    LCustoPai.Total := LCustoPai.Total + LCusto.ValorCusto;

  end;
  FController.ListarDataSet(TList<TObject>(FCustosPai));
end;

constructor TFrameResumoCentroCustoPai.Create(AOwner: TComponent);
begin
  inherited;
  FController  := TControllerCentroCustoPai.Create;
  FController.DataSet := CDSResumoCentroCustoPai;
end;

destructor TFrameResumoCentroCustoPai.Destroy;
begin
  FController.Destroy;
  inherited;
end;

function TFrameResumoCentroCustoPai.ListaResumoPai: string;
var
  LCustoPai : TCentroCustoPai;
begin
  Result := EmptyStr;
  if FCustosPai.Count > 0 then
    FCustosPai.First;
  for LCustoPai in FCustosPai do
  begin
    Result := Result + LCustoPai.Codigo+':'+FormatFloat('###,##0.00',LCustoPai.Total)+'||';
  end;
  if Result.TrimRight.EndsWith('||') then
    Result := Copy(Result, 1, Result.LastIndexOf('||'));
end;

function TFrameResumoCentroCustoPai.RetornaPai(ACodigoCC: String): TCentroCustoPai;
 var
  LCustoPai : TCentroCustoPai;
begin
  Result := nil;
  if FCustosPai.Count > 0 then
    FCustosPai.First;
  for LCustoPai in FCustosPai do
  begin
    if LCustoPai.Codigo = Copy(ACodigoCC,1,2) then
      Result := LCustoPai;
  end;
end;

end.
