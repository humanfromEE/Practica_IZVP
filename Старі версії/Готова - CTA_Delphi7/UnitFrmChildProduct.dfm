object frmChildProduct: TfrmChildProduct
  Left = 764
  Top = 176
  AutoSize = True
  BorderStyle = bsSingle
  Caption = #1055#1088#1086#1076#1091#1082#1090#1080
  ClientHeight = 362
  ClientWidth = 515
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
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000777
    7777777777777777777777777777000000000000000000000000000000070F77
    77777777777777777777777777070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FF8
    F8F8F8F8F8F8F8F8F8F8F8F8F7070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FF8
    F8F8F8F8F8F8F8F8F8F8F8F8F7070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FF8
    F8F8F8F8F8F8F8F8F8F8F8F8F7070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FF8
    F8F8F8F8F8F8F8F8F8F8F8F8F7070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FF8
    F8F8F8F8F8F8F8F8F8F8F8F8F7070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FF8
    F8F8F8F8F8F8F8F8F8F8F8F8F7070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FF8
    F8F8F8F8F8F8F8F8F8F8F8F8F7070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FF8
    F8F8F8F8F8F8F8F8F8F8F8F8F7070F8F8F8F8F8F8F8F8F8F8F8F8F8F87070FFF
    FFFFFFFFFFFFFFFFFFFFFFFFFF07000000000000000000000000000000070AAA
    AAAAAAAAAAAAAAAAAAAA090C0B07000000000000000000000000000000000000
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
    Width = 515
    Height = 362
    ActivePage = tsPCedit
    Align = alClient
    TabOrder = 0
    object tsPCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
      object dbnvgr1: TDBNavigator
        Left = 0
        Top = 296
        Width = 507
        Height = 38
        DataSource = DMVFP.DsDBproduct
        Align = alBottom
        TabOrder = 0
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 507
        Height = 225
        Align = alTop
        DataSource = DMVFP.DsDBproduct
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'code_p'
            Title.Caption = #1050#1086#1076
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'code_tp_p'
            Title.Caption = #1050#1086#1076'_'#1087#1088#1086#1076#1091#1082#1090#1091
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_p'
            Title.Caption = #1053#1072#1079#1074#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'price_p'
            Title.Caption = #1062#1110#1085#1072
            Visible = True
          end>
      end
      object btnClearInputField: TButton
        Left = 160
        Top = 264
        Width = 193
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080#1090#1080' '#1081' '#1087#1077#1088#1077#1081#1090#1080' '#1085#1072#1074#1077#1088#1093
        TabOrder = 2
        OnClick = btnClearInputFieldClick
      end
      object btnGoToRecord: TButton
        Left = 50
        Top = 232
        Width = 193
        Height = 25
        Caption = #1055#1077#1088#1077#1081#1090#1080' '#1076#1086' '#1079#1072#1087#1080#1089#1091' '#1079#1072' '#1082#1086#1076#1086#1084
        TabOrder = 3
        OnClick = btnGoToRecordClick
      end
      object edtInputCodeRecord: TEdit
        Left = 266
        Top = 232
        Width = 193
        Height = 21
        TabOrder = 4
      end
    end
    object tsPCsearch: TTabSheet
      Caption = #1055#1086#1096#1091#1082
      ImageIndex = 1
      object lblMessageForInput: TLabel
        Left = 288
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
        Width = 507
        Height = 177
        Align = alTop
        DataSource = DMVFP.DsDBQproduct
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object rgCategorySearch: TRadioGroup
        Left = 56
        Top = 192
        Width = 201
        Height = 105
        BiDiMode = bdLeftToRight
        Caption = #1054#1073#1077#1088#1110#1090#1100' '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
        Color = clAqua
        ItemIndex = 0
        Items.Strings = (
          #1050#1086#1076
          #1050#1086#1076' '#1074#1080#1076#1091' '#1087#1088#1086#1076#1091#1082#1090#1091
          #1053#1072#1079#1074#1072
          #1053#1072#1079#1074#1072' '#1074#1080#1076#1091' '#1087#1088#1086#1076#1091#1082#1090#1091
          #1062#1110#1085#1072' '#1073#1110#1083#1100#1096' '#1088#1110#1074#1085#1072
          #1062#1110#1085#1072' '#1084#1077#1085#1096' '#1088#1110#1074#1085#1072)
        ParentBiDiMode = False
        ParentColor = False
        TabOrder = 1
      end
      object edtInputField: TEdit
        Left = 288
        Top = 200
        Width = 169
        Height = 21
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 2
      end
      object btnSearchData: TButton
        Left = 288
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
        Left = 288
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
