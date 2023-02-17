unit UnitFrmChildSupplyProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildSupplyProduct = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
end;

procedure TfrmChildSupplyProduct.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildSupplyProduct;
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
      frmChildSupplyProduct := nil;
    end;
end;

function TfrmChildSupplyProduct.getNameTfrmChildSupplyProduct(): string;
begin
  getNameTfrmChildSupplyProduct := nameTfrmChildSupplyProduct;
end;

end.

