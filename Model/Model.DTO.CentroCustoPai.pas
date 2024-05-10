unit Model.DTO.CentroCustoPai;

interface

uses
  System.SysUtils,
  //
  Model.CentroCusto;

type
  TCentroCustoPai = class(TCentroCusto)
  private
    FTotal: double;
  public
    procedure GetCodPai(AValue : String);
  public
    property Total: double read FTotal write FTotal;
  end;

implementation

{ TCentroCustoPai }

procedure TCentroCustoPai.GetCodPai(AValue : String);
begin
  if Length(AValue) = 6 then
  begin
    Self.Codigo := Copy(AValue,1,2);
  end
  else raise Exception.Create('Formato do Codigo invalido');
end;

end.
