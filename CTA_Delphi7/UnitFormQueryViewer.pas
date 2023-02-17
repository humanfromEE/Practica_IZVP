unit UnitFormQueryViewer;

interface

uses
  UnitDMforQuery,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids;

type
  TFormQueryViewer = class(TForm)
    DBGrid1: TDBGrid;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    nameTFormQueryViewer: string;
  public
    function getNameTFormQueryViewer(): string;
  end;

var
  FormQueryViewer: TFormQueryViewer;

implementation

{$R *.dfm}

procedure TFormQueryViewer.FormCreate(Sender: TObject);
begin
  nameTFormQueryViewer := 'Переглядач запитів';
end;

procedure TFormQueryViewer.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTFormQueryViewer;
    questionMB := 'Ви дійсно бажаєте закрити форму "' + nameFormForMB + '"?';
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
      FormQueryViewer.Caption := nameTFormQueryViewer;
      DMforQuery.qryName_product_is_dish_head_product_query.Close;
      DMforQuery.qryProviders_in_lviv_query.Close;
      Action := caFree;
      FormQueryViewer := nil;
    end;
end;

function TFormQueryViewer.getNameTFormQueryViewer(): string;
begin
  getNameTFormQueryViewer := nameTFormQueryViewer;
end;

end.
