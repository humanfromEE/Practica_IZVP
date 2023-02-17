object frmChildTypeDish: TfrmChildTypeDish
  Left = 618
  Top = 263
  Width = 448
  Height = 373
  AutoSize = True
  Caption = #1042#1080#1076#1080' '#1089#1090#1088#1072#1074
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
    88888888888888888888888888080F7F7F7F7F7F7F7F7F7F7F7F7F7F78080FF7
    F7F7F7F7F7700000F7000007F8080F7F7F7F7F7F7F7F88F077888F0F78080FF7
    F7F7F7F7F7777777F7777777F8080F7F7F7F7F7F7F7F7F7F7F7F7F7F78080FF7
    F7F7F7F7F7F7F7F7F7F7F7F7F8080F7F7F7F7F7F7F7F7F7F7F7F7F7F78080FF7
    000000000000000000000007F8080F770F0F0F0F0F0F0FFFFFFFFF0F78080FF7
    F0FFF0FFF0FF0FFFFFFFFF07F8080F770F0F0F0F0F0F0FFFFFFFFF0F78080FF7
    777777777777777777777777F8080F7F707F7F7F7F7F7F7F7F7F7F7F78080FF7
    0707F0F0F7F7F7F7F7F7F7F7F8080F7F0F0000000F7F7F7F7F7F7F7F78080FF7
    F0F7F7F7F7F7F7F7F7F7F7F7F8080F7F7F7F7F7F7F7F7F7F7F7F7F7F78080FFF
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
    Width = 432
    Height = 334
    ActivePage = tsPCedit
    Align = alClient
    TabOrder = 0
    object tsPCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
      object dbnvgr1: TDBNavigator
        Left = 0
        Top = 257
        Width = 424
        Height = 49
        DataSource = DMVFP.DsDBtype_dish
        Align = alBottom
        TabOrder = 0
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 424
        Height = 257
        Align = alClient
        DataSource = DMVFP.DsDBtype_dish
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'code_td'
            Title.Caption = #1050#1086#1076'_'#1074#1080#1076#1091'_'#1089#1090#1088#1072#1074#1080
            Width = 138
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_td'
            Title.Caption = ' '#1053#1072#1079#1074#1072'_'#1074#1080#1076#1091'_'#1089#1090#1088#1072#1074#1080
            Width = 248
            Visible = True
          end>
      end
    end
    object tsPCsearch: TTabSheet
      Caption = #1055#1086#1096#1091#1082
      ImageIndex = 1
      object lblMessageForInput: TLabel
        Left = 240
        Top = 184
        Width = 169
        Height = 13
        Alignment = taCenter
        AutoSize = False
        BiDiMode = bdLeftToRight
        Caption = #1059#1074#1077#1076#1110#1090#1100' '#1079#1085#1072#1095#1077#1085#1085#1103
        ParentBiDiMode = False
      end
      object dbgrd2: TDBGrid
        Left = 0
        Top = 0
        Width = 424
        Height = 177
        Align = alTop
        DataSource = DMVFP.DsDBQtype_dish
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object rgCategorySearch: TRadioGroup
        Left = 8
        Top = 192
        Width = 201
        Height = 97
        BiDiMode = bdLeftToRight
        Caption = #1054#1073#1077#1088#1110#1090#1100' '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
        Color = clAqua
        ItemIndex = 0
        Items.Strings = (
          #1050#1086#1076' '#1074#1080#1076#1091' '#1089#1090#1088#1072#1074#1080
          #1053#1072#1079#1074#1072' '#1074#1080#1076#1091' '#1089#1090#1088#1072#1074#1080)
        ParentBiDiMode = False
        ParentColor = False
        TabOrder = 1
      end
      object edtInputField: TEdit
        Left = 240
        Top = 200
        Width = 169
        Height = 21
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 2
      end
      object btnSearchData: TButton
        Left = 240
        Top = 232
        Width = 169
        Height = 25
        BiDiMode = bdLeftToRight
        Caption = #1055#1086#1096#1091#1082
        ParentBiDiMode = False
        TabOrder = 3
        OnClick = btnSearchDataClick
      end
      object btnClearForm: TButton
        Left = 240
        Top = 272
        Width = 169
        Height = 25
        BiDiMode = bdLeftToRight
        Caption = #1054#1095#1080#1089#1090#1080
        ParentBiDiMode = False
        TabOrder = 4
        OnClick = btnClearFormClick
      end
    end
  end
end
