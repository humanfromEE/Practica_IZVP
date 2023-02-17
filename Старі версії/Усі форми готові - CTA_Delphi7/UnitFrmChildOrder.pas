unit UnitFrmChildOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DateUtils,
  UnitDMVFP, StdCtrls, ExtCtrls, DBCtrls, ComCtrls { Data Module ��� ������� �� � Visual FoxPro };
  
type
  TfrmChildOrder = class(TForm)
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
    nameTfrmChildOrder: string;
  public
    function getNameTfrmChildOrder(): string;
  end;

var
  frmChildOrder: TfrmChildOrder;

implementation

{$R *.dfm}

procedure TfrmChildOrder.FormCreate(Sender: TObject);
begin
  nameTfrmChildOrder := '����������';
end;

procedure TfrmChildOrder.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildOrder;
    questionMB := '�� ����� ������ ������� ����� "' + nameFormForMB + '"';
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
      frmChildOrder := nil;
    end;
end;

function TfrmChildOrder.getNameTfrmChildOrder(): string;
begin
  getNameTfrmChildOrder := nameTfrmChildOrder;
end;

procedure TfrmChildOrder.btnClearFormClick(Sender: TObject);
begin
  DMVFP.qryDBorder.Close;
  DMVFP.qryDBorder.SQL.Clear;
  edtInputField.Text := '';
  rgCategorySearch.ItemIndex := 0;
end;

procedure TfrmChildOrder.btnSearchDataClick(Sender: TObject);
var
  strExpression: string;
  strSQLExpression: string;
  arrayNameFields: array[0..8] of string;
  isQueryRun: Boolean;
begin
  isQueryRun := False;

  arrayNameFields[0] := 'code_o';
  arrayNameFields[1] := 'code_d_o';
  arrayNameFields[2] := 'code_w_o';
  arrayNameFields[3] := 'name_d';
  arrayNameFields[4] := 'fullname_w';
  arrayNameFields[5] := 'code_o';
  arrayNameFields[6] := 'code_o';
  arrayNameFields[7] := 'code_o';
  arrayNameFields[8] := 'code_o';

  if edtInputField.Text <> '' then
  begin
    case (rgCategorySearch.ItemIndex) of
      0, 1, 2, 3, 4:
      begin
        strSQLExpression := 'SELECT code_o, code_w, fullname_w, code_d, name_d, price_d FROM order_table INNTER JOIN dish_table ON code_d_o = code_d INNER JOIN worker_table ON code_w_o = code_w WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' LIKE "%' + edtInputField.Text + '%"';
        isQueryRun := True;
      end;
      5:
      begin
        strSQLExpression := 'SELECT SUM(price_d) FROM order_table INNER JOIN dish_table ON code_d_o = code_d WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' = "' + edtInputField.Text + '"';
        isQueryRun := True;
      end;
      6:
      begin
        strSQLExpression := 'SELECT COUNT(code_o) FROM order_table WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' = "' + edtInputField.Text + '"';
        isQueryRun := True;
      end;
      7:
      begin
        strSQLExpression := 'SELECT MIN(price_d) FROM order_table INNER JOIN dish_table ON code_d_o = code_d WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' = "' + edtInputField.Text + '" GROUP BY code_o';
        isQueryRun := True;
      end;
      8:
      begin
        strSQLExpression := 'SELECT MAX(price_d) FROM order_table INNER JOIN dish_table ON code_d_o = code_d WHERE ';
        strExpression := arrayNameFields[rgCategorySearch.ItemIndex] + ' = "' + edtInputField.Text + '" GROUP BY code_o';
        isQueryRun := True;
      end;
    end;

    with DMVFP do
    begin
      qryDBorder.Close;
      qryDBorder.SQL.Clear;
      if (isQueryRun) then
      begin
        qryDBorder.SQL.Add(strSQLExpression + strExpression);
        qryDBorder.Open;
      end;

      case (rgCategorySearch.ItemIndex) of
        0, 1, 2, 3, 4:
        begin
          dbgrd2.Columns[0].Title.Caption := '���';
          dbgrd2.Columns[1].Title.Caption := '���_����������';
          dbgrd2.Columns[2].Title.Caption := 'ϲ�_����������';
          dbgrd2.Columns[3].Title.Caption := '���_������';
          dbgrd2.Columns[4].Title.Caption := '�����_������';
          dbgrd2.Columns[5].Title.Caption := 'ֳ��_������';
        end;
        5:
        begin
          dbgrd2.Columns[0].Title.Caption := '����_����������';
        end;
        6:
        begin
          dbgrd2.Columns[0].Title.Caption := 'ʳ������_�����_�_���������';
        end;
        7:
        begin
          dbgrd2.Columns[0].Title.Caption := '̳�������_����_������_�_���������';
        end;
        8:
        begin
          dbgrd2.Columns[0].Title.Caption := '�����������_����_������_�_���������';
        end;
      end;
    end;
  end;
end;

end.

