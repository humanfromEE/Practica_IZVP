unit UnitFrmChildTypeProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro },
  StdCtrls, ExtCtrls, DBCtrls, ComCtrls;
  
type
  TfrmChildTypeProduct = class(TForm)
    pgcForTabs: TPageControl;
    tsPCedit: TTabSheet;
    dbnvgr1: TDBNavigator;
    tsPCsearch: TTabSheet;
    lblMessageForInput: TLabel;
    dbgrd2: TDBGrid;
    rgCategorySearch: TRadioGroup;
    edtInputField: TEdit;
    btnSearchData: TButton;
    btnClearForm: TButton;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearFormClick(Sender: TObject);
    procedure btnSearchDataClick(Sender: TObject);
  private
    nameTfrmChildTypeProduct: string;
  public
    function getNameTfrmChildTypeProduct(): string;
  end;

var
  frmChildTypeProduct: TfrmChildTypeProduct;

implementation

{$R *.dfm}

procedure TfrmChildTypeProduct.FormCreate(Sender: TObject);
begin
  nameTfrmChildTypeProduct := 'Види продуктів';
end;

procedure TfrmChildTypeProduct.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildTypeProduct;
    questionMB := 'Ви дійсно бажаєте закрити форму "' + nameFormForMB + '"';
    titleMB := 'Закриття форми "' + nameFormForMB + '"';
    if Application.MessageBox(
      PAnsiChar(questionMB),
      PAnsiChar(titleMB),
      MB_YESNO Or MB_ICONQUESTION Or MB_DEFBUTTON2
    ) = IDNO then
    begin
      Action := caNone;
    end
    else
    begin
      Action := caFree;
      frmChildTypeProduct := nil;
    end;
end;

function TfrmChildTypeProduct.getNameTfrmChildTypeProduct(): string;
begin
  getNameTfrmChildTypeProduct := nameTfrmChildTypeProduct;
end;

procedure TfrmChildTypeProduct.btnClearFormClick(Sender: TObject);
begin
  DMVFP.qryDBtype_product.Close;
  DMVFP.qryDBtype_product.SQL.Clear;
  edtInputField.Text := '';
  rgCategorySearch.ItemIndex := 0;
end;

procedure TfrmChildTypeProduct.btnSearchDataClick(Sender: TObject);
var
  strExpression: string;
  strSQLExpression: string;
  arrayNameFields: array[0..10] of string;
  isQueryRun: Boolean;
  doubleForTest: double;
begin
  isQueryRun := False;

  arrayNameFields[0] := 'code_tp';
  arrayNameFields[1] := 'name_tp';

  if edtInputField.Text <> '' then
  begin
    case (rgCategorySearch.ItemIndex) of
      0, 1:
      begin
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' LIKE "%' + edtInputField.Text + '%"';
        isQueryRun := True;
      end;
    end;


    strSQLExpression := 'SELECT * FROM type_product_table WHERE ';

    with DMVFP do
    begin
      qryDBtype_product.Close;
      qryDBtype_product.SQL.Clear;
      if (isQueryRun) then
      begin
        qryDBtype_product.SQL.Add(strSQLExpression + strExpression);
        qryDBtype_product.Open;
        dbgrd2.Columns[0].Title.Caption := 'Код_виду_продукту';
        dbgrd2.Columns[1].Title.Caption := 'Назва_виду_продукту';
      end;
    end;
  end;
end;

end.
