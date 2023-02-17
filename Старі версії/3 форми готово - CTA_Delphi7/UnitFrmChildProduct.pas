unit UnitFrmChildProduct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro };

type
  TfrmChildProduct = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    nameTfrmChildProduct: string;
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
end;

procedure TfrmChildProduct.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildProduct;
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
      frmChildProduct := nil;
    end;
end;

function TfrmChildProduct.getNameTfrmChildProduct(): string;
begin
  getNameTfrmChildProduct := nameTfrmChildProduct;
end;

end.
