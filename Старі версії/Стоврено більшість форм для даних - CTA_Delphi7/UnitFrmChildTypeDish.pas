unit UnitFrmChildTypeDish;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildTypeDish = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    nameTfrmChildTypeDish: string;
  public
    function getNameTfrmChildTypeDish(): string;
  end;

var
  frmChildTypeDish: TfrmChildTypeDish;

implementation

{$R *.dfm}

procedure TfrmChildTypeDish.FormCreate(Sender: TObject);
begin
  nameTfrmChildTypeDish := 'Види страв';
end;

procedure TfrmChildTypeDish.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildTypeDish;
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
      frmChildTypeDish := nil;
    end;
end;

function TfrmChildTypeDish.getNameTfrmChildTypeDish(): string;
begin
  getNameTfrmChildTypeDish := nameTfrmChildTypeDish;
end;

end.

