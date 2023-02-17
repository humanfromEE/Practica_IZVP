unit UnitFrmChildProvider;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP, StdCtrls, ExtCtrls, DBCtrls, ComCtrls { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildProvider = class(TForm)
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
    nameTfrmChildProvider: string;
    function transferStrNumberForSql(myStr: string): string;
  public
    function getNameTfrmChildProvider(): string;
  end;

var
  frmChildProvider: TfrmChildProvider;

implementation

{$R *.dfm}

procedure TfrmChildProvider.FormCreate(Sender: TObject);
begin
  nameTfrmChildProvider := 'Постачальники';
end;

procedure TfrmChildProvider.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildProvider;
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
      frmChildProvider := nil;
    end;
end;

function TfrmChildProvider.getNameTfrmChildProvider(): string;
begin
  getNameTfrmChildProvider := nameTfrmChildProvider;
end;

procedure TfrmChildProvider.btnClearFormClick(Sender: TObject);
begin
  DMVFP.qryDBprovider.Close;
  DMVFP.qryDBprovider.SQL.Clear;
  edtInputField.Text := '';
  rgCategorySearch.ItemIndex := 0;
end;

function TfrmChildProvider.transferStrNumberForSql(myStr: string): string;
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

procedure TfrmChildProvider.btnSearchDataClick(Sender: TObject);
var
  strExpression: string;
  strSQLExpression: string;
  arrayNameFields: array[0..3] of string;
  isQueryRun: Boolean;
  doubleForTest: double;
begin
  isQueryRun := False;

  arrayNameFields[0] := 'code_pv';
  arrayNameFields[1] := 'name_pv';
  arrayNameFields[2] := 'number_pv';
  arrayNameFields[3] := 'address_pv';

  if edtInputField.Text <> '' then
  begin
    case (rgCategorySearch.ItemIndex) of
      0, 1, 2, 3:
      begin
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' LIKE "%' + edtInputField.Text + '%"';
        isQueryRun := True;
      end;
    end;


    strSQLExpression := 'SELECT code_pv, name_pv, number_pv, address_pv FROM provider_table WHERE ';

    with DMVFP do
    begin
      qryDBprovider.Close;
      qryDBprovider.SQL.Clear;
      if (isQueryRun) then
      begin
        qryDBprovider.SQL.Add(strSQLExpression + strExpression);
        qryDBprovider.Open;
        dbgrd2.Columns[0].Title.Caption := 'Код';
        dbgrd2.Columns[1].Title.Caption := 'Назва';
        dbgrd2.Columns[2].Title.Caption := 'Номер';
        dbgrd2.Columns[3].Title.Caption := 'Адреса';
      end;
    end;
  end;
end;

end.

