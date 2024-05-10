unit Observer.Orcamento;

interface

uses
  Model.Orcamento;

type

  IObserver = interface

    procedure Atualizar(Notificacao: TOrcamento);
  end;

implementation

end.
