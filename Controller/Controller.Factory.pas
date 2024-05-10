unit Controller.Factory;

interface

uses
  // Miari
  Controller.Interfaces;

type

  TCooperativaControllerFactory = class(TInterfacedObject, IControllerBaseFactory)
  public
    constructor Create;
    destructor Destroy; override;
    class function New: IControllerBaseFactory;
    function Orcamento: IControllerBase;
    function Custo: IControllerBase;
  end;

implementation

 uses
  Controller.Orcamento;

{ TCooperativaControllerFactory }

constructor TCooperativaControllerFactory.Create;
begin

end;

function TCooperativaControllerFactory.Custo: IControllerBase;
begin
  Result := TControllerCusto.Create;
end;

destructor TCooperativaControllerFactory.Destroy;
begin

  inherited;
end;

class function TCooperativaControllerFactory.New: IControllerBaseFactory;
begin
  Result := Self.Create;
end;

function TCooperativaControllerFactory.Orcamento: IControllerBase;
begin
  Result := TControllerOrcamento.Create;
end;

end.
