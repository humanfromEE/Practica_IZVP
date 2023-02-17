object frmChildDish: TfrmChildDish
  Left = 356
  Top = 180
  AutoSize = True
  BorderStyle = bsSingle
  Caption = #1057#1090#1088#1072#1074#1080
  ClientHeight = 391
  ClientWidth = 782
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
  object PageControlForTabs: TPageControl
    Left = 0
    Top = 0
    Width = 782
    Height = 391
    ActivePage = PCsearch
    Align = alClient
    MultiLine = True
    TabOrder = 0
    object PCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
      object DBGrid2: TDBGrid
        Left = 0
        Top = 0
        Width = 774
        Height = 281
        Align = alTop
        DataSource = DMVFP.DsDBdish
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'code_d'
            Title.Caption = #1050#1086#1076
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'code_td_d'
            Title.Caption = #1050#1086#1076'_'#1074#1080#1076#1091
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'code_p_d'
            Title.Caption = #1050#1086#1076'_'#1087#1088#1086#1076#1091#1082#1090#1091
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_d'
            Title.Caption = #1053#1072#1079#1074#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'composition_d'
            Title.Caption = #1057#1082#1083#1072#1076
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'price_d'
            Title.Caption = #1062#1110#1085#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'weight_d'
            Title.Caption = #1042#1072#1075#1072
            Visible = True
          end>
      end
      object DBNavigator1: TDBNavigator
        Left = 0
        Top = 314
        Width = 774
        Height = 49
        DataSource = DMVFP.DsDBdish
        Align = alBottom
        TabOrder = 1
      end
    end
    object PCsearch: TTabSheet
      Caption = #1055#1086#1096#1091#1082
      ImageIndex = 1
      object lblMessageForInput: TLabel
        Left = 416
        Top = 224
        Width = 90
        Height = 13
        Alignment = taCenter
        Caption = #1059#1074#1077#1076#1110#1090#1100' '#1079#1085#1072#1095#1077#1085#1085#1103
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 774
        Height = 177
        Align = alTop
        DataSource = DMVFP.DsDBQdish
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object rgCategorySearch: TRadioGroup
        Left = 192
        Top = 184
        Width = 201
        Height = 169
        Caption = #1054#1073#1077#1088#1110#1090#1100' '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
        Color = clAqua
        ItemIndex = 0
        Items.Strings = (
          #1050#1086#1076' '#1089#1090#1088#1072#1074#1080
          #1050#1086#1076' '#1087#1088#1086#1076#1091#1082#1090#1091
          #1050#1086#1076' '#1074#1080#1076#1091' '#1089#1090#1088#1072#1074#1091
          #1053#1072#1079#1074#1072' '#1089#1090#1088#1072#1074#1080
          #1053#1072#1079#1074#1072' '#1087#1088#1086#1076#1091#1082#1090#1091
          #1053#1072#1079#1074#1072' '#1074#1080#1076#1091' '#1089#1090#1088#1072#1074#1080
          #1057#1082#1083#1072#1076
          #1062#1110#1085#1072' '#1073#1110#1083#1100#1096' '#1088#1110#1074#1085#1072
          #1062#1110#1085#1072' '#1084#1077#1085#1096' '#1088#1110#1074#1085#1072
          #1042#1072#1075#1072' '#1073#1110#1083#1100#1096' '#1088#1110#1074#1085#1072
          #1042#1072#1075#1072' '#1084#1077#1085#1096' '#1088#1110#1074#1085#1072)
        ParentColor = False
        TabOrder = 1
      end
      object edtInputField: TEdit
        Left = 416
        Top = 240
        Width = 169
        Height = 21
        TabOrder = 2
      end
      object btnSearchData: TButton
        Left = 416
        Top = 272
        Width = 169
        Height = 25
        Caption = #1055#1086#1096#1091#1082
        TabOrder = 3
        OnClick = btnSearchDataClick
      end
      object btnClearForm: TButton
        Left = 416
        Top = 312
        Width = 169
        Height = 25
        Caption = #1054#1095#1080#1089#1090#1080
        TabOrder = 4
        OnClick = btnClearFormClick
      end
    end
  end
end
