unit UnitFrmChildWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP, StdCtrls, ExtCtrls, DBCtrls, ComCtrls { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildWorker = class(TForm)
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearFormClick(Sender: TObject);
    procedure btnSearchDataClick(Sender: TObject);
  private
    nameTfrmChildWorker: string;
    function transferStrNumberForSql(myStr: string): string;
  public
    function getNameTfrmChildWorker(): string;
  end;

var
  frmChildWorker: TfrmChildWorker;

implementation

{$R *.dfm}

procedure TfrmChildWorker.FormCreate(Sender: TObject);
begin
  nameTfrmChildWorker := 'Працівники';
end;

procedure TfrmChildWorker.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildWorker;
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
      frmChildWorker := nil;
    end;
end;

function TfrmChildWorker.getNameTfrmChildWorker(): string;
begin
  getNameTfrmChildWorker := nameTfrmChildWorker;
end;

procedure TfrmChildWorker.btnClearFormClick(Sender: TObject);
begin
  DMVFP.qryDBworker.Close;
  DMVFP.qryDBworker.SQL.Clear;
  edtInputField.Text := '';
  rgCategorySearch.ItemIndex := 0;
end;

function TfrmChildWorker.transferStrNumberForSql(myStr: string): string;
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

procedure TfrmChildWorker.btnSearchDataClick(Sender: TObject);
var
  strExpression: string;
  strSQLExpression: string;
  arrayNameFields: array[0..4] of string;
  isQueryRun: Boolean;
  doubleForTest: double;
begin
  isQueryRun := False;

  arrayNameFields[0] := 'code_w';
  arrayNameFields[1] := 'fullname_w';
  arrayNameFields[2] := 'number_w';
  arrayNameFields[3] := 'salary_w';
  arrayNameFields[4] := 'salary_w';

  if edtInputField.Text <> '' then
  begin
    case (rgCategorySearch.ItemIndex) of
      0, 1, 2:
      begin
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' LIKE "%' + edtInputField.Text + '%"';
        isQueryRun := True;
      end;
      3:
      begin
        if (TryStrToFloat(edtInputField.Text, doubleForTest)) then
        begin
          strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' >= ' + transferStrNumberForSql(edtInputField.Text);
          isQueryRun := True;
        end;
      end;
      4:
      begin
        if (TryStrToFloat(edtInputField.Text, doubleForTest)) then
        begin
          strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' <= ' + transferStrNumberForSql(edtInputField.Text);
          isQueryRun := True;
        end;
      end;
    end;


    strSQLExpression := 'SELECT code_w, fullname_w, number_w, salary_w FROM worker_table WHERE ';

    with DMVFP do
    begin
      qryDBworker.Close;
      qryDBworker.SQL.Clear;
      if (isQueryRun) then
      begin
        qryDBworker.SQL.Add(strSQLExpression + strExpression);
        qryDBworker.Open;
        dbgrd2.Columns[0].Title.Caption := 'Код';
        dbgrd2.Columns[1].Title.Caption := 'ПІП';
        dbgrd2.Columns[2].Title.Caption := 'Номер';
        dbgrd2.Columns[3].Title.Caption := 'Зарплата';
      end;
    end;
  end;
end;

end.

