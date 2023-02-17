unit UnitFrmChildSupplyProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP, StdCtrls, ExtCtrls, DBCtrls, ComCtrls { Data Module ��� ������� �� � Visual FoxPro };
  
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
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearFormClick(Sender: TObject);
    procedure btnSearchDataClick(Sender: TObject);
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
  nameTfrmChildSupplyProduct := '���������� ��������';
end;

procedure TfrmChildSupplyProduct.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildSupplyProduct;
    questionMB := '�� ����� ������ ������� ����� "' + nameFormForMB + '"?';
    titleMB := '�������� ����� "' + nameFormForMB + '"';
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
          dbgrd2.Columns[0].Title.Caption := '���';
          dbgrd2.Columns[1].Title.Caption := '���_�������������';
          dbgrd2.Columns[2].Title.Caption := '�����_�������������';
          dbgrd2.Columns[3].Title.Caption := '���_��������';
          dbgrd2.Columns[4].Title.Caption := '�����_��������';
          dbgrd2.Columns[5].Title.Caption := 'ֳ��_��������';
          dbgrd2.Columns[6].Title.Caption := '����_����������';
          dbgrd2.Columns[7].Title.Caption := 'ʳ������_����������';
          dbgrd2.Columns[8].Title.Caption := '�������_����������';
        end;
        5:
        begin
          dbgrd2.Columns[0].Title.Caption := '����_����������';
        end;
        6:
        begin
          dbgrd2.Columns[0].Title.Caption := 'ʳ������_��������_�_���������';
        end;
        7:
        begin
          dbgrd2.Columns[0].Title.Caption := '̳�������_�������_�_���������';
        end;
        8:
        begin
          dbgrd2.Columns[0].Title.Caption := '�����������_�������_�_���������';
        end;
      end;
    end;
  end;
end;

end.

