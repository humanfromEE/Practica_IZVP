unit UnitDMforQueryAndReport;

interface

uses
  UnitDMVFP { ϳ��������� �� � Visual Fox Pro },
  SysUtils, Classes, DB, ADODB;

type
  TDMforQureryAndReport = class(TDataModule)
    qryForReportSupplyProductInJanuary: TADOQuery;
    dsQryForReportSupplyProductInJanuary: TDataSource;
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
