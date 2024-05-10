program OrcamentoCentroCusto;

uses
  Vcl.Forms,
  View.OrcamentoCentroCusto in 'View\View.OrcamentoCentroCusto.pas' {FOrcamentoCentroCusto},
  Model.Orcamento in 'Model\Model.Orcamento.pas',
  Model.CentroCusto in 'Model\Model.CentroCusto.pas',
  Controller.Orcamento in 'Controller\Controller.Orcamento.pas',
  Controller.Base in 'Controller\Controller.Base.pas',
  Controller.Interfaces in 'Controller\Controller.Interfaces.pas',
  View.FrameResumoCentroCustoPai in 'View\View.FrameResumoCentroCustoPai.pas' {FrameResumoCentroCustoPai: TFrame},
  Subject.Orcamento in 'Observers\Subject.Orcamento.pas',
  Observer.Orcamento in 'Observers\Observer.Orcamento.pas',
  View.FrameResumoCentroCustoFilho in 'View\View.FrameResumoCentroCustoFilho.pas' {FrameTituloResumoCentroCustoFilho: TFrame},
  Model.DTO.CentroCustoPai in 'Model\Model.DTO.CentroCustoPai.pas',
  Model.DTO.CentroCustoFilho in 'Model\Model.DTO.CentroCustoFilho.pas',
  Controller.CentroCusto in 'Controller\Controller.CentroCusto.pas',
  Conection in 'Conection.pas' {DataModuleConection: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFOrcamentoCentroCusto, FOrcamentoCentroCusto);
  Application.CreateForm(TDataModuleConection, DataModuleConection);
  Application.Run;
end.
