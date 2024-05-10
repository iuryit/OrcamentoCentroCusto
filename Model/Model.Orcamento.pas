unit Model.Orcamento;

interface

uses
  SysUtils,
  Generics.Collections,
  FireDAC.Comp.Client,
  // Projeto
  Model.CentroCusto;

type
  TCusto = class;

  TOrcamento = class
  private
    FId: Integer;
    FDataBaixa: TDateTime;
    FListaCustos : TList<TCusto>;
  private
    function GetListaCustos: TList<TCusto>;
    function GetTotal: Double;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Integer read FId write FId;
    property Total: Double read GetTotal;
    property ListaCustos: TList<TCusto> read GetListaCustos;
  end;

  TCusto = class
  private
    FValorCusto: Double;
    FId: Integer;
    FCentroCusto: TCentroCusto;
  public
    constructor Create;
    destructor Destroy; override;
    property Id: Integer read FId write FId;
    property ValorCusto: Double read FValorCusto write FValorCusto;
    property CentroCusto: TCentroCusto read FCentroCusto write FCentroCusto;
  end;


  TDAOOrcamento = class
  private
    FConection: TFDConnection;
    FQuery : TFDQuery;
  public
    procedure Salvar(const Orcamento: TOrcamento);
    property Conection: TFDConnection read FConection write FConection;
    property Query: TFDQuery read FQuery write FQuery;
  end;
implementation

{ TOrcamento }

constructor TOrcamento.Create;
begin
  FListaCustos := TList<TCusto>.Create;
end;

destructor TOrcamento.Destroy;
begin
  FListaCustos.Destroy;
  inherited;
end;

function TOrcamento.GetListaCustos: TList<TCusto>;
begin
  Result := FListaCustos;
end;

function TOrcamento.GetTotal: Double;
 var
  LCusto : TCusto;
begin
  Result := 0;
  for LCusto in Self.ListaCustos do
  begin
    Result := Result + LCusto.ValorCusto;
  end;
end;

{ TCusto }

constructor TCusto.Create;
begin
  FCentroCusto := TCentroCusto.Create;
end;

destructor TCusto.Destroy;
begin
  FCentroCusto.destroy;
  inherited;
end;

procedure TDAOOrcamento.Salvar(const Orcamento: TOrcamento);
 var
  LCusto: TCusto;
begin
  Query.SQL.Clear;
  Query.SQL.Add('INSERT INTO ORCAMENTO(TOTAL) VALUES(:TOTAL)');
  Query.Params.ParamByName('TOTAL').AsFloat:= Orcamento.Total;
  Query.ExecSQL;
  //
  for LCusto in Orcamento.ListaCustos do
  begin
    Query.SQL.Clear;
    Query.SQL.Add('INSERT INTO ORCAMENTO_CENTRO_CUSTO(CODIGO_CC,VALOR_CUSTO) VALUES(:CODIGO, :VALOR_CUSTO)');
    Query.Params.ParamByName('CODIGO').AsString:= LCusto.CentroCusto.Codigo;
    Query.Params.ParamByName('VALOR_CUSTO').AsFloat:= LCusto.ValorCusto;
    Query.ExecSQL;
  end;
end;

end.
