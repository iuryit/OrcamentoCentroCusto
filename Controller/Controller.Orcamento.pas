unit Controller.Orcamento;

interface

uses
  SysUtils,
  System.Classes,
  Generics.Collections,
  Datasnap.DBClient,
  //
  Conection,
  Controller.Base,
  Model.Orcamento,
  Subject.Orcamento,
  Observer.Orcamento;

type
  TControllerOrcamento =  class(TControllerBase,ISubject)
  private
    FObservers: TList<IObserver>;
    FOrcamento: TOrcamento;
  public
    constructor Create;
    destructor Destroy; override;
    function Incluir(AEntidade: TObject) : Integer; override;
    procedure ListarDataSet(AEntidade: TObject); override;
    //
    procedure AdicionarObserver(Observer: IObserver);
    procedure RemoverObserver(Observer: IObserver);
    procedure Notificar;
  end;

  TControllerCusto =  class(TControllerBase)
  public
    procedure ListarDataSet(AEntidades: TList<TObject>); override;
  end;

implementation

{ TControllerOrcamento }

procedure TControllerOrcamento.AdicionarObserver(Observer: IObserver);
begin
  FObservers.Add(Observer);
end;

constructor TControllerOrcamento.Create;
begin
  inherited;

  FObservers := TList<IObserver>.Create;
end;

destructor TControllerOrcamento.Destroy;
begin
  FObservers.Free;
  inherited;
end;

function TControllerOrcamento.Incluir(AEntidade: TObject): Integer;
  var
   LDAO: TDAOOrcamento;
   LDataModule : TDataModuleConection;
begin
  try
    LDAO := TDAOOrcamento.Create;
    LDataModule := TDataModuleConection.Create(nil);
    LDAO.Conection := LDataModule.FDConnectionFB;
    LDAO.query := LDataModule.FDQueryFB;
    LDAO.Salvar(TOrcamento(AEntidade));
  except
    on E:Exception do
    begin
      raise Exception.Create('Erro ao Inserir Orcamento no banco de dados:'+e.message);
    end;
  end;
end;

procedure TControllerOrcamento.ListarDataSet(AEntidade: TObject);
 var
  LOrcamento :TOrcamento;
begin
  FOrcamento := TOrcamento(AEntidade);

  DataSet.EmptyDataSet;

  DataSet.Append;

  DataSet.FieldByName('ID').AsInteger := FOrcamento.Id;
  DataSet.FieldByName('TOTAL').AsFloat := FOrcamento.Total;

  DataSet.Post;
  //

  Notificar;
end;

procedure TControllerOrcamento.Notificar;
 var
  LObserver: IObserver;
begin
  for LObserver in FObservers do
  begin
    // Chama o método "Atualizar" do Observer
    LObserver.Atualizar(FOrcamento);
  end;
end;

procedure TControllerOrcamento.RemoverObserver(Observer: IObserver);
begin
  FObservers.Delete(FObservers.IndexOf(Observer));
end;

{ TControllerCusto }

procedure TControllerCusto.ListarDataSet(AEntidades: TList<TObject>);
 var
  LCusto :TCusto;
begin
  DataSet.EmptyDataSet;
  for LCusto in TList<TCusto>(AEntidades) do
  begin
    DataSet.Append;

    DataSet.FieldByName('CODIGO').AsString := LCusto.CentroCusto.Codigo;
    DataSet.FieldByName('VALORCUSTO').AsFloat := LCusto.ValorCusto;

    DataSet.Post;
  end;
end;

end.
