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
  UnitFrmChildOrder { Дочірня форма "Замовлення" };

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

    // Обробник меню, владка "Дані"
    procedure MnTabDataItemTypeProductClick(Sender: TObject);
    procedure MnTabDataItemProductClick(Sender: TObject);
    procedure MnTabDataItemTypeDishClick(Sender: TObject);
    procedure MnTabDataItemDishClick(Sender: TObject);
    procedure MnTabDataItemProviderClick(Sender: TObject);
    procedure MnTabDataItemWorkerClick(Sender: TObject);
    procedure MnTabDataItemSupplyProductClick(Sender: TObject);
    procedure MnTabDataItemOrderClick(Sender: TObject);
    procedure MnCloseActiveFormsClick(Sender: TObject);

  private
    procedure freeChildForm( pointerOnChildForm: TForm);
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
    nameFormForMB := frmChildTypeProduct.getNameTfrmChildTypeProduct;
    questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '"';
    titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
    frmChildTypeProduct.SetFocus;
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
    nameFormForMB := frmChildProduct.getNameTfrmChildProduct;
    questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '"';
    titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
    frmChildProduct.SetFocus;
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
    nameFormForMB := frmChildTypeDish.getNameTfrmChildTypeDish;
    questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '"';
    titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
    frmChildTypeDish.SetFocus;
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
    nameFormForMB := frmChildDish.getNameTfrmChildDish;
    questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '"';
    titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
    frmChildDish.SetFocus;
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
    nameFormForMB := frmChildProvider.getNameTfrmChildProvider;
    questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '"';
    titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
    frmChildProvider.SetFocus;
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
    nameFormForMB := frmChildWorker.getNameTfrmChildWorker;
    questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '"';
    titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
    frmChildWorker.SetFocus;
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
    nameFormForMB := frmChildSupplyProduct.getNameTfrmChildSupplyProduct;
    questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '"';
    titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
    frmChildSupplyProduct.SetFocus;
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
    nameFormForMB := frmChildOrder.getNameTfrmChildOrder;
    questionMB := 'Фокус переміститься на форму "' + nameFormForMB + '"';
    titleMB := 'Повідомлення, що форма "' + nameFormForMB + '" є відкритою';
    Application.MessageBox(PAnsiChar(questionMB), PAnsiChar(titleMB), MB_OK Or MB_ICONINFORMATION);
    frmChildOrder.SetFocus;
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

end.
