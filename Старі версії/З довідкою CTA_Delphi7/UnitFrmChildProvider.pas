unit UnitFrmChildProvider;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,
  UnitDMVFP { Data Module ��� ������� �� � Visual FoxPro };
  
type
  TfrmChildProvider = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    nameTfrmChildProvider: string;
  public
    function getNameTfrmChildProvider(): string;
  end;

var
  frmChildProvider: TfrmChildProvider;

implementation

{$R *.dfm}

procedure TfrmChildProvider.FormCreate(Sender: TObject);
begin
  nameTfrmChildProvider := '�������������';
end;

procedure TfrmChildProvider.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmChildProvider;
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
      frmChildProvider := nil;
    end;
end;

function TfrmChildProvider.getNameTfrmChildProvider(): string;
begin
  getNameTfrmChildProvider := nameTfrmChildProvider;
end;

end.

