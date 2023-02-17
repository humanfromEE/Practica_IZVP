unit UnitFrmChildSupplyProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP, StdCtrls, ExtCtrls, DBCtrls, ComCtrls { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildSupplyProduct = class(TForm)
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
    lblCodeRecord: TLabel;
    edtInputCodeRecord: TEdit;
    lblCodeDish: TLabel;
    edtInputCodeDishRecord: TEdit;
    lblCodeWorker: TLabel;
    edtInputCodeWorkerRecord: TEdit;
    btnGoToRecord: TButton;
    btnGoToRecordWithCodeDish: TButton;
    btnGoToRecordWithCodeWorker: TButton;
    btnGoToRecordWithWorkerAndDishRecord: TButton;
    btnClearInputField: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearFormClick(Sender: TObject);
    procedure btnSearchDataClick(Sender: TObject);
    procedure btnClearInputFieldClick(Sender: TObject);
    procedure btnGoToRecordClick(Sender: TObject);
    procedure btnGoToRecordWithCodeDishClick(Sender: TObject);
    procedure btnGoToRecordWithCodeWorkerClick(Sender: TObject);
    procedure btnGoToRecordWithWorkerAndDishRecordClick(Sender: TObject);
  private
    nameTfrmChildSupplyProduct: string;
  public
    function getNameTfrmChildSupplyProduct(): string;
  end;

var
  frmChildSupplyProduct: TfrmChildSupplyProduct;

implementation

{$R *.dfm}

procedure TfrmChildSupplyProduct.FormCreate(Sender: TObject);
begin
  nameTfrmChildSupplyProduct := 'Постачання продуктів';
  btnClearFormClick(Sender);
  btnClearInputFieldClick(Sender);
end;

procedure TfrmChildSupplyProduct.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildSupplyProduct;
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
      frmChildSupplyProduct := nil;
    end;
end;

function TfrmChildSupplyProduct.getNameTfrmChildSupplyProduct(): string;
begin
  getNameTfrmChildSupplyProduct := nameTfrmChildSupplyProduct;
end;

procedure TfrmChildSupplyProduct.btnClearFormClick(Sender: TObject);
begin
  DMVFP.qryDBsupply_product.Close;
  DMVFP.qryDBsupply_product.SQL.Clear;
  edtInputField.Text := '';
  rgCategorySearch.ItemIndex := 0;
end;

procedure TfrmChildSupplyProduct.btnSearchDataClick(Sender: TObject);
var
  strExpression: string;
  strSQLExpression: string;
  arrayNameFields: array[0..8] of string;
  isQueryRun: Boolean;
begin
  isQueryRun := False;

  arrayNameFields[0] := 'code_sp';
  arrayNameFields[1] := 'code_pv_sp';
  arrayNameFields[2] := 'code_p_sp';
  arrayNameFields[3] := 'name_pv';
  arrayNameFields[4] := 'name_p';
  arrayNameFields[5] := 'code_sp';
  arrayNameFields[6] := 'code_sp';
  arrayNameFields[7] := 'code_sp';
  arrayNameFields[8] := 'code_sp';

  if edtInputField.Text <> '' then
  begin
    case (rgCategorySearch.ItemIndex) of
      0, 1, 2, 3, 4:
      begin
        strSQLExpression := 'SELECT code_sp, code_pv_sp, name_pv, code_p_sp, name_p, price_p, date_sp, count_sp, ROUND(count_sp * price_p, 2) FROM supply_product_table INNER JOIN provider_table ON code_pv_sp = code_pv INNER JOIN product_table ON code_p_sp = code_p WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' LIKE "%' + edtInputField.Text + '%"';
        isQueryRun := True;
      end;
      5:
      begin
        strSQLExpression := 'SELECT SUM(ROUND(count_sp * price_p, 2)) FROM supply_product_table INNER JOIN product_table ON code_p_sp = code_p WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' = "' + edtInputField.Text + '"';
        isQueryRun := True;
      end;
      6:
      begin
        strSQLExpression := 'SELECT COUNT(code_sp) FROM supply_product_table WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' = "' + edtInputField.Text + '"';
        isQueryRun := True;
      end;
      7:
      begin
        strSQLExpression := 'SELECT MIN(ROUND(count_sp * price_p, 2)) FROM supply_product_table INNER JOIN product_table ON code_p_sp = code_p WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' = "' + edtInputField.Text + '" GROUP BY code_sp';
        isQueryRun := True;
      end;
      8:
      begin
        strSQLExpression := 'SELECT MAX(ROUND(count_sp * price_p, 2)) FROM supply_product_table INNER JOIN product_table ON code_p_sp = code_p WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' = "' + edtInputField.Text + '" GROUP BY code_sp';
        isQueryRun := True;
      end;
    end;

    with DMVFP do
    begin
      qryDBsupply_product.Close;
      qryDBsupply_product.SQL.Clear;
      if (isQueryRun) then
      begin
        qryDBsupply_product.SQL.Add(strSQLExpression + strExpression);
        qryDBsupply_product.Open;
      end;

      case (rgCategorySearch.ItemIndex) of
        0, 1, 2, 3, 4:
        begin
          dbgrd2.Columns[0].Title.Caption := 'Код';
          dbgrd2.Columns[1].Title.Caption := 'Код_постачальника';
          dbgrd2.Columns[2].Title.Caption := 'Назва_постачальника';
          dbgrd2.Columns[3].Title.Caption := 'Код_продукту';
          dbgrd2.Columns[4].Title.Caption := 'Назва_продукту';
          dbgrd2.Columns[5].Title.Caption := 'Ціна_продукту';
          dbgrd2.Columns[6].Title.Caption := 'Дата_постачання';
          dbgrd2.Columns[7].Title.Caption := 'Кількість_постачання';
          dbgrd2.Columns[8].Title.Caption := 'Вартість_постачання';
        end;
        5:
        begin
          dbgrd2.Columns[0].Title.Caption := 'Сума_постачання';
        end;
        6:
        begin
          dbgrd2.Columns[0].Title.Caption := 'Кількість_продуктів_у_постачанні';
        end;
        7:
        begin
          dbgrd2.Columns[0].Title.Caption := 'Мінімальна_вартість_у_постачанні';
        end;
        8:
        begin
          dbgrd2.Columns[0].Title.Caption := 'Максимальна_вартість_у_постачанні';
        end;
      end;
    end;
  end
  else
  begin
    Application.MessageBox(PAnsiChar('Уведіть відповідне значення у поле вводу'), PAnsiChar('Недостатньо даних!'), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildSupplyProduct.btnClearInputFieldClick(Sender: TObject);
begin
  if not DMVFP.TblDBsupply_product.Eof then
  begin
    DMVFP.TblDBsupply_product.First;
  end;
  edtInputCodeRecord.Text := '';
  edtInputCodeDishRecord.Text := '';
  edtInputCodeWorkerRecord.Text := '';
  dbgrd1.DataSource := DMVFP.DsDBsupply_product;
end;

procedure TfrmChildSupplyProduct.btnGoToRecordClick(Sender: TObject);
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
      if not TblDBsupply_product.Eof then
      begin
        TblDBsupply_product.First;
        while not TblDBsupply_product.Eof do
        begin
          if TblDBsupply_product['code_sp'] = codeForSearch then
          begin
            Break;
          end;
          TblDBsupply_product.Next;
        end;

        // Якщо нічого не знайдено
        if TblDBsupply_product.Eof then
        begin
          TblDBsupply_product.First;
          questionMB := 'Дані не знайдено за кодом "' + codeForSearch + '", перевірте коректність вводу (ввід у форматі "ХХХXsp", де Х - це цифра)';
          titleMB := 'Нічого не знайдено!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);      
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBsupply_product;
  end
  else
  begin
    questionMB := 'Уведіть код у відповідне поле вводу';
    titleMB := 'Недостатньо даних!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildSupplyProduct.btnGoToRecordWithCodeDishClick(
  Sender: TObject);
var
  codeForSearch, codeDishForSearch: string;
  questionMB: string;
  titleMB: string;
begin
  codeForSearch := edtInputCodeRecord.Text;
  codeDishForSearch := edtInputCodeDishRecord.Text;
  if (codeForSearch <> '') and (codeDishForSearch <> '') then
  begin
    with DMVFP do
    begin
      if not TblDBsupply_product.Eof then
      begin
        TblDBsupply_product.First;
        while not TblDBsupply_product.Eof do
        begin
          if (TblDBsupply_product['code_sp'] = codeForSearch) and (TblDBsupply_product['code_p_sp'] = codeDishForSearch) then
          begin
            Break;
          end;
          TblDBsupply_product.Next;
        end;

        // Якщо нічого не знайдено
        if TblDBsupply_product.Eof then
        begin
          TblDBsupply_product.First;
          questionMB := 'Дані не знайдено за кодами: "' + codeForSearch + '", "' + codeDishForSearch + '", перевірте коректність вводу (ввід у форматі: постачання "XXXXsp"; продукту "ХХХp", де Х - це цифра)';
          titleMB := 'Нічого не знайдено!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBsupply_product;
  end
  else
  begin
    questionMB := 'Уведіть код постачання й код продукту у відповідні поля вводу';
    titleMB := 'Недостатньо даних!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildSupplyProduct.btnGoToRecordWithCodeWorkerClick(
  Sender: TObject);
