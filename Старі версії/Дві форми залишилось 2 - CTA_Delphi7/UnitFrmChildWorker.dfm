object frmChildWorker: TfrmChildWorker
  Left = 363
  Top = 120
  AutoSize = True
  BorderStyle = bsSingle
  Caption = #1055#1088#1072#1094#1110#1074#1085#1080#1082#1080
  ClientHeight = 334
  ClientWidth = 550
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
    Width = 550
    Height = 334
    ActivePage = tsPCedit
    Align = alClient
    TabOrder = 0
    object tsPCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
      object dbnvgr1: TDBNavigator
        Left = 0
        Top = 257
        Width = 542
        Height = 49
        DataSource = DMVFP.DsDBworker
        Align = alBottom
        TabOrder = 0
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 542
        Height = 249
        Align = alTop
        DataSource = DMVFP.DsDBworker
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'code_w'
            Title.Caption = ' '#1050#1086#1076
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'fullname_w'
            Title.Caption = ' '#1055#1030#1055
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'number_w'
            Title.Caption = ' '#1053#1086#1084#1077#1088
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'salary_w'
            Title.Caption = ' '#1047#1072#1088#1087#1083#1072#1090#1072
            Visible = True
          end>
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
        Width = 542
        Height = 177
        Align = alTop
        DataSource = DMVFP.DsDBQworker
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
          #1055#1030#1055
          #1053#1086#1084#1077#1088
          #1047#1072#1088#1087#1083#1072#1090#1072' '#1073#1110#1083#1100#1096' '#1088#1110#1074#1085#1072
          #1047#1072#1088#1087#1083#1072#1090#1072' '#1084#1077#1085#1096' '#1088#1110#1074#1085#1072)
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
