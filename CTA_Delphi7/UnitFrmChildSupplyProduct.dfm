object frmChildSupplyProduct: TfrmChildSupplyProduct
  Left = 292
  Top = 145
  AutoSize = True
  BorderStyle = bsSingle
  Caption = #1055#1086#1089#1090#1072#1095#1072#1085#1085#1103' '#1087#1088#1086#1076#1091#1082#1090#1110#1074
  ClientHeight = 441
  ClientWidth = 912
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000888
    8888888888888888888888888888000000000000000000000000000000080F88
    88888888888888888888888888080F7F700000000000000F7F7F7F7F78080FF7
    F070FFFFF7FFFF0007F7F7F7F8080F7F70F077777777770CC00F7F7F78080FF7
    F070FFFFF7FFFF0CCCC007F7F8080F7F70F077777777770CCCCCC07F78080FF7
    F070FFFFF7FFFF0CCCCCC0F7F8080F7F70F077777777770CCCCCC07F78080FF7
    F070FFFFF7FFFF0CCCCCC0F7F8080F7F70F077777777770CCCCCC07F78080FF7
    F070FFFFF7FFFF0CCCCCC0F7F8080F7F700000000000000CCCCCC07F78080FF7
    F070F77777F7770CCCCCC0F7F8080F7F700000000000000CCCCCC07F78080FF7
    F7F00FFFFFFFFFF00CCCC0F7F8080F7F7F7F700FFFFFFFFFF00CC07F78080FF7
    F7F7F7F07FFFFFFFFFF000F7F8080F7F7F7F7F7F000000000000007F78080FFF
    FFFFFFFFFFFFFFFFFFFFFFFFFF08000000000000000000000000000000080CCC
    CCCCCCCCCCCCCCCCCCCC07070708000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000FFFF
    FFFFFFFFFFFFFFFFFFFFFFFFFFFF800000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
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
    Width = 912
    Height = 441
    ActivePage = tsPCedit
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object tsPCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
      object dbnvgr1: TDBNavigator
        Left = 0
        Top = 364
        Width = 904
        Height = 49
        DataSource = DMVFP.DsDBsupply_product
        Align = alBottom
        TabOrder = 0
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 904
        Height = 353
        Align = alTop
        DataSource = DMVFP.DsDBsupply_product
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tsPCsearch: TTabSheet
      Caption = #1055#1086#1096#1091#1082
      ImageIndex = 1
      object lblMessageForInput: TLabel
        Left = 472
        Top = 208
        Width = 90
        Height = 13
        Alignment = taCenter
        Caption = #1059#1074#1077#1076#1110#1090#1100' '#1079#1085#1072#1095#1077#1085#1085#1103
      end
      object dbgrd2: TDBGrid
        Left = 0
        Top = 0
        Width = 904
        Height = 177
        Align = alTop
        DataSource = DMVFP.DsDBQsupply_product
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object rgCategorySearch: TRadioGroup
        Left = 168
        Top = 184
        Width = 281
        Height = 169
        Caption = #1054#1073#1077#1088#1110#1090#1100' '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
        Color = clAqua
        ItemIndex = 0
        Items.Strings = (
          #1050#1086#1076' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103' '#1087#1088#1086#1076#1091#1082#1090#1110#1074
          #1050#1086#1076' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072
          #1050#1086#1076' '#1087#1088#1086#1076#1091#1082#1090#1091
          #1053#1072#1079#1074#1072' '#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072
          #1053#1072#1079#1074#1072' '#1087#1088#1086#1076#1091#1082#1090#1091
          #1057#1091#1084#1072' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1103' ('#1082#1086#1076')'
          #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1087#1088#1086#1076#1091#1082#1090#1110#1074' '#1091' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1110' ('#1082#1086#1076')'
          #1052#1110#1085#1110#1084#1072#1083#1100#1085#1072' '#1094#1110#1085#1072' '#1087#1088#1086#1076#1091#1082#1090#1091' '#1091' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1110' ('#1082#1086#1076')'
          #1052#1072#1082#1089#1080#1084#1072#1083#1100#1085#1072' '#1094#1110#1085#1072' '#1087#1088#1086#1076#1091#1082#1090#1091' '#1091' '#1087#1086#1089#1090#1072#1095#1072#1085#1085#1110' ('#1082#1086#1076')')
        ParentColor = False
        TabOrder = 1
      end
      object edtInputField: TEdit
        Left = 472
        Top = 224
        Width = 169
        Height = 21
        TabOrder = 2
      end
      object btnSearchData: TButton
        Left = 472
        Top = 256
        Width = 169
        Height = 25
        Caption = #1055#1086#1096#1091#1082
        TabOrder = 3
        OnClick = btnSearchDataClick
      end
      object btnClearForm: TButton
        Left = 472
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