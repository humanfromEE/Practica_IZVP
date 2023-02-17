unit UnitFrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,
  UnitDMVFP { Data Module для імпорту БД з Visual FoxPro },
  UnitDMforQueryAndReport { Data Module підключення для розрахунку даних для звітів },
  UnitDMforQuery { Data Module підключення для запитів },
  UnitFrmChildTypeProduct  { Дочірня форма "Види продуктів" },
  UnitFrmChildProduct  { Дочірня форма "Продукти" },
  UnitFrmChildTypeDish { Дочірня форма "Види страв" },
  UnitFrmChildDish { Дочірня форма "Страви" },
  UnitFrmChildProvider { Дочірня форма "Постачальник" },
  UnitFrmChildWorker { Дочірня форма "Працівник" },
  UnitFrmChildSupplyProduct { Дочірня форма "Постачання продуктів" },
  UnitFrmChildOrder { Дочірня форма "Замовлення" },
  UnitFormQueryViewer {Дочірня форма "Переглядач запитів"},
  ShellAPI, Grids, DBGrids, StdCtrls { Відкриття файлу довідки } ;

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
    MnTabReportsItemSupplyProductInJanuary2023: TMenuItem;
    MnTabReportsItemWorkSalary: TMenuItem;
    MnTabReportsItemMenuReport: TMenuItem;
    MnTabReportsItemMostCountOrder: TMenuItem;
    MnTabQueriesItemName_product_is_dish_head_product_query: TMenuItem;
    MnTabQueriesItemProviders_in_lviv_query: TMenuItem;

    procedure FormCreate(Sender: TObject);
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
    procedure MnTabReportsItemSupplyProductInJanuary2023Click(
      Sender: TObject);
    procedure MnTabReportsItemWorkSalaryClick(Sender: TObject);
    procedure MnTabReportsItemMenuReportClick(Sender: TObject);
    procedure MnTabReportsItemMostCountOrderClick(Sender: TObject);
    procedure MnTabQueriesItemName_product_is_dish_head_product_queryClick(
      Sender: TObject);
    procedure MnTabQueriesItemProviders_in_lviv_queryClick(Sender: TObject);

  private
    nameTfrmMain: string;
    procedure freeChildForm(pointerOnChildForm: TForm); // Знищення форми (дочірньої) через вказівник
    procedure freeAllChildForm(); // Знищення форм (дочірніх)
    procedure setFocusAndShowChildForm(pointerOnChildForm: TForm; nameFormForMB: string); // Встановлення фокусу і показ форми через вказівник
    procedure navigatorMenuCreateOrFocusWithShowChildForm(pointerOnChildForm: TForm; keyChildFormOnMenuTab: Integer); // Навігатор меню зі створенням чи фокусом з показом дочірніх форм
  public
    function getNameTfrmMain(): string; // Отримання строки з назвою форми
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  nameTfrmMain := 'Головна форма';
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  nameFormForMB: string;
  questionMB: string;
  titleMB: string;
begin
    nameFormForMB := nameTfrmMain;
    questionMB := 'Ви дійсно бажаєте закрити форму "' + nameFormForMB + '"?  - При закриті усі інші форми теж закриваються';
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

// Отримання строки з назвою форми
function TfrmMain.getNameTfrmMain(): string;
begin
  getNameTfrmMain := nameTfrmMain;
end;

// Знищення форми (дочірньої) через вказівник  
procedure TfrmMain.freeChildForm(pointerOnChildForm: TForm);
begin
  if pointerOnChildForm <> nil then
  begin
    pointerOnChildForm.Free;
  end;
end;

// Знищення форм (дочірніх)
procedure TfrmMain.freeAllChildForm();
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
    freeChildForm(FormQueryViewer);
  end;

  frmChildOrder := nil;
  frmChildSupplyProduct := nil;
  frmChildWorker := nil;
  frmChildProvider := nil;
  frmChildDish := nil;
  frmChildProduct := nil;
  frmChildTypeDish := nil;
  frmChildTypeProduct := nil;
  FormQueryViewer := nil;
end;

// Встановлення фокусу і показ форми через вказівник
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

