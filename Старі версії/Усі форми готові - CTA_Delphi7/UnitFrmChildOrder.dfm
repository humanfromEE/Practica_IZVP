object frmChildOrder: TfrmChildOrder
  Left = 315
  Top = 139
  Width = 790
  Height = 430
  Caption = #1047#1072#1084#1086#1074#1083#1077#1085#1085#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
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
    ActivePage = tsPCsearch
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object tsPCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
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
        Width = 766
        Height = 305
        Align = alTop
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
        Left = 168
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
