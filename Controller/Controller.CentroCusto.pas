unit Controller.CentroCusto;

interface

uses
  SysUtils,
  Generics.Collections,
  Datasnap.DBClient,
  //
  Controller.Base,
  Model.DTO.CentroCustoPai,
  Model.DTO.CentroCustoFilho,
  Subject.Orcamento,
  Observer.Orcamento;

type

  TControllerCentroCusto =  class(TControllerBase)

  end;

  TControllerCentroCustoPai =  class(TControllerBase)
  public
    procedure ListarDataSet(AEntidades: TList<TObject>); override;
  end;

  TControllerCentroCustoFilho =  class(TControllerBase)
  public
    procedure ListarDataSet(AEntidades: TList<TObject>); override;
  end;

implementation

{ TControllerCentroCustoPai }

procedure TControllerCentroCustoPai.ListarDataSet(AEntidades: TList<TObject>);
 var
  LCentroCustoPai :TCentroCustoPai;
begin
  DataSet.EmptyDataSet;
  for LCentroCustoPai in TList<TCentroCustoPai>(AEntidades) do
  begin
    DataSet.Append;

    DataSet.FieldByName('CODIGO').AsString := LCentroCustoPai.Codigo;
    DataSet.FieldByName('TOTAL').AsFloat := LCentroCustoPai.Total;

    DataSet.Post;
  end;
end;

{ TControllerCentroCustoFilho }

procedure TControllerCentroCustoFilho.ListarDataSet(AEntidades: TList<TObject>);
 var
  LCentroCustoFilho :TCentroCustoFilho;
begin
  DataSet.EmptyDataSet;
  for LCentroCustoFilho in TList<TCentroCustoFilho>(AEntidades) do
  begin
    DataSet.Append;

    DataSet.FieldByName('CODIGO').AsString := LCentroCustoFilho.Codigo;
    DataSet.FieldByName('CODIGOPAI').AsString := LCentroCustoFilho.CodigoPai;
    DataSet.FieldByName('TOTAL').AsFloat := LCentroCustoFilho.Total;

    DataSet.Post;
  end;
end;

end.