var
  codeForSearch, codeWorkerForSearch: string;
  questionMB: string;
  titleMB: string;
begin
  codeForSearch := edtInputCodeRecord.Text;
  codeWorkerForSearch := edtInputCodeWorkerRecord.Text;
  if (codeForSearch <> '') and (codeWorkerForSearch <> '') then
  begin
    with DMVFP do
    begin
      if not TblDBsupply_product.Eof then
      begin
        TblDBsupply_product.First;
        while not TblDBsupply_product.Eof do
        begin
          if (TblDBsupply_product['code_sp'] = codeForSearch) and (TblDBsupply_product['code_pv_sp'] = codeWorkerForSearch) then
          begin
            Break;
          end;
          TblDBsupply_product.Next;
        end;

        // Якщо нічого не знайдено
        if TblDBsupply_product.Eof then
        begin
          TblDBsupply_product.First;
          questionMB := 'Дані не знайдено за кодами: "' + codeForSearch + '", "' + codeWorkerForSearch + '", перевірте коректність вводу (ввід у форматі: постачання "XXXXsp"; постачальника "ХХpv", де Х - це цифра)';
          titleMB := 'Нічого не знайдено!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBsupply_product;
  end
  else
  begin
    questionMB := 'Уведіть код постачання й код постачальника у відповідні поля вводу';
    titleMB := 'Недостатньо даних!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildSupplyProduct.btnGoToRecordWithWorkerAndDishRecordClick(
  Sender: TObject);
