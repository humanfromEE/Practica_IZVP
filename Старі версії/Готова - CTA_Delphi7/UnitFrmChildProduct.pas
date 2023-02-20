unit UnitFrmChildProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  UnitDMVFP, StdCtrls, ExtCtrls, Grids, DBGrids, DBCtrls, ComCtrls { Data Module для імпорту БД з Visual FoxPro };

type
  TfrmChildProduct = class(TForm)
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
    dbgrd1: TDBGrid;
    btnClearInputField: TButton;
    btnGoToRecord: TButton;
    edtInputCodeRecord: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearFormClick(Sender: TObject);
    procedure btnSearchDataClick(Sender: TObject);
    procedure btnClearInputFieldClick(Sender: TObject);
    procedure btnGoToRecordClick(Sender: TObject);
  private
    nameTfrmChildProduct: string;
    function transferStrNumberForSql(myStr: string): string;
  public
    function getNameTfrmChildProduct(): string;
  end;

var
  frmChildProduct: TfrmChildProduct;

implementation

{$R *.dfm}

procedure TfrmChildProduct.FormCreate(Sender: TObject);
begin
  nameTfrmChildProduct := 'Продукти';
  btnClearFormClick(Sender);
  btnClearInputFieldClick(Sender);
end;

procedure TfrmChildProduct.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildProduct;
    questionMB := 'Ви дійсно бажаєте закрити форму "' + nameFormForMB + '"?';
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
      btnClearInputFieldClick(Sender);
      Action := caFree;
      frmChildProduct := nil;
    end;
end;

function TfrmChildProduct.getNameTfrmChildProduct(): string;
begin
  getNameTfrmChildProduct := nameTfrmChildProduct;
end;

procedure TfrmChildProduct.btnClearFormClick(Sender: TObject);
begin
  DMVFP.qryDBproduct.Close;
  DMVFP.qryDBproduct.SQL.Clear;
  edtInputField.Text := '';
  rgCategorySearch.ItemIndex := 0;
end;

procedure TfrmChildProduct.btnSearchDataClick(Sender: TObject);
var
  strExpression: string;
  strSQLExpression: string;
  arrayNameFields: array[0..5] of string;
  isQueryRun: Boolean;
  doubleForTest: double;
begin
  isQueryRun := False;

  arrayNameFields[0] := 'code_p';
  arrayNameFields[1] := 'code_tp_p';
  arrayNameFields[2] := 'name_p';
  arrayNameFields[3] := 'name_tp';
  arrayNameFields[4] := 'price_p';
  arrayNameFields[5] := 'price_p';

  if edtInputField.Text <> '' then
  begin
    case (rgCategorySearch.ItemIndex) of
      0, 1, 2, 3:
      begin
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' LIKE "%' + edtInputField.Text + '%"';
        isQueryRun := True;
      end;
      4:
      begin
        if (TryStrToFloat(edtInputField.Text, doubleForTest)) then
        begin
          strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' >= ' + transferStrNumberForSql(edtInputField.Text);
          isQueryRun := True;
        end;
      end;
      5:
      begin
        if (TryStrToFloat(edtInputField.Text, doubleForTest)) then
        begin
          strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' <= ' + transferStrNumberForSql(edtInputField.Text);
          isQueryRun := True;
        end;
      end;
    end;


    strSQLExpression := 'SELECT code_p, name_p, name_tp, price_p FROM product_table INNER JOIN type_product_table ON code_tp_p = code_tp WHERE ';

    with DMVFP do
    begin
      qryDBproduct.Close;
      qryDBproduct.SQL.Clear;
      if (isQueryRun) then
      begin
        qryDBproduct.SQL.Add(strSQLExpression + strExpression);
        qryDBproduct.Open;
        dbgrd2.Columns[0].Title.Caption := 'Код';
        dbgrd2.Columns[1].Title.Caption := 'Назва';
        dbgrd2.Columns[2].Title.Caption := 'Назва_виду_продукту';
        dbgrd2.Columns[3].Title.Caption := 'Ціна';
      end;
    end;
  end
  else
  begin
    Application.MessageBox(PAnsiChar('Уведіть відповідне значення у поле вводу'), PAnsiChar('Недостатньо даних!'), MB_OK Or MB_ICONINFORMATION);
  end;
end;

function TfrmChildProduct.transferStrNumberForSql(myStr: string): string;
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

procedure TfrmChildProduct.btnClearInputFieldClick(Sender: TObject);
begin
  if not DMVFP.TblDBproduct.Eof then
  begin
    DMVFP.TblDBproduct.First;
  end;
  edtInputCodeRecord.Text := '';
  dbgrd1.DataSource := DMVFP.DsDBproduct;
end;

procedure TfrmChildProduct.btnGoToRecordClick(Sender: TObject);
var
  codeForSearch: string;
  questionMB: string;
  titleMB: string;
begin
  codeForSearch := edtInputCodeRecord.Text;
  if codeForSearch <> '' then
  begin
    with DMVFP do
    begin
      if not TblDBproduct.Eof then
      begin
        TblDBproduct.First;
        while not TblDBproduct.Eof do
        begin
          if TblDBproduct['code_p'] = codeForSearch then
          begin
            Break;
          end;
          TblDBproduct.Next;
        end;

        // Якщо нічого не знайдено
        if TblDBproduct.Eof then
        begin
          TblDBproduct.First;
          questionMB := 'Дані не знайдено за кодом "' + codeForSearch + '", перевірте коректність вводу (ввід у форматі "ХХХp", де Х - це цифра)';
          titleMB := 'Нічого не знайдено!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);      
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBproduct;
  end
  else
  begin
    questionMB := 'Уведіть код у відповідне поле вводу';
    titleMB := 'Недостатньо даних!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

end.
