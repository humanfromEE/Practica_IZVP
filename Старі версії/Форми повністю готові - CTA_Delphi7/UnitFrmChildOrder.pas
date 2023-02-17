unit UnitFrmChildOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DateUtils,
  UnitDMVFP { Data Module ��� ������� �� � Visual FoxPro },
  StdCtrls, ExtCtrls, DBCtrls, ComCtrls;
  
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
    btnClearInputField: TButton;
    btnGoToRecord: TButton;
    edtInputCodeRecord: TEdit;
    btnGoToRecordWithCodeDish: TButton;
    btnGoToRecordWithCodeWorker: TButton;
    edtInputCodeDishRecord: TEdit;
    edtInputCodeWorkerRecord: TEdit;
    lblCodeRecord: TLabel;
    lblCodeWorker: TLabel;
    lblCodeDish: TLabel;
    btnGoToRecordWithWorkerAndDishRecord: TButton;
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
  btnClearFormClick(Sender);
  btnClearInputFieldClick(Sender);
end;

procedure TfrmChildOrder.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildOrder;
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
      btnClearInputFieldClick(Sender);
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
  end
  else
  begin
    Application.MessageBox(PAnsiChar('������ �������� �������� � ���� �����'), PAnsiChar('����������� �����!'), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildOrder.btnClearInputFieldClick(Sender: TObject);
begin
  if not DMVFP.TblDBorder.Eof then
  begin
    DMVFP.TblDBorder.First;
  end;
  edtInputCodeRecord.Text := '';
  edtInputCodeDishRecord.Text := '';
  edtInputCodeWorkerRecord.Text := '';
  dbgrd1.DataSource := DMVFP.DsDBorder;
end;

procedure TfrmChildOrder.btnGoToRecordClick(Sender: TObject);
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
      if not TblDBorder.Eof then
      begin
        TblDBorder.First;
        while not TblDBorder.Eof do
        begin
          if TblDBorder['code_o'] = codeForSearch then
          begin
            Break;
          end;
          TblDBorder.Next;
        end;

        // ���� ����� �� ��������
        if TblDBorder.Eof then
        begin
          TblDBorder.First;
          questionMB := '��� �� �������� �� ����� "' + codeForSearch + '", �������� ���������� ����� (��� � ������ "�����o", �� � - �� �����)';
          titleMB := 'ͳ���� �� ��������!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBorder;
  end
  else
  begin
    questionMB := '������ ��� ���������� � �������� ���� �����';
    titleMB := '����������� �����!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildOrder.btnGoToRecordWithCodeDishClick(Sender: TObject);
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
      if not TblDBorder.Eof then
      begin
        TblDBorder.First;
        while not TblDBorder.Eof do
        begin
          if (TblDBorder['code_o'] = codeForSearch) and (TblDBorder['code_d_o'] = codeDishForSearch) then
          begin
            Break;
          end;
          TblDBorder.Next;
        end;

        // ���� ����� �� ��������
        if TblDBorder.Eof then
        begin
          TblDBorder.First;
          questionMB := '��� �� �������� �� ������: "' + codeForSearch + '", "' + codeDishForSearch + '", �������� ���������� ����� (��� � ������: ���������� "XXXXXo"; ������ "���d", �� � - �� �����)';
          titleMB := 'ͳ���� �� ��������!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBorder;
  end
  else
  begin
    questionMB := '������ ��� ���������� � ��� ������ � ������� ���� �����';
    titleMB := '����������� �����!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildOrder.btnGoToRecordWithCodeWorkerClick(Sender: TObject);
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
      if not TblDBorder.Eof then
      begin
        TblDBorder.First;
        while not TblDBorder.Eof do
        begin
          if (TblDBorder['code_o'] = codeForSearch) and (TblDBorder['code_w_o'] = codeWorkerForSearch) then
          begin
            Break;
          end;
          TblDBorder.Next;
        end;

        // ���� ����� �� ��������
        if TblDBorder.Eof then
        begin
          TblDBorder.First;
          questionMB := '��� �� �������� �� ������: "' + codeForSearch + '", "' + codeWorkerForSearch + '", �������� ���������� ����� (��� � ������: ���������� "XXXXXo"; ���������� "���w", �� � - �� �����)';
          titleMB := 'ͳ���� �� ��������!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBorder;
  end
  else
  begin
    questionMB := '������ ��� ���������� � ��� ���������� � ������� ���� �����';
    titleMB := '����������� �����!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

procedure TfrmChildOrder.btnGoToRecordWithWorkerAndDishRecordClick(
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
      if not TblDBorder.Eof then
      begin
        TblDBorder.First;
        while not TblDBorder.Eof do
        begin
          if (TblDBorder['code_o'] = codeForSearch) and (TblDBorder['code_d_o'] = codeDishForSearch) and (TblDBorder['code_w_o'] = codeWorkerForSearch) then
          begin
            Break;
          end;
          TblDBorder.Next;
        end;

        // ���� ����� �� ��������
        if TblDBorder.Eof then
        begin
          TblDBorder.First;
          questionMB := '��� �� �������� �� ������: "' + codeForSearch + '", "' + codeDishForSearch + '", "' + codeWorkerForSearch + '", �������� ���������� ����� (��� � ������: ���������� "XXXXXo"; ������ "���d"; ���������� "���w", �� � - �� �����)';
          titleMB := 'ͳ���� �� ��������!';
          Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
        end;
      end;
    end;
    dbgrd1.DataSource := DMVFP.DsDBorder;
  end
  else
  begin
    questionMB := '������ ��� ����������, ��� ������ � ��� ���������� � ������� ���� �����';
    titleMB := '����������� �����!';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
  end;
end;

end.
