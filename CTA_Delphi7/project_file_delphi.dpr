program project_file_delphi;

uses
  Forms,
  UnitFrmMain in 'UnitFrmMain.pas' {frmMain},
  UnitDMVFP in 'UnitDMVFP.pas' {DMVFP: TDataModule},
  UnitFrmChildTypeProduct in 'UnitFrmChildTypeProduct.pas' {frmChildTypeProduct},
  UnitFrmChildProduct in 'UnitFrmChildProduct.pas' {frmChildProduct},
  UnitFrmChildTypeDish in 'UnitFrmChildTypeDish.pas' {frmChildTypeDish},
  UnitFrmChildDish in 'UnitFrmChildDish.pas' {frmChildDish},
  UnitFrmChildProvider in 'UnitFrmChildProvider.pas' {frmChildProvider},
  UnitFrmChildWorker in 'UnitFrmChildWorker.pas' {frmChildWorker},
  UnitFrmChildSupplyProduct in 'UnitFrmChildSupplyProduct.pas' {frmChildSupplyProduct},
  UnitFrmChildOrder in 'UnitFrmChildOrder.pas' {frmChildOrder},
  UnitDMforQueryAndReport in 'UnitDMforQueryAndReport.pas' {DMforQureryAndReport: TDataModule},
  UnitDMforQuery in 'UnitDMforQuery.pas' {DMforQuery: TDataModule},
  UnitFormQueryViewer in 'UnitFormQueryViewer.pas' {FormQueryViewer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMVFP, DMVFP);
  Application.CreateForm(TDMforQureryAndReport, DMforQureryAndReport);
  Application.CreateForm(TDMforQuery, DMforQuery);
  Application.Run;
end.
