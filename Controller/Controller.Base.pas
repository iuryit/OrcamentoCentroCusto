unit Controller.Base;

interface

uses
 SysUtils,
 Generics.Collections,
 Datasnap.DBClient,
  //
 Controller.Interfaces;

 type
  TControllerBase = class(TInterfacedObject, IControllerBase)
  private
    FDataSet: TClientDataSet;
    FTipoPersistencia: TTipoPersistencia;
  protected
    function GetTipoPersistencia: TTipoPersistencia;
    procedure SetTipoPersistencia(const Value: TTipoPersistencia);
    procedure SetDataSet(const Value: TClientDataSet);
    function  GetDataSet: TClientDataSet;
  public
    function Incluir(AEntidade: TObject) : Integer; overload; virtual;
    procedure Alterar(AEntidade: TObject); overload; virtual;
    procedure Excluir(AEntidade: TObject); overload; virtual;
    function Listar : TList<TObject>; overload; virtual;
    procedure ListarDataSet(AEntidades: TList<TObject>);overload; virtual;
    procedure ListarDataSet(AEntidade: TObject);overload; virtual;
    //
    property DataSet: TClientDataSet read GetDataSet write SetDataSet;
  end;

implementation

{ TControllerBase }

procedure TControllerBase.Alterar(AEntidade: TObject);
begin
end;

procedure TControllerBase.Excluir(AEntidade: TObject);
begin
end;

function TControllerBase.GetDataSet: TClientDataSet;
begin
  Result := FDataSet
end;

function TControllerBase.GetTipoPersistencia: TTipoPersistencia;
begin
  Result := FTipoPersistencia
end;

function TControllerBase.Incluir(AEntidade: TObject): Integer;
begin

end;

procedure TControllerBase.ListarDataSet(AEntidades: TList<TObject>);
begin

end;

function TControllerBase.Listar: TList<TObject>;
begin

end;

procedure TControllerBase.ListarDataSet(AEntidade: TObject);
begin

end;

procedure TControllerBase.SetDataSet(const Value: TClientDataSet);
begin
  FDataSet := Value;
end;

procedure TControllerBase.SetTipoPersistencia(const Value: TTipoPersistencia);
begin
  FTipoPersistencia := Value;
end;

end.
