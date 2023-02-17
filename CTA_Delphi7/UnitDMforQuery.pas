unit UnitDMforQuery;

interface

uses
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro },
  DB, Classes, ADODB ,
  SysUtils;

type
  TDMforQuery = class(TDataModule)
    qryName_product_is_dish_head_product_query: TADOQuery;
    dsName_product_is_dish_head_product_query: TDataSource;
    qryProviders_in_lviv_query: TADOQuery;
    DataSource1: TDataSource;
    dsProviders_in_lviv_query: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMforQuery: TDMforQuery;

implementation

{$R *.dfm}

end.
