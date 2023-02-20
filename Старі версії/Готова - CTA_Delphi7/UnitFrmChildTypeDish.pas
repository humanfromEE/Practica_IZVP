unit UnitFrmChildTypeDish;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP, StdCtrls, ExtCtrls, DBCtrls, ComCtrls { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildTypeDish = class(TForm)
    pgcForTabs: TPageControl;
    tsPCedit: TTabSheet;
    dbnvgr1: TDBNavigator;
    dbgrd1: TDBGrid;
    tsPCsearch: TTabSheet;
    lblMessageForInput: TLabel;
    dbgrd2: TDBGrid;
    rgCategorySearch: TRadioGroup;
    edtInputField: TEdit;
    btnSearchData: TButton;
    btnClearForm: TButton;
    btnGoToRecord: TButton;
    edtInputCodeRecord: TEdit;
    btnClearInputField: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSearchDataClick(Sender: TObject);
    procedure btnClearFormClick(Sender: TObject);
    procedure btnClearInputFieldClick(Sender: TObject);
    procedure btnGoToRecordClick(Sender: TObject);
  private
    nameTfrmChildTypeDish: string;
  public
    function getNameTfrmChildTypeDish(): string;
  end;

var
  frmChildTypeDish: TfrmChildTypeDish;

implementation

{$R *.dfm}

procedure TfrmChildTypeDish.FormCreate(Sender: TObject);
begin
  nameTfrmChildTypeDish := 'Види страв';
  btnClearFormClick(Sender);
  btnClearInputFieldClick(Sender);
end;

procedure TfrmChildTypeDish.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildTypeDish;
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
      frmChildTypeDish := nil;
    end;
end;

function TfrmChildTypeDish.getNameTfrmChildTypeDish(): string;
begin
  getNameTfrmChildTypeDish := nameTfrmChildTypeDish;
end;

procedure TfrmChildTypeDish.btnSearchDataClick(Sender: TObject);
var
  strExpression: string;
  strSQLExpression: string;
  arrayNameFields: array[0..10] of string;
  isQueryRun: Boolean;
  doubleForTest: double;
begin
  isQueryRun := False;

  arrayNameFields[0] := 'code_td';
  arrayNameFields[1] := 'name_td';

  if edtInputField.Text <> '' then
  begin
    case (rgCategorySearch.ItemIndex) of
      0, 1:
      begin
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' LIKE "%' + edtInputField.Text + '%"';
        isQueryRun := True;
      end;
    end;


    strSQLExpression := 'SELECT * FROM type_dish_table WHERE ';

    with DMVFP do
    begin
      qryDBtype_dish.Close;
      qryDBtype_dish.SQL.Clear;
      if (isQueryRun) then
      begin
        qryDBtype_dish.SQL.Add(strSQLExpression + strExpression);
        qryDBtype_dish.Open;
        dbgrd2.Columns[0].Title.Caption := 'Код_виду_страви';
        dbgrd2.Columns[1].Title.Caption := 'Назва_виду_страви';
      end;
    end;
  end
  else
  begin
    Application.MessageBox(PAnsiChar('Уведіть відповідне значення у поле вводу'), PAnsiChar('Недостатньо даних!'), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildTypeDish.btnClearFormClick(Sender: TObject);
begin
  DMVFP.qryDBtype_dish.Close;
  DMVFP.qryDBtype_dish.SQL.Clear;
  edtInputField.Text := '';
  rgCategorySearch.ItemIndex := 0;
end;

procedure TfrmChildTypeDish.btnClearInputFieldClick(Sender: TObject);
begin
  if not DMVFP.TblDBtype_dish.Eof then
  begin
    DMVFP.TblDBtype_dish.First;
  end;
  edtInputCodeRecord.Text := '';
  dbgrd1.DataSource := DMVFP.DsDBtype_dish;
end;

procedure TfrmChildTypeDish.btnGoToRecordClick(Sender: TObject);
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
      if not TblDBtype_dish.Eof then
      begin
        TblDBtype_dish.First;
        while not TblDBtype_dish.Eof do
        begin
          if TblDBtype_dish['code_td'] = codeForSearch then
          begin
            Break;
          end;
          TblDBtype_dish.Next;
        end;

        // Якщо нічого не знайдено
        if TblDBtype_dish.Eof then
        begin
          TblDBtype_dish.First;
          questionMB := 'Дані не знайдено за кодом "' + codeForSearch + '", перевірте коректність вводу (ввід у форматі "ХХtd", де Х - це цифра)';
          titleMB := 'Нічого не знайдено!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);      
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBtype_dish;
  end
  else
  begin
    questionMB := 'Уведіть код у відповідне поле вводу';
    titleMB := 'Недостатньо даних!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

end.

