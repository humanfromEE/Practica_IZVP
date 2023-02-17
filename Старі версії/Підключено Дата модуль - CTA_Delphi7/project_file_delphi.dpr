program project_file_delphi;

uses
  Forms,
  UnitFrmMain in 'UnitFrmMain.pas' {frmMain},
  UnitDMVFP in 'UnitDMVFP.pas' {DMVFP: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDMVFP, DMVFP);
  Application.Run;
end.
