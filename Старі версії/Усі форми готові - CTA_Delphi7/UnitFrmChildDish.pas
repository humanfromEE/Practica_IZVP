unit UnitFrmChildDish;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro }, ComCtrls,
  StdCtrls, ExtCtrls, DBCtrls;

type
  TfrmChildDish = class(TForm)
    PageControlForTabs: TPageControl;
    PCedit: TTabSheet;
    PCsearch: TTabSheet;
    DBGrid1: TDBGrid;
    rgCategorySearch: TRadioGroup;
    edtInputField: TEdit;
    lblMessageForInput: TLabel;
    btnSearchData: TButton;
    DBGrid2: TDBGrid;
    DBNavigator1: TDBNavigator;
    btnClearForm: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchDataClick(Sender: TObject);
    procedure btnClearFormClick(Sender: TObject);
  private
    nameTfrmChildDish: string;
    function transferStrNumberForSql(myStr: string): string;
  public
    function getNameTfrmChildDish(): string;
  end;

var
  frmChildDish: TfrmChildDish;

implementation

{$R *.dfm}

procedure TfrmChildDish.FormCreate(Sender: TObject);
begin
  nameTfrmChildDish := 'Страви';
end;

procedure TfrmChildDish.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildDish;
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
      btnClearFormClick(Sender);
      Action := caFree;
      frmChildDish := nil;
    end;
end;

function TfrmChildDish.getNameTfrmChildDish(): string;
begin
  getNameTfrmChildDish := nameTfrmChildDish;
end;


procedure TfrmChildDish.btnSearchDataClick(Sender: TObject);
var
  strExpression: string;
  strSQLExpression: string;
  arrayNameFields: array[0..10] of string;
  isQueryRun: Boolean;
  doubleForTest: double;
begin
  isQueryRun := False;

  arrayNameFields[0] := 'code_d';
  arrayNameFields[1] := 'code_p_d';
  arrayNameFields[2] := 'code_td_d';
  arrayNameFields[3] := 'name_d';
  arrayNameFields[4] := 'name_p';
  arrayNameFields[5] := 'name_td';
  arrayNameFields[6] := 'composition_d';
  arrayNameFields[7] := 'price_d';
  arrayNameFields[8] := 'price_d';
  arrayNameFields[9] := 'weight_d';
  arrayNameFields[10] := 'weight_d';

  if edtInputField.Text <> '' then
  begin
    case (rgCategorySearch.ItemIndex) of
      0, 1, 2, 3, 4, 5, 6:
      begin
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' LIKE "%' + edtInputField.Text + '%"';
        isQueryRun := True;
      end;
      7, 9:
      begin
        if (TryStrToFloat(edtInputField.Text, doubleForTest)) then
        begin
          strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' >= ' + transferStrNumberForSql(edtInputField.Text);
          isQueryRun := True;
        end;
      end;
      8, 10:
      begin
        if (TryStrToFloat(edtInputField.Text, doubleForTest)) then
        begin
          strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' <= ' + transferStrNumberForSql(edtInputField.Text);
          isQueryRun := True;
        end;
      end;
    end;


    strSQLExpression := 'SELECT code_d, name_d, price_d, weight_d, composition_d, name_p, name_td FROM dish_table INNER JOIN product_table ON code_p_d = code_p INNER JOIN type_dish_table ON code_td_d = code_td WHERE ';

    with DMVFP do
    begin
      qryDBdish.Close;
      qryDBdish.SQL.Clear;
      if (isQueryRun) then
      begin
        qryDBdish.SQL.Add(strSQLExpression + strExpression);
        qryDBdish.Open;
        DBGrid1.Columns[0].Title.Caption := 'Код';
        DBGrid1.Columns[1].Title.Caption := 'Назва';
        DBGrid1.Columns[2].Title.Caption := 'Ціна';
        DBGrid1.Columns[3].Title.Caption := 'Вага';
        DBGrid1.Columns[4].Title.Caption := 'Склад';
        DBGrid1.Columns[5].Title.Caption := 'Головний_продукт';
        DBGrid1.Columns[6].Title.Caption := 'Вид_страви';
      end;
    end;
  end;
end;

function TfrmChildDish.transferStrNumberForSql(myStr: string): string;
var
  returnString: string;
  doubleForTest: double;
  counterForString: Integer;
begin
  returnString := '';
  if TryStrToFloat(edtInputField.Text, doubleForTest) then
  begin
    for counterForString := 1 to Length(myStr) do
    begin
      if (myStr[counterForString] = ',') then
      begin
        returnString := returnString + '.';
        if (counterForString = Length(myStr)) then
        begin
          returnString := returnString + '0';
        end;
      end
      else
      begin
        returnString := returnString + myStr[counterForString];
      end;
    end;
  end;
  transferStrNumberForSql := returnString;
end;

procedure TfrmChildDish.btnClearFormClick(Sender: TObject);
begin
  DMVFP.qryDBdish.Close;
  DMVFP.qryDBdish.SQL.Clear;
  edtInputField.Text := '';
  rgCategorySearch.ItemIndex := 0;
end;

end.

