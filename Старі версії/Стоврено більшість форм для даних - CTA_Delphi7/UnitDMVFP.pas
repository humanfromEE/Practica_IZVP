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
