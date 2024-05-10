unit Controller.Interfaces;

interface

 uses
  SysUtils,
  Generics.Collections,
  Datasnap.DBClient;

 type
  TTipoPersistencia = (tpMemoria, tpBancoDadosFB);

  IControllerBase = interface
    ['{DCA79E80-3CF5-4223-A58A-964C3B6C1A66}']
    procedure SetDataSet(const Value: TClientDataSet);
    function GetDataSet: TClientDataSet;
    function GetTipoPersistencia: TTipoPersistencia;
    procedure SetTipoPersistencia(const Value: TTipoPersistencia);
    //
    function Incluir(AEntidade: TObject) : Integer;
    procedure Alterar(AEntidade: TObject);
    procedure Excluir(AEntidade: TObject);
    function Listar : TList<TObject>;
    procedure ListarDataSet(AEntidades: TList<TObject>); overload;
    procedure ListarDataSet(AEntidade: TObject); overload;
    //
    property DataSet: TClientDataSet read GetDataSet write SetDataSet;
    property TipoPersistencia: TTipoPersistencia read GetTipoPersistencia write SetTipoPersistencia;
  end;

  IControllerBaseFactory = interface
    ['{AB8D8CC5-C25C-4D4A-BE50-7CEFECB5AE2C}']
    function Orcamento: IControllerBase;
    function Custo: IControllerBase;
  end;
implementation

end.
