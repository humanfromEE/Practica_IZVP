object frmMain: TfrmMain
  Left = 326
  Top = 134
  Width = 834
  Height = 576
  Caption = #1054#1073#1083#1110#1082' '#1090#1086#1074#1072#1088#1086#1086#1073#1110#1075#1091' '#1082#1072#1092#1077
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  HelpFile = 'help_project_delphi7.chm'
  Menu = menuFrmMain
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object menuFrmMain: TMainMenu
    Left = 8
    Top = 8
    object MnTabData: TMenuItem
      Caption = #1044#1072#1085#1110
      object MnTabDataItemTypeProduct: TMenuItem
        Caption = #1042#1080#1076#1080' '#1087#1088#1086#1076#1091#1082#1090#1110#1074
        OnClick = MnTabDataItemTypeProductClick
      end
      object MnTabDataItemProduct: TMenuItem
        Caption = #1055#1088#1086#1076#1091#1082#1090#1080
        OnClick = MnTabDataItemProductClick
      end
      object MnTabDataItemTypeDish: TMenuItem
        Caption = #1042#1080#1076#1080' '#1089#1090#1088#1072#1074
        OnClick = MnTabDataItemTypeDishClick
      end
      object MnTabDataItemDish: TMenuItem
        Caption = #1057#1090#1088#1072#1074#1080
        OnClick = MnTabDataItemDishClick
      end
      object MnTabDataItemProvider: TMenuItem
        Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1080
        OnClick = MnTabDataItemProviderClick
      end
      object MnTabDataItemWorker: TMenuItem
        Caption = #1055#1088#1072#1094#1110#1074#1085#1080#1082#1080
        OnClick = MnTabDataItemWorkerClick
      end
      object MnTabDataItemSupplyProduct: TMenuItem
        Caption = #1055#1086#1089#1090#1072#1095#1072#1085#1085#1103' '#1087#1088#1086#1076#1091#1082#1090#1110#1074
        OnClick = MnTabDataItemSupplyProductClick
      end
      object MnTabDataItemOrder: TMenuItem
        Caption = #1047#1072#1084#1086#1074#1083#1077#1085#1085#1103
        OnClick = MnTabDataItemOrderClick
      end
    end
    object MnTabQueries: TMenuItem
      Caption = #1047#1072#1087#1080#1090#1080
    end
    object MnTabReports: TMenuItem
      Caption = #1047#1074#1110#1090#1080
    end
    object MnHelp: TMenuItem
      Caption = #1044#1086#1074#1110#1076#1082#1072
      OnClick = MnHelpClick
    end
    object MnCloseActiveForms: TMenuItem
      Caption = #1047#1072#1082#1088#1080#1090#1080' '#1072#1082#1090#1080#1074#1085#1110' '#1092#1086#1088#1084#1080
      OnClick = MnCloseActiveFormsClick
    end
  end
end