var
  codeForSearch, codeDishForSearch, codeWorkerForSearch: string;
  questionMB: string;
  titleMB: string;
begin
  codeForSearch := edtInputCodeRecord.Text;
  codeDishForSearch := edtInputCodeDishRecord.Text;
  codeWorkerForSearch := edtInputCodeWorkerRecord.Text;
  if (codeForSearch <> '') and (codeWorkerForSearch <> '') and (codeDishForSearch <> '') then
  begin
    with DMVFP do
    begin
      if not TblDBsupply_product.Eof then
      begin
        TblDBsupply_product.First;
        while not TblDBsupply_product.Eof do
        begin
          if (TblDBsupply_product['code_sp'] = codeForSearch) and (TblDBsupply_product['code_p_sp'] = codeDishForSearch) and (TblDBsupply_product['code_pv_sp'] = codeWorkerForSearch) then
          begin
            Break;
          end;
          TblDBsupply_product.Next;
        end;

        // Якщо нічого не знайдено
        if TblDBsupply_product.Eof then
        begin
          TblDBsupply_product.First;
          questionMB := 'Дані не знайдено за кодами: "' + codeForSearch + '", "' + codeDishForSearch + '", "' + codeWorkerForSearch + '", перевірте коректність вводу (ввід у форматі: постачання "XXXXsp"; продукту "ХХХp"; постачальника "ХХpv", де Х - це цифра)';
          titleMB := 'Нічого не знайдено!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBsupply_product;
  end
  else
  begin
    questionMB := 'Уведіть код постачання, код продукту й код постачальника у відповідні поля вводу';
    titleMB := 'Недостатньо даних!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;


end.

