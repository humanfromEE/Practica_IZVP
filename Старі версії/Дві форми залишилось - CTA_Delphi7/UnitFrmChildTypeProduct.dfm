object frmChildTypeProduct: TfrmChildTypeProduct
  Left = 479
  Top = 176
  AutoSize = True
  BorderStyle = bsSingle
  Caption = #1042#1080#1076#1080' '#1087#1088#1086#1076#1091#1082#1090#1110#1074
  ClientHeight = 334
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
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
    Width = 425
    Height = 334
    ActivePage = tsPCedit
    Align = alClient
    TabOrder = 0
    object tsPCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
      object dbnvgr1: TDBNavigator
        Left = 0
        Top = 257
        Width = 417
        Height = 49
        DataSource = DMVFP.DsDBtype_product
        Align = alBottom
        TabOrder = 0
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 417
        Height = 257
        Align = alClient
        DataSource = DMVFP.DsDBtype_product
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'code_tp'
            Title.Caption = #1050#1086#1076'_'#1074#1080#1076#1091'_'#1087#1088#1086#1076#1091#1082#1090#1091
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_tp'
            Title.Caption = ' '#1053#1072#1079#1074#1072'_'#1074#1080#1076#1091'_'#1087#1088#1086#1076#1091#1082#1090#1091
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
        Width = 417
        Height = 177
        Align = alTop
        DataSource = DMVFP.DsDBQtype_product
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
          #1050#1086#1076' '#1074#1080#1076#1091' '#1087#1088#1086#1076#1091#1082#1090#1091
          #1053#1072#1079#1074#1072' '#1074#1080#1076#1091' '#1087#1088#1086#1076#1091#1082#1090#1091)
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
