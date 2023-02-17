unit UnitFrmChildWorker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro };
  
type
  TfrmChildWorker = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    nameTfrmChildWorker: string;
  public
    function getNameTfrmChildWorker(): string;
  end;

var
  frmChildWorker: TfrmChildWorker;

implementation

{$R *.dfm}

procedure TfrmChildWorker.FormCreate(Sender: TObject);
begin
  nameTfrmChildWorker := 'Працівники';
end;

procedure TfrmChildWorker.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildWorker;
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
      frmChildWorker := nil;
    end;
end;

function TfrmChildWorker.getNameTfrmChildWorker(): string;
begin
  getNameTfrmChildWorker := nameTfrmChildWorker;
end;

end.

