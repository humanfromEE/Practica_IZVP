unit UnitFrmChildDish;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildDish = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    nameTfrmChildDish: string;
  public
    function getNameTfrmChildDish(): string;
  end;

var
  frmChildDish: TfrmChildDish;

implementation

{$R *.dfm}

procedure TfrmChildDish.FormCreate(Sender: TObject);
begin
  nameTfrmChildDish := 'Страви';
end;

procedure TfrmChildDish.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildDish;
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
      frmChildDish := nil;
    end;
end;

function TfrmChildDish.getNameTfrmChildDish(): string;
begin
  getNameTfrmChildDish := nameTfrmChildDish;
end;

end.

