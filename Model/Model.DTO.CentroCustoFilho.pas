unit Model.DTO.CentroCustoFilho;

interface

uses
  System.SysUtils,
  //
  Model.CentroCusto;

type
  TCentroCustoFilho = class(TCentroCusto)
  private
    FTotal: double;
    FCodigoPai: string;
  public
    function GetCodFilho(AValue : String):String;
  public
    property CodigoPai: string read FCodigoPai write FCodigoPai;
    property Total: double read FTotal write FTotal;
  end;

implementation

{ TCentroCustoFilho }

function TCentroCustoFilho.GetCodFilho(AValue: String):String;
begin
  if Length(AValue) = 6 then
  begin
    Self.Codigo := Copy(AValue,3,4);
    FCodigoPai  := Copy(AValue,1,2);
  end
  else raise Exception.Create('Formato do Codigo invalido');
end;

end.
