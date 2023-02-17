unit UnitDMforQuery;

interface

uses
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro },
  DB, Classes, ADODB ,
  SysUtils;

type
  TDMforQuery = class(TDataModule)
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
