unit UnitFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro },
  UnitFrmChildTypeProduct  { Дочірня форма "Види продуктів" },
  UnitFrmChildProduct  { Дочірня форма "Продукти" },
  UnitFrmChildTypeDish { Дочірня форма "Види страв" },
  UnitFrmChildDish { Дочірня форма "Страви" },
  UnitFrmChildProvider { Дочірня форма "Постачальник" },
  UnitFrmChildWorker { Дочірня форма "Працівник" },
  UnitFrmChildSupplyProduct { Дочірня форма "Постачання продуктів" },
  UnitFrmChildOrder { Дочірня форма "Замовлення" },
  ShellAPI { Відкриття файлу довідки } ;

type
  TfrmMain = class(TForm)
    // Клавіші меню
    menuFrmMain: TMainMenu;
      MnTabData: TMenuItem;
        MnTabDataItemTypeProduct: TMenuItem;
        MnTabDataItemTypeDish: TMenuItem;
        MnTabDataItemDish: TMenuItem;
        MnTabDataItemProduct: TMenuItem;
        MnTabDataItemProvider: TMenuItem;
        MnTabDataItemWorker: TMenuItem;
        MnTabDataItemSupplyProduct: TMenuItem;
        MnTabDataItemOrder: TMenuItem;
      MnTabQueries: TMenuItem;
      MnTabReports: TMenuItem;
      MnHelp: TMenuItem;
      MnCloseActiveForms: TMenuItem;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    // Обробник меню, вкладка "Дані"
    procedure MnTabDataItemTypeProductClick(Sender: TObject);
    procedure MnTabDataItemProductClick(Sender: TObject);
    procedure MnTabDataItemTypeDishClick(Sender: TObject);
    procedure MnTabDataItemDishClick(Sender: TObject);
    procedure MnTabDataItemProviderClick(Sender: TObject);
    procedure MnTabDataItemWorkerClick(Sender: TObject);
    procedure MnTabDataItemSupplyProductClick(Sender: TObject);
    procedure MnTabDataItemOrderClick(Sender: TObject);

    // Обробник меню, команда "Закрити ативні вікна"
    procedure MnCloseActiveFormsClick(Sender: TObject);
    // Обробник меню, команда "Довідка"
    procedure MnHelpClick(Sender: TObject);

  private
    procedure freeChildForm(pointerOnChildForm: TForm);
    procedure setFocusAndShowChildForm(pointerOnChildForm: TForm; nameFormForMB: string);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := 'Головна форма';
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
    end;
end;

procedure TfrmMain.setFocusAndShowChildForm(pointerOnChildForm: TForm; nameFormForMB: string);
var
  questionMB: string;
  titleMB: string;
begin
  if pointerOnChildForm <> nil then
  begin
      questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '" й буде першою на екрані монітора';
      titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
      Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
      pointerOnChildForm.Show;
      pointerOnChildForm.SetFocus;
      pointerOnChildForm.Position := poMainFormCenter;
  end;
end;

procedure TfrmMain.MnTabDataItemTypeProductClick(Sender: TObject);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
  if frmChildTypeProduct = nil then
  begin
    frmChildTypeProduct := TfrmChildTypeProduct.Create(Application);
  end
  else
  begin
    setFocusAndShowChildForm(frmChildTypeProduct, frmChildTypeProduct.getNameTfrmChildTypeProduct);
  end;
end;

procedure TfrmMain.MnTabDataItemProductClick(Sender: TObject);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
  if frmChildProduct = nil then
  begin
    frmChildProduct := TfrmChildProduct.Create(Application);
  end
  else
  begin
    setFocusAndShowChildForm(frmChildProduct, frmChildProduct.getNameTfrmChildProduct);
  end;
end;

procedure TfrmMain.MnTabDataItemTypeDishClick(Sender: TObject);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
  if frmChildTypeDish = nil then
  begin
    frmChildTypeDish := TfrmChildTypeDish.Create(Application);
  end
  else
  begin
    setFocusAndShowChildForm(frmChildTypeDish, frmChildTypeDish.getNameTfrmChildTypeDish);
  end;
end;

procedure TfrmMain.MnTabDataItemDishClick(Sender: TObject);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
  if frmChildDish = nil then
  begin
    frmChildDish := TfrmChildDish.Create(Application);
  end
  else
  begin
    setFocusAndShowChildForm(frmChildDish, frmChildDish.getNameTfrmChildDish);
  end;
end;

procedure TfrmMain.MnTabDataItemProviderClick(Sender: TObject);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
  if frmChildProvider = nil then
  begin
    frmChildProvider := TfrmChildProvider.Create(Application);
  end
  else
  begin
    setFocusAndShowChildForm(frmChildProvider, frmChildProvider.getNameTfrmChildProvider);
  end;
end;

procedure TfrmMain.MnTabDataItemWorkerClick(Sender: TObject);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
  if frmChildWorker = nil then
  begin
    frmChildWorker := TfrmChildWorker.Create(Application);
  end
  else
  begin
    setFocusAndShowChildForm(frmChildWorker, frmChildWorker.getNameTfrmChildWorker);
  end;
end;

procedure TfrmMain.MnTabDataItemSupplyProductClick(Sender: TObject);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
  if frmChildSupplyProduct = nil then
  begin
    frmChildSupplyProduct := TfrmChildSupplyProduct.Create(Application);
  end
  else
  begin
    setFocusAndShowChildForm(frmChildSupplyProduct, frmChildSupplyProduct.getNameTfrmChildSupplyProduct);
  end;
end;

procedure TfrmMain.MnTabDataItemOrderClick(Sender: TObject);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
  if frmChildOrder = nil then
  begin
    frmChildOrder := TfrmChildOrder.Create(Application);
  end
  else
  begin
    setFocusAndShowChildForm(frmChildOrder, frmChildOrder.getNameTfrmChildOrder);
  end;
end;

procedure TfrmMain.MnCloseActiveFormsClick(Sender: TObject);
var
  questionMB: string;
  titleMB: string;
begin
  questionMB := 'Ви дійсно бажаєте закрити усі активні форми?';
  titleMB := 'Закриття усіх активних форм';
  if Application.MessageBox(
    PAnsiChar(questionMB),
    PAnsiChar(titleMB),
    MB_YESNO Or MB_ICONQUESTION Or MB_DEFBUTTON2
  ) = IDYES then
  begin
    with frmMain do
    begin
      freeChildForm(frmChildOrder);
      freeChildForm(frmChildSupplyProduct);
      freeChildForm(frmChildWorker);
      freeChildForm(frmChildProvider);
      freeChildForm(frmChildDish);
      freeChildForm(frmChildProduct);
      freeChildForm(frmChildTypeDish);
      freeChildForm(frmChildTypeProduct);
    end;

    frmChildOrder := nil;
    frmChildSupplyProduct := nil;
    frmChildWorker := nil;
    frmChildProvider := nil;
    frmChildDish := nil;
    frmChildProduct := nil;
    frmChildTypeDish := nil;
    frmChildTypeProduct := nil;
  end;
end;

procedure TfrmMain.freeChildForm(pointerOnChildForm: TForm);
begin
  if pointerOnChildForm <> nil then
  begin
    pointerOnChildForm.Free;
  end;
end;

procedure TfrmMain.MnHelpClick(Sender: TObject);
begin
  ShellExecute(0, PChar('Open'), PChar('help_project_delphi7.chm'), nil, nil, SW_NORMAL);
end;

end.
