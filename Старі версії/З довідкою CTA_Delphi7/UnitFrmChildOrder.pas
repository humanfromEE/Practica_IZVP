unit UnitFrmChildOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildOrder = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
  nameTfrmChildOrder := 'Замовлення';
end;

procedure TfrmChildOrder.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildOrder;
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
      frmChildOrder := nil;
    end;
end;

function TfrmChildOrder.getNameTfrmChildOrder(): string;
begin
  getNameTfrmChildOrder := nameTfrmChildOrder;
end;

end.

