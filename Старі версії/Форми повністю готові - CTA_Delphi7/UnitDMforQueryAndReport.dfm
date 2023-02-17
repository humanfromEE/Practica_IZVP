object DMforQureryAndReport: TDMforQureryAndReport
  OldCreateOrder = False
  Left = 461
  Top = 177
  Height = 462
  Width = 896
  object qryForReportSupplyProductInJanuary2023: TADOQuery
    Connection = DMVFP.ADOFoxProDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT code_sp AS "'#1050#1086#1076'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103'", name_p AS "'#1053#1072#1079#1074#1072'_'#1087#1088#1086#1076#1091#1082#1090#1091'", ' +
        'price_p AS "'#1062#1110#1085#1072'_'#1087#1088#1086#1076#1091#1082#1090#1091'", count_sp AS "'#1050#1110#1083#1100#1082#1110#1089#1090#1100'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103'", ' +
        'ROUND(price_p * count_sp, 2)  AS "'#1042#1072#1088#1090#1110#1089#1090#1100'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103'", date_sp ' +
        ' AS "'#1044#1072#1090#1072'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103'" FROM supply_product_table INNER JOIN produ' +
        'ct_table ON code_p_sp = code_p WHERE date_sp >= DATE(2023, 01, 0' +
        '1) AND date_sp < DATE(2023, 02, 01)')
    Left = 144
    Top = 64
  end
  object DsFrxQryForReportSupplyProductInJanuary2023: TfrxDBDataset
    UserName = 'DsFrxQryForReportSupplyProductInJanuary2023'
    CloseDataSource = False
    DataSet = qryForReportSupplyProductInJanuary2023
    BCDToCurrency = False
    Left = 400
    Top = 64
  end
  object qryForReportWorkerSalary: TADOQuery
    Connection = DMVFP.ADOFoxProDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT code_w, fullname_w, number_w, salary_w FROM worker_table ' +
        'ORDER BY fullname_w')
    Left = 144
    Top = 136
  end
  object DsFrxQryForReportWorkerSalary: TfrxDBDataset
    UserName = 'DsFrxQryForReportWorkerSalary'
    CloseDataSource = False
    DataSet = qryForReportWorkerSalary
    BCDToCurrency = False
    Left = 400
    Top = 136
  end
  object qryForReportMostCountOrder: TADOQuery
    Connection = DMVFP.ADOFoxProDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT code_o, fullname_w, SUM(price_d), MIN(price_d), MAX(price' +
        '_d), COUNT(code_o), date_o FROM order_table INNER JOIN worker_ta' +
        'ble ON code_w_o = code_w INNER JOIN dish_table ON code_d_o = cod' +
        'e_d GROUP BY code_o, fullname_w, date_o HAVING COUNT(code_o) >= ' +
        '4 ORDER BY 6')
    Left = 144
    Top = 224
  end
  object DsFrxQryForReportMostCountOrder: TfrxDBDataset
    UserName = 'DsFrxQryForReportMostCountOrder'
    CloseDataSource = False
    DataSet = qryForReportMostCountOrder
    BCDToCurrency = False
    Left = 400
    Top = 224
  end
  object qryForMenuReport: TADOQuery
    Connection = DMVFP.ADOFoxProDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT name_td, name_d, name_p, composition_d, weight_d, price_d' +
        ' FROM dish_table INNER JOIN product_table ON code_p_d = code_p I' +
        'NNER JOIN type_dish_table ON code_td_d = code_td ORDER BY name_t' +
        'd')
    Left = 144
    Top = 304
  end
  object DsFrxQryForMenuReport: TfrxDBDataset
    UserName = 'DsFrxQryForMenuReport'
    CloseDataSource = False
    DataSet = qryForMenuReport
    BCDToCurrency = False
    Left = 400
    Top = 304
  end
  object reportSupplyProductInJanuary2023: TfrxReport
    Version = '5.3.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44974.172842893500000000
    ReportOptions.LastChange = 44974.172842893500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 648
    Top = 64
    Datasets = <
      item
        DataSet = DsFrxQryForReportSupplyProductInJanuary2023
        DataSetName = 'DsFrxQryForReportSupplyProductInJanuary2023'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clGray
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 16053492
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clGray
          HAlign = haCenter
          Memo.UTF8 = (
            
              #1056#8212#1056#8217#1056#8224#1056#1118' '#1056#1119#1056#1115#1056#1038#1056#1118#1056#1106#1056#167#1056#1106#1056#1116#1056#1116#1056#1031' '#1056#1119#1056#160#1056#1115#1056#8221#1056#1032#1056#1113#1056#1118#1056#8224#1056#8217' '#1056#8212#1056#1106' '#1056#1038#1056#8224#1056#167#1056#8226#1056#1116 +
              #1056#172' 2023')
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 212.110236220000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#183#1056#1030#1056#176' '#1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8218#1057#1107)
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 212.110236220000000000
          Width = 99.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            #1056#166#1057#8211#1056#1029#1056#176' '#1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8218#1057#1107)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 311.110236220000000000
          Width = 147.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            #1056#1113#1057#8211#1056#187#1057#1034#1056#1108#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 458.110236220000000000
          Width = 143.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            #1056#8217#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039)
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 601.110236220000000000
          Width = 117.000000000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039)
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        Condition = 'DsFrxQryForReportSupplyProductInJanuary2023."'#1082#1086#1076'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103'"'
        object Memo8: TfrxMemoView
          Align = baWidth
          Left = 113.385900000000000000
          Width = 604.724800000000000000
          Height = 22.677180000000000000
          DataField = #1082#1086#1076'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
          DataSet = DsFrxQryForReportSupplyProductInJanuary2023
          DataSetName = 'DsFrxQryForReportSupplyProductInJanuary2023'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 16053492
          Memo.UTF8 = (
            
              '[DsFrxQryForReportSupplyProductInJanuary2023."'#1056#1108#1056#1109#1056#1169'_'#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057 +
              #8225#1056#176#1056#1029#1056#1029#1057#1039'"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
        object Memo20: TfrxMemoView
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          Fill.BackColor = 16053492
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039':')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = DsFrxQryForReportSupplyProductInJanuary2023
        DataSetName = 'DsFrxQryForReportSupplyProductInJanuary2023'
        RowCount = 0
        object Memo9: TfrxMemoView
          Width = 212.110236220000000000
          Height = 18.897650000000000000
          DataField = #1085#1072#1079#1074#1072'_'#1087#1088#1086#1076#1091#1082#1090#1091
          DataSet = DsFrxQryForReportSupplyProductInJanuary2023
          DataSetName = 'DsFrxQryForReportSupplyProductInJanuary2023'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[DsFrxQryForReportSupplyProductInJanuary2023."'#1056#1029#1056#176#1056#183#1056#1030#1056#176'_'#1056#1111#1057#1026#1056#1109#1056 +
              #1169#1057#1107#1056#1108#1057#8218#1057#1107'"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          Left = 212.110236220000000000
          Width = 99.000000000000000000
          Height = 18.897650000000000000
          DataField = #1094#1110#1085#1072'_'#1087#1088#1086#1076#1091#1082#1090#1091
          DataSet = DsFrxQryForReportSupplyProductInJanuary2023
          DataSetName = 'DsFrxQryForReportSupplyProductInJanuary2023'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[DsFrxQryForReportSupplyProductInJanuary2023."'#1057#8224#1057#8211#1056#1029#1056#176'_'#1056#1111#1057#1026#1056#1109#1056#1169#1057 +
              #1107#1056#1108#1057#8218#1057#1107'"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          Left = 311.110236220000000000
          Width = 147.000000000000000000
          Height = 18.897650000000000000
          DataField = #1082#1110#1083#1100#1082#1110#1089#1090#1100'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
          DataSet = DsFrxQryForReportSupplyProductInJanuary2023
          DataSetName = 'DsFrxQryForReportSupplyProductInJanuary2023'
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[DsFrxQryForReportSupplyProductInJanuary2023."'#1056#1108#1057#8211#1056#187#1057#1034#1056#1108#1057#8211#1057#1027#1057#8218#1057#1034 +
              '_'#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039'"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo12: TfrxMemoView
          Left = 458.110236220000000000
          Width = 143.000000000000000000
          Height = 18.897650000000000000
          DataField = #1074#1072#1088#1090#1110#1089#1090#1100'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
          DataSet = DsFrxQryForReportSupplyProductInJanuary2023
          DataSetName = 'DsFrxQryForReportSupplyProductInJanuary2023'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            
              '[DsFrxQryForReportSupplyProductInJanuary2023."'#1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057#8218#1057#1034'_'#1056 +
              #1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039'"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          Left = 601.110236220000000000
          Width = 117.000000000000000000
          Height = 18.897650000000000000
          DataField = #1076#1072#1090#1072'_'#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103
          DataSet = DsFrxQryForReportSupplyProductInJanuary2023
          DataSetName = 'DsFrxQryForReportSupplyProductInJanuary2023'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[DsFrxQryForReportSupplyProductInJanuary2023."'#1056#1169#1056#176#1057#8218#1056#176'_'#1056#1111#1056#1109#1057#1027#1057#8218#1056 +
              #176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039'"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Top = 241.889920000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 377.953000000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo15: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo16: TfrxMemoView
          Align = baRight
          Left = 593.386210000000000000
          Top = 1.000000000000000000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1056#1109#1057#1026#1057#8211#1056#1029#1056#1108#1056#176' '#1074#8222#8211' [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 52.913420000000000000
        Top = 302.362400000000000000
        Width = 718.110700000000000000
        object Memo17: TfrxMemoView
          Top = 3.779530000000000000
          Width = 212.110236220000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#176' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1057#1034' '#1056#183#1056#176' '#1057#8224#1056#181#1056#8470' '#1056#1111#1056#181#1057#1026#1057#8211#1056#1109#1056#1169)
          ParentFont = False
          Style = 'Header'
        end
        object Memo18: TfrxMemoView
          Left = 495.118430000000000000
          Top = 3.779530000000000000
          Width = 223.448826220000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1057#8211#1056#187#1057#1034#1056#1108#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1056#1030#1056#187#1056#181#1056#1029#1056#1105#1057#8230' '#1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8218#1057#8211#1056#1030)
          ParentFont = False
          Style = 'Header'
        end
        object Memo19: TfrxMemoView
          Left = 245.669450000000000000
          Top = 3.779530000000000000
          Width = 212.110236220000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#181#1057#1026#1056#181#1056#1169#1056#1029#1057#1039' '#1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#183#1056#176' '#1057#8224#1056#181#1056#8470' '#1056#1111#1056#181#1057#1026#1057#8211#1056#1109#1056#1169)
          ParentFont = False
          Style = 'Header'
        end
        object SysMemo1: TfrxSysMemoView
          Top = 26.456710000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[SUM(<DsFrxQryForReportSupplyProductInJanuary2023."'#1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057 +
              #8218#1057#1034'_'#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039'">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 245.669450000000000000
          Top = 26.456710000000000000
          Width = 211.653680000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            
              '[AVG(<DsFrxQryForReportSupplyProductInJanuary2023."'#1056#1030#1056#176#1057#1026#1057#8218#1057#8211#1057#1027#1057 +
              #8218#1057#1034'_'#1056#1111#1056#1109#1057#1027#1057#8218#1056#176#1057#8225#1056#176#1056#1029#1056#1029#1057#1039'">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 495.118430000000000000
          Top = 26.456710000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object reportWorkerSalary: TfrxReport
    Version = '5.3.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44974.181169895800000000
    ReportOptions.LastChange = 44974.181169895800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 648
    Top = 136
    Datasets = <
      item
        DataSet = DsFrxQryForReportWorkerSalary
        DataSetName = 'DsFrxQryForReportWorkerSalary'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 14211288
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 15790320
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 15790320
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 200.000000000000000000
      PaperSize = 256
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 14211288
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#8217#1056#8224#1056#1118' '#1056#8212#1056#1106#1056#160#1056#1106#1056#1119#1056#8250#1056#1106#1056#1118' '#1056#1119#1056#160#1056#1106#1056#166#1056#8224#1056#8217#1056#1116#1056#152#1056#1113#1056#8224#1056#8217)
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 68.031540000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          Width = 718.110236220472000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Width = 2.000000000000000000
          ParentFont = False
          Style = 'Header line'
        end
        object Memo3: TfrxMemoView
          Width = 108.236240000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#1111#1057#1026#1056#176#1057#8224#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108#1056#176)
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 112.015770000000000000
          Width = 270.756030000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1119#1056#8224#1056#1119' '#1056#1111#1057#1026#1056#176#1057#8224#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108#1056#176)
          ParentFont = False
          Style = 'Header'
        end
        object Memo5: TfrxMemoView
          Left = 390.330860000000000000
          Width = 176.267780000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1116#1056#1109#1056#1112#1056#181#1057#1026' '#1056#1111#1057#1026#1056#176#1057#8224#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108#1056#176)
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 574.157700000000000000
          Width = 142.252010000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#176#1057#1026#1056#1111#1056#187#1056#176#1057#8218#1056#176' '#1056#1111#1057#1026#1056#176#1057#8224#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108#1056#176)
          ParentFont = False
          Style = 'Header'
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 151.181200000000000000
        Width = 718.110700000000000000
        DataSet = DsFrxQryForReportWorkerSalary
        DataSetName = 'DsFrxQryForReportWorkerSalary'
        RowCount = 0
        object Memo7: TfrxMemoView
          Width = 108.236240000000000000
          Height = 18.897650000000000000
          DataField = 'code_w'
          DataSet = DsFrxQryForReportWorkerSalary
          DataSetName = 'DsFrxQryForReportWorkerSalary'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DsFrxQryForReportWorkerSalary."code_w"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo8: TfrxMemoView
          Left = 112.015770000000000000
          Width = 270.756030000000000000
          Height = 18.897650000000000000
          DataField = 'fullname_w'
          DataSet = DsFrxQryForReportWorkerSalary
          DataSetName = 'DsFrxQryForReportWorkerSalary'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForReportWorkerSalary."fullname_w"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          Left = 390.330860000000000000
          Width = 176.267780000000000000
          Height = 18.897650000000000000
          DataField = 'number_w'
          DataSet = DsFrxQryForReportWorkerSalary
          DataSetName = 'DsFrxQryForReportWorkerSalary'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DsFrxQryForReportWorkerSalary."number_w"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo10: TfrxMemoView
          Left = 574.157700000000000000
          Width = 142.252010000000000000
          Height = 18.897650000000000000
          DataField = 'salary_w'
          DataSet = DsFrxQryForReportWorkerSalary
          DataSetName = 'DsFrxQryForReportWorkerSalary'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8 = (
            '[DsFrxQryForReportWorkerSalary."salary_w"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo11: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo12: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo13: TfrxMemoView
          Align = baRight
          Left = 566.929500000000000000
          Top = 1.000000000000000000
          Width = 151.181200000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1056#1109#1057#1026#1057#8211#1056#1029#1056#1108#1056#176' '#1074#8222#8211' [Page#]')
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 79.370130000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo14: TfrxMemoView
          Top = 7.559060000000000000
          Width = 112.015770000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#176' '#1056#183#1056#176#1057#1026#1056#1111#1056#187#1056#176#1057#8218)
          ParentFont = False
          Style = 'Header'
        end
        object Memo15: TfrxMemoView
          Left = 136.063080000000000000
          Top = 7.559060000000000000
          Width = 130.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1038#1056#181#1057#1026#1056#181#1056#1169#1056#1029#1057#1039' '#1056#183#1056#176#1057#1026#1056#1111#1056#187#1056#176#1057#8218#1056#176)
          ParentFont = False
          Style = 'Header'
        end
        object Memo16: TfrxMemoView
          Left = 283.464750000000000000
          Top = 7.559060000000000000
          Width = 130.913420000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1113#1057#8211#1056#187#1057#1034#1056#1108#1057#8211#1057#1027#1057#8218#1057#1034' '#1056#183#1056#176#1057#1026#1056#1111#1056#187#1056#176#1057#8218)
          ParentFont = False
          Style = 'Header'
        end
        object Memo17: TfrxMemoView
          Left = 434.645950000000000000
          Top = 7.559060000000000000
          Width = 127.133890000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1057#8211#1056#1029#1057#8211#1056#1112#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1056#183#1056#176#1057#1026#1056#1111#1056#187#1056#176#1057#8218#1056#176)
          ParentFont = False
          Style = 'Header'
        end
        object Memo18: TfrxMemoView
          Left = 589.606680000000000000
          Top = 7.559060000000000000
          Width = 127.133890000000000000
          Height = 34.015770000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#176#1056#1108#1057#1027#1056#1105#1056#1112#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1056#183#1056#176#1057#1026#1056#1111#1056#187#1056#176#1057#8218#1056#176)
          ParentFont = False
          Style = 'Header'
        end
        object SysMemo1: TfrxSysMemoView
          Top = 49.133890000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            '[SUM(<DsFrxQryForReportWorkerSalary."salary_w">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 136.063080000000000000
          Top = 49.133890000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            '[AVG(<DsFrxQryForReportWorkerSalary."salary_w">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 283.464750000000000000
          Top = 49.133890000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            '[COUNT(MasterData1)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 434.645950000000000000
          Top = 49.133890000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            '[MIN(<DsFrxQryForReportWorkerSalary."salary_w">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 589.606680000000000000
          Top = 49.133890000000000000
          Width = 128.504020000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Fill.BackColor = 15790320
          HAlign = haCenter
          Memo.UTF8 = (
            '[MAX(<DsFrxQryForReportWorkerSalary."salary_w">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object reportMostCounterOrder: TfrxReport
    Version = '5.3.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44974.222397766200000000
    ReportOptions.LastChange = 44974.222397766200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 648
    Top = 224
    Datasets = <
      item
        DataSet = DsFrxQryForReportMostCountOrder
        DataSetName = 'DsFrxQryForReportMostCountOrder'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftTop]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = [ftBottom]
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#8212#1056#8217#1056#8224#1056#1118' '#1056#1116#1056#1106#1056#8482#1056#8216#1056#8224#1056#8250#1056#172#1056#1025#1056#8224' '#1056#8212#1056#1106#1056#1114#1056#1115#1056#8217#1056#8250#1056#8226#1056#1116#1056#1116#1056#1031)
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        Condition = 'DsFrxQryForReportMostCountOrder."cnt_code_o"'
        object Memo2: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'cnt_code_o'
          DataSet = DsFrxQryForReportMostCountOrder
          DataSetName = 'DsFrxQryForReportMostCountOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          Memo.UTF8 = (
            '[DsFrxQryForReportMostCountOrder."cnt_code_o"]')
          ParentFont = False
          Style = 'Group header'
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 132.283550000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        DataSet = DsFrxQryForReportMostCountOrder
        DataSetName = 'DsFrxQryForReportMostCountOrder'
        RowCount = 0
        object Memo3: TfrxMemoView
          Width = 135.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1113#1056#1109#1056#1169' '#1056#183#1056#176#1056#1112#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1029#1057#1039':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 180.488250000000000000
          Width = 376.819110000000000000
          Height = 18.897650000000000000
          DataField = 'code_o'
          DataSet = DsFrxQryForReportMostCountOrder
          DataSetName = 'DsFrxQryForReportMostCountOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForReportMostCountOrder."code_o"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo5: TfrxMemoView
          Top = 18.897650000000000000
          Width = 135.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1119#1056#8224#1056#1119' '#1056#1111#1057#1026#1056#176#1057#8224#1057#8211#1056#1030#1056#1029#1056#1105#1056#1108#1056#176':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 180.488250000000000000
          Top = 18.897650000000000000
          Width = 375.779530000000000000
          Height = 18.897650000000000000
          DataField = 'fullname_w'
          DataSet = DsFrxQryForReportMostCountOrder
          DataSetName = 'DsFrxQryForReportMostCountOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForReportMostCountOrder."fullname_w"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo7: TfrxMemoView
          Top = 37.795300000000000000
          Width = 135.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1038#1057#1107#1056#1112#1056#176' '#1056#183#1056#176#1056#1112#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1029#1057#1039':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          Left = 180.488250000000000000
          Top = 37.795300000000000000
          Width = 375.228510000000000000
          Height = 18.897650000000000000
          DataField = 'sum_price_d'
          DataSet = DsFrxQryForReportMostCountOrder
          DataSetName = 'DsFrxQryForReportMostCountOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForReportMostCountOrder."sum_price_d"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          Top = 56.692950000000000000
          Width = 135.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1114#1057#8211#1056#1029#1057#8211#1056#1112#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1057#8224#1057#8211#1056#1029#1056#176':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          Left = 180.488250000000000000
          Top = 56.692950000000000000
          Width = 376.700990000000000000
          Height = 18.897650000000000000
          DataField = 'min_price_d'
          DataSet = DsFrxQryForReportMostCountOrder
          DataSetName = 'DsFrxQryForReportMostCountOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForReportMostCountOrder."min_price_d"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          Top = 75.590600000000000000
          Width = 135.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#1114#1056#176#1056#1108#1057#1027#1056#1105#1056#1112#1056#176#1056#187#1057#1034#1056#1029#1056#176' '#1057#8224#1057#8211#1056#1029#1056#176':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo12: TfrxMemoView
          Left = 180.488250000000000000
          Top = 75.590600000000000000
          Width = 376.700990000000000000
          Height = 18.897650000000000000
          DataField = 'max_price_d'
          DataSet = DsFrxQryForReportMostCountOrder
          DataSetName = 'DsFrxQryForReportMostCountOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForReportMostCountOrder."max_price_d"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo13: TfrxMemoView
          Top = 94.488250000000000000
          Width = 135.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            #1056#8221#1056#176#1057#8218#1056#176' '#1056#183#1056#176#1056#1112#1056#1109#1056#1030#1056#187#1056#181#1056#1029#1056#1029#1057#1039':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo14: TfrxMemoView
          Left = 180.488250000000000000
          Top = 94.488250000000000000
          Width = 376.582870000000000000
          Height = 18.897650000000000000
          DataField = 'date_o'
          DataSet = DsFrxQryForReportMostCountOrder
          DataSetName = 'DsFrxQryForReportMostCountOrder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForReportMostCountOrder."date_o"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Top = 309.921460000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo16: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo17: TfrxMemoView
          Align = baRight
          Left = 570.709030000000000000
          Top = 1.000000000000000000
          Width = 147.401670000000000000
          Height = 22.677180000000000000
          Fill.BackColor = clWhite
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1056#1109#1057#1026#1057#8211#1056#1029#1056#1108#1056#176' '#1074#8222#8211' [Page#]')
        end
      end
    end
  end
  object menuReport: TfrxReport
    Version = '5.3.1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44974.199316840300000000
    ReportOptions.LastChange = 44974.199316840300000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 648
    Top = 304
    Datasets = <
      item
        DataSet = DsFrxQryForMenuReport
        DataSetName = 'DsFrxQryForMenuReport'
      end>
    Variables = <>
    Style = <
      item
        Name = 'Title'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clBlack
      end
      item
        Name = 'Header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = clBlack
      end
      item
        Name = 'Group header'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Fill.BackColor = 52479
      end
      item
        Name = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
      end
      item
        Name = 'Group footer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
      end
      item
        Name = 'Header line'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Width = 2.000000000000000000
      end>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          HAlign = haCenter
          Memo.UTF8 = (
            #1056#1114#1056#8226#1056#1116#1056#174)
          ParentFont = False
          Style = 'Title'
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 34.015770000000000000
        Top = 105.826840000000000000
        Width = 718.110700000000000000
        Condition = 'DsFrxQryForMenuReport."name_td"'
        object Memo2: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Height = 22.677180000000000000
          DataField = 'name_td'
          DataSet = DsFrxQryForMenuReport
          DataSetName = 'DsFrxQryForMenuReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = 52479
          HAlign = haCenter
          Memo.UTF8 = (
            '[DsFrxQryForMenuReport."name_td"]')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 64.252010000000000000
        Top = 162.519790000000000000
        Width = 718.110700000000000000
        DataSet = DsFrxQryForMenuReport
        DataSetName = 'DsFrxQryForMenuReport'
        RowCount = 0
        object Memo3: TfrxMemoView
          Width = 133.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8 = (
            #1056#1116#1056#176#1056#183#1056#1030#1056#176' '#1057#1027#1057#8218#1057#1026#1056#176#1056#1030#1056#1105':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo4: TfrxMemoView
          Left = 136.795300000000000000
          Width = 323.669450000000000000
          Height = 18.897650000000000000
          DataField = 'name_d'
          DataSet = DsFrxQryForMenuReport
          DataSetName = 'DsFrxQryForMenuReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForMenuReport."name_d"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo5: TfrxMemoView
          Top = 18.897650000000000000
          Width = 133.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8 = (
            #1056#8220#1056#1109#1056#187#1056#1109#1056#1030#1056#1029#1056#1105#1056#8470' '#1056#1111#1057#1026#1056#1109#1056#1169#1057#1107#1056#1108#1057#8218':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo6: TfrxMemoView
          Left = 136.795300000000000000
          Top = 18.897650000000000000
          Width = 323.669450000000000000
          Height = 18.897650000000000000
          DataField = 'name_p'
          DataSet = DsFrxQryForMenuReport
          DataSetName = 'DsFrxQryForMenuReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForMenuReport."name_p"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo7: TfrxMemoView
          Top = 37.795300000000000000
          Width = 133.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8 = (
            #1056#1038#1056#1108#1056#187#1056#176#1056#1169':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo8: TfrxMemoView
          Left = 136.795300000000000000
          Top = 37.795300000000000000
          Width = 323.669450000000000000
          Height = 18.897650000000000000
          DataField = 'composition_d'
          DataSet = DsFrxQryForMenuReport
          DataSetName = 'DsFrxQryForMenuReport'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForMenuReport."composition_d"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo9: TfrxMemoView
          Left = 461.102660000000000000
          Width = 99.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8 = (
            #1056#8217#1056#176#1056#1110#1056#176' '#1057#1027#1057#8218#1057#1026#1056#176#1056#1030#1056#1105':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo10: TfrxMemoView
          Left = 579.000310000000000000
          Width = 123.354360000000000000
          Height = 18.897650000000000000
          DataField = 'weight_d'
          DataSet = DsFrxQryForMenuReport
          DataSetName = 'DsFrxQryForMenuReport'
          DisplayFormat.FormatStr = '%2.3f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForMenuReport."weight_d"]')
          ParentFont = False
          Style = 'Data'
        end
        object Memo11: TfrxMemoView
          Left = 461.102660000000000000
          Top = 18.897650000000000000
          Width = 99.000000000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Fill.BackColor = clBlack
          Memo.UTF8 = (
            #1056#166#1057#8211#1056#1029#1056#176' '#1057#1027#1057#8218#1057#1026#1056#176#1056#1030#1056#1105':')
          ParentFont = False
          Style = 'Header'
        end
        object Memo12: TfrxMemoView
          Left = 579.000310000000000000
          Top = 18.897650000000000000
          Width = 123.354360000000000000
          Height = 18.897650000000000000
          DataField = 'price_d'
          DataSet = DsFrxQryForMenuReport
          DataSetName = 'DsFrxQryForMenuReport'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '[DsFrxQryForMenuReport."price_d"]')
          ParentFont = False
          Style = 'Data'
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Top = 249.448980000000000000
        Width = 718.110700000000000000
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 309.921460000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          Align = baWidth
          Width = 718.110700000000000000
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo14: TfrxMemoView
          Top = 1.000000000000000000
          Height = 22.677180000000000000
          AutoWidth = True
          Memo.UTF8 = (
            '[Date] [Time]')
        end
        object Memo15: TfrxMemoView
          Align = baRight
          Left = 585.827150000000000000
          Top = 1.000000000000000000
          Width = 132.283550000000000000
          Height = 22.677180000000000000
          HAlign = haRight
          Memo.UTF8 = (
            #1056#1038#1057#8218#1056#1109#1057#1026#1057#8211#1056#1029#1056#1108#1056#176' '#1074#8222#8211' [Page#]')
        end
      end
    end
  end
end
