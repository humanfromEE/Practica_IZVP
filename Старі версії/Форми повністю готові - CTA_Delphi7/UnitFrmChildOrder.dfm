object frmChildOrder: TfrmChildOrder
  Left = 102
  Top = 95
  AutoSize = True
  BorderStyle = bsSingle
  Caption = #1047#1072#1084#1086#1074#1083#1077#1085#1085#1103
  ClientHeight = 391
  ClientWidth = 774
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    000000008000008000000080800080000000800080008080000080808000C0C0
    C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
    FFFFFFF777777777777777777777FFFFFFFFFFF000000000000000000007FFFF
    FFFFFFF0FFFFFFFFFFFFFFFFFF07FFFFFFFFFFF0FFFF800000F800000F07FFFF
    FFFFFFF0FFFF8FFFF0F8FFFF0F07FFFFFFFFFFF0FFFF888888F888888F07FFFF
    FFFFFFF0FFFFFFFFFFFFFFFFFF07FFFFFFFFF440FFFFFFFFFFFFFFFFFF07FFFF
    FFF44440FFFFFFFFFFFFFFFFFF07FFFFFF444440FFFFFFFFFFFFFFFFFF07FFFF
    F444444000000000000000000007FFFFF2444440CCCCCCCCCCCC08080807FFFF
    444444400000000000000000000FFFFF44444444422244244447FFFFFFFFFFF8
    444444442324222444477FFFFFFFFFF8444444232222222444477FFFFFFFFFF8
    444442232323224444447FFFFFFFFFF8444442322322324444444FFFFFFFFFF8
    444442232232322444444FFFFFFFFFF844442242224222244444FFFFFFFFFFF8
    84442223242224324444FFFFFFFFFFFF84442322222222224444FFFFFFFFFFFF
    8844233324222444EEEEEEE666FFFFFFF88422224224444EE000E0E0E66FFFFF
    FF882444444444EEEE0EE000EE66FFFFFFF88444444444EEEE0EE0E0EEE6FFFF
    FFFF8884444444EEEE0E0EEE0EE6FFFFFFFFFF8888888FFEE0000EEE0EEFFFFF
    FFFFFFFFFFFFFFFFEEEEEEEEEEFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEFFFFFFFF
    FFFF000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgcForTabs: TPageControl
    Left = 0
    Top = 0
    Width = 774
    Height = 391
    ActivePage = tsPCedit
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object tsPCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
      object lblCodeRecord: TLabel
        Left = 376
        Top = 16
        Width = 145
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1050#1086#1076' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCodeWorker: TLabel
        Left = 376
        Top = 80
        Width = 145
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1050#1086#1076' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblCodeDish: TLabel
        Left = 376
        Top = 48
        Width = 145
        Height = 17
        Alignment = taRightJustify
        AutoSize = False
        Caption = #1050#1086#1076' '#1089#1090#1088#1072#1074#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object dbnvgr1: TDBNavigator
        Left = 0
        Top = 314
        Width = 766
        Height = 49
        DataSource = DMVFP.DsDBorder
        Align = alBottom
        TabOrder = 0
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 329
        Height = 314
        Align = alLeft
        DataSource = DMVFP.DsDBorder
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'code_o'
            Title.Caption = #1050#1086#1076
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'code_d_o'
            Title.Caption = #1050#1086#1076'_'#1089#1090#1088#1072#1074#1080
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'code_w_o'
            Title.Caption = #1050#1086#1076'_'#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'date_o'
            Title.Caption = #1044#1072#1090#1072'_'#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103
            Visible = True
          end>
      end
      object btnClearInputField: TButton
        Left = 464
        Top = 272
        Width = 193
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1081' '#1087#1077#1088#1077#1081#1090#1080' '#1085#1072#1074#1077#1088#1093
        TabOrder = 2
        OnClick = btnClearInputFieldClick
      end
      object btnGoToRecord: TButton
        Left = 464
        Top = 120
        Width = 193
        Height = 25
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1076#1086' '#1079#1072#1087#1080#1089#1091' '#1079#1072' '#1082#1086#1076#1086#1084
        TabOrder = 3
        OnClick = btnGoToRecordClick
      end
      object edtInputCodeRecord: TEdit
        Left = 525
        Top = 16
        Width = 193
        Height = 21
        TabOrder = 4
      end
      object btnGoToRecordWithCodeDish: TButton
        Left = 432
        Top = 152
        Width = 257
        Height = 25
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1076#1086' '#1079#1072#1087#1080#1089#1091' '#1076#1086#1076#1072#1090#1082#1086#1074#1086' '#1079' '#1082#1086#1076#1086#1084' '#1087#1088#1086#1076#1091#1082#1090#1091
        TabOrder = 5
        OnClick = btnGoToRecordWithCodeDishClick
      end
      object btnGoToRecordWithCodeWorker: TButton
        Left = 432
        Top = 184
        Width = 257
        Height = 25
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1076#1086' '#1079#1072#1087#1080#1089#1091' '#1076#1086#1076#1072#1090#1082#1086#1074#1086' '#1079' '#1082#1086#1076#1086#1084' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072
        TabOrder = 6
        OnClick = btnGoToRecordWithCodeWorkerClick
      end
      object edtInputCodeDishRecord: TEdit
        Left = 525
        Top = 48
        Width = 193
        Height = 21
        TabOrder = 7
      end
      object edtInputCodeWorkerRecord: TEdit
        Left = 525
        Top = 80
        Width = 193
        Height = 21
        TabOrder = 8
      end
      object btnGoToRecordWithWorkerAndDishRecord: TButton
        Left = 400
        Top = 216
        Width = 321
        Height = 25
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1076#1086' '#1079#1072#1087#1080#1089#1091' '#1076#1086#1076#1072#1090#1082#1086#1074#1086' '#1079' '#1082#1086#1076#1072#1084#1080' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072' '#1081' '#1089#1090#1088#1072#1074#1080
        TabOrder = 9
        OnClick = btnGoToRecordWithWorkerAndDishRecordClick
      end
    end
    object tsPCsearch: TTabSheet
      Caption = #1055#1086#1096#1091#1082
      ImageIndex = 1
      object lblMessageForInput: TLabel
        Left = 456
        Top = 208
        Width = 90
        Height = 13
        Alignment = taCenter
        Caption = #1059#1074#1077#1076#1110#1090#1100' '#1079#1085#1072#1095#1077#1085#1085#1103
      end
      object dbgrd2: TDBGrid
        Left = 0
        Top = 0
        Width = 766
        Height = 177
        Align = alTop
        DataSource = DMVFP.DsDBQorder
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object rgCategorySearch: TRadioGroup
        Left = 152
        Top = 184
        Width = 281
        Height = 169
        Caption = #1054#1073#1077#1088#1110#1090#1100' '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
        Color = clAqua
        ItemIndex = 0
        Items.Strings = (
          #1050#1086#1076' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1103
          #1050#1086#1076' '#1089#1090#1088#1072#1074#1080
          #1050#1086#1076' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072
          #1053#1072#1079#1074#1072' '#1089#1090#1088#1072#1074#1080
          #1055#1030#1055' '#1087#1088#1072#1094#1110#1074#1085#1080#1082#1072
          #1057#1091#1084#1072' '#1079#1072#1074#1086#1083#1077#1085#1085#1103' ('#1082#1086#1076')'
          #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1089#1090#1088#1072#1074' '#1091' '#1079#1072#1084#1086#1083#1077#1085#1085#1110' ('#1082#1086#1076')'
          #1052#1110#1085#1110#1084#1072#1083#1100#1085#1072' '#1094#1110#1085#1072' '#1089#1090#1088#1072#1074#1080' '#1091' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1110' ('#1082#1086#1076')'
          #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072' '#1094#1110#1085#1072' '#1089#1090#1088#1072#1074#1080' '#1091' '#1079#1072#1084#1086#1074#1083#1077#1085#1085#1110' ('#1082#1086#1076')')
        ParentColor = False
        TabOrder = 1
      end
      object edtInputField: TEdit
        Left = 456
        Top = 224
        Width = 169
        Height = 21
        TabOrder = 2
      end
      object btnSearchData: TButton
        Left = 456
        Top = 256
        Width = 169
        Height = 25
        Caption = #1055#1086#1096#1091#1082
        TabOrder = 3
        OnClick = btnSearchDataClick
      end
      object btnClearForm: TButton
        Left = 456
        Top = 296
        Width = 169
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080
        TabOrder = 4
        OnClick = btnClearFormClick
      end
    end
  end
end
