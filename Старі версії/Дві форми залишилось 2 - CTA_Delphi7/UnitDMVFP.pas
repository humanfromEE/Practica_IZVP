unit UnitDMVFP;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TDMVFP = class(TDataModule)
    ADOFoxProDB: TADOConnection;
    TblDBdish: TADOTable;
    TblDBproduct: TADOTable;
    TblDBtype_product: TADOTable;
    TblDBtype_dish: TADOTable;
    TblDBworker: TADOTable;
    TblDBprovider: TADOTable;
    TblDBsupply_product: TADOTable;
    TblDBorder: TADOTable;
    DsDBdish: TDataSource;
    DsDBtype_product: TDataSource;
    DsDBtype_dish: TDataSource;
    DsDBproduct: TDataSource;
    DsDBsupply_product: TDataSource;
    DsDBworker: TDataSource;
    DsDBprovider: TDataSource;
    DsDBorder: TDataSource;
    qryDBdish: TADOQuery;
    qryDBtype_product: TADOQuery;
    qryDBtype_dish: TADOQuery;
    qryDBproduct: TADOQuery;
    qryDBsupply_product: TADOQuery;
    qryDBworker: TADOQuery;
    qryDBprovider: TADOQuery;
    qryDBorder: TADOQuery;
    DsDBQdish: TDataSource;
    DsDBQtype_product: TDataSource;
    DsDBQtype_dish: TDataSource;
    DsDBQproduct: TDataSource;
    DsDBQsupply_product: TDataSource;
    DsDBQworker: TDataSource;
    DsDBQprovider: TDataSource;
    DsDBQorder: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMVFP: TDMVFP;

implementation

{$R *.dfm}

end.
