unit Conection;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModuleConection = class(TDataModule)
    FDConnectionFB: TFDConnection;
    FDQueryFB: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ConfiguraConexao;
  public
    { Public declarations }
  end;

var
  DataModuleConection: TDataModuleConection;

implementation

 uses
  System.IOUtils;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDataModuleConection }

procedure TDataModuleConection.ConfiguraConexao;
var
  LPathArquivo: String;
  LArquivo: TStrings;
begin
  LPathArquivo := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)), 'ParametrosConexao.txt');
  //variável para carregar os parametros do banco
  LArquivo := TStringList.Create;
  try
    LArquivo.LoadFromFile(LPathArquivo);
    FDConnectionFB.Params.Text := LArquivo.Text;
  finally
    LArquivo.Free;
  end;
  FDConnectionFB.LoginPrompt := False;
end;

procedure TDataModuleConection.DataModuleCreate(Sender: TObject);
begin
  ConfiguraConexao;
end;

end.
