unit UnitDMforQueryAndReport;

interface

uses
  UnitDMVFP { Підключення БД з Visual Fox Pro },
  SysUtils, Classes, DB, ADODB, DBTables, frxClass, frxDBSet;

type
  TDMforQureryAndReport = class(TDataModule)
    qryForReportSupplyProductInJanuary2023: TADOQuery;
    DsFrxQryForReportSupplyProductInJanuary2023: TfrxDBDataset;
    qryForReportWorkerSalary: TADOQuery;
    DsFrxQryForReportWorkerSalary: TfrxDBDataset;
    qryForReportMostCountOrder: TADOQuery;
    DsFrxQryForReportMostCountOrder: TfrxDBDataset;
    qryForMenuReport: TADOQuery;
    DsFrxQryForMenuReport: TfrxDBDataset;
    reportSupplyProductInJanuary2023: TfrxReport;
    reportWorkerSalary: TfrxReport;
    reportMostCounterOrder: TfrxReport;
    menuReport: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMforQureryAndReport: TDMforQureryAndReport;

implementation

{$R *.dfm}

end.