// Навігатор меню зі створенням чи фокусом з показом дочірніх форм
procedure TfrmMain.navigatorMenuCreateOrFocusWithShowChildForm(pointerOnChildForm: TForm; keyChildFormOnMenuTab: Integer);
begin
  // Подрядковий номер згідно вкладки меню "Дані" Головної форми (починається з 0)
  if pointerOnChildForm = nil then
  begin
    case keyChildFormOnMenuTab of
      0:  frmChildTypeProduct := TfrmChildTypeProduct.Create(Application);
      1:  frmChildProduct := TfrmChildProduct.Create(Application);
      2:  frmChildTypeDish := TfrmChildTypeDish.Create(Application);
      3:  frmChildDish := TfrmChildDish.Create(Application);
      4:  frmChildProvider := TfrmChildProvider.Create(Application);
      5:  frmChildWorker := TfrmChildWorker.Create(Application);
      6:  frmChildSupplyProduct := TfrmChildSupplyProduct.Create(Application);
      7:  frmChildOrder := TfrmChildOrder.Create(Application);
      8:  FormQueryViewer := TFormQueryViewer.Create(Application);
    end;
  end
  else
  begin
    with frmMain do
    begin
      case keyChildFormOnMenuTab of
        0:  setFocusAndShowChildForm(frmChildTypeProduct, frmChildTypeProduct.getNameTfrmChildTypeProduct);
        1:  setFocusAndShowChildForm(frmChildProduct, frmChildProduct.getNameTfrmChildProduct);
        2:  setFocusAndShowChildForm(frmChildTypeDish, frmChildTypeDish.getNameTfrmChildTypeDish);
        3:  setFocusAndShowChildForm(frmChildDish, frmChildDish.getNameTfrmChildDish);
        4:  setFocusAndShowChildForm(frmChildProvider, frmChildProvider.getNameTfrmChildProvider);
        5:  setFocusAndShowChildForm(frmChildWorker, frmChildWorker.getNameTfrmChildWorker);
        6:  setFocusAndShowChildForm(frmChildSupplyProduct, frmChildSupplyProduct.getNameTfrmChildSupplyProduct);
        7:  setFocusAndShowChildForm(frmChildOrder, frmChildOrder.getNameTfrmChildOrder);
        8:  setFocusAndShowChildForm(FormQueryViewer, FormQueryViewer.getNameTFormQueryViewer);
      end;
    end;
  end;
end;

// Обробник меню, вкладка "Дані"
procedure TfrmMain.MnTabDataItemTypeProductClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(frmChildTypeProduct, 0);
end;

procedure TfrmMain.MnTabDataItemProductClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(frmChildProduct, 1);
end;

procedure TfrmMain.MnTabDataItemTypeDishClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(frmChildTypeDish, 2);
end;

procedure TfrmMain.MnTabDataItemDishClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(frmChildDish, 3);
end;

procedure TfrmMain.MnTabDataItemProviderClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(frmChildProvider, 4);
end;

procedure TfrmMain.MnTabDataItemWorkerClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(frmChildWorker, 5);
end;

procedure TfrmMain.MnTabDataItemSupplyProductClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(frmChildSupplyProduct, 6);
end;

procedure TfrmMain.MnTabDataItemOrderClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(frmChildOrder, 7);
end;

// Обробник меню, команда "Закрити ативні вікна"
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
    frmMain.freeAllChildForm;
  end;
end;

// Обробник меню, команда "Довідка"
procedure TfrmMain.MnHelpClick(Sender: TObject);
begin
  ShellExecute(0, PChar('Open'), PChar('help_project_delphi7.chm'), nil, nil, SW_NORMAL);
end;

procedure TfrmMain.MnTabReportsItemSupplyProductInJanuary2023Click(Sender: TObject);
begin
  DMforQureryAndReport.reportSupplyProductInJanuary2023.ShowReport(True);
end;

procedure TfrmMain.MnTabReportsItemWorkSalaryClick(Sender: TObject);
begin
  DMforQureryAndReport.reportWorkerSalary.ShowReport(True);
end;

procedure TfrmMain.MnTabReportsItemMenuReportClick(Sender: TObject);
begin
  DMforQureryAndReport.menuReport.ShowReport(True);
end;

procedure TfrmMain.MnTabReportsItemMostCountOrderClick(Sender: TObject);
begin
  DMforQureryAndReport.reportMostCounterOrder.ShowReport(True);
end;

procedure TfrmMain.MnTabQueriesItemName_product_is_dish_head_product_queryClick(
  Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(FormQueryViewer, 8);
  FormQueryViewer.Caption := FormQueryViewer.getNameTFormQueryViewer + ': "Назва продукт, де у страві він є головним"';
  FormQueryViewer.DBGrid1.DataSource := DMforQuery.dsName_product_is_dish_head_product_query;
  DMforQuery.qryName_product_is_dish_head_product_query.Close;
  DMforQuery.qryName_product_is_dish_head_product_query.Open;
end;

procedure TfrmMain.MnTabQueriesItemProviders_in_lviv_queryClick(Sender: TObject);
begin
  navigatorMenuCreateOrFocusWithShowChildForm(FormQueryViewer, 8);
  FormQueryViewer.Caption := FormQueryViewer.getNameTFormQueryViewer + ': "Постачальники у Львові"';
  FormQueryViewer.DBGrid1.DataSource := DMforQuery.dsProviders_in_lviv_query;
  DMforQuery.qryProviders_in_lviv_query.Close;
  DMforQuery.qryProviders_in_lviv_query.Open;
end;

end.
