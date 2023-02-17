unit UnitFrmChildTypeProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module ��� ������� �� � Visual FoxPro };
  
type
  TfrmChildTypeProduct = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  nameTfrmChildTypeProduct := '���� ��������';
end;

procedure TfrmChildTypeProduct.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildTypeProduct;
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
      Action := caFree;
      frmChildTypeProduct := nil;
    end;
end;

function TfrmChildTypeProduct.getNameTfrmChildTypeProduct(): string;
begin
  getNameTfrmChildTypeProduct := nameTfrmChildTypeProduct;
end;

end.
