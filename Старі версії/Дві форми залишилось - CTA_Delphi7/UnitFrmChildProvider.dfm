object frmChildProvider: TfrmChildProvider
  Left = 381
  Top = 176
  AutoSize = True
  BorderStyle = bsSingle
  Caption = #1055#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1080
  ClientHeight = 342
  ClientWidth = 788
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
    Width = 788
    Height = 342
    ActivePage = tsPCsearch
    Align = alClient
    TabOrder = 0
    object tsPCedit: TTabSheet
      Caption = #1059#1074#1110#1076', '#1088#1077#1076#1072#1075#1091#1074#1072#1085#1085#1103', '#1087#1077#1088#1077#1075#1083#1103#1076
      object dbnvgr1: TDBNavigator
        Left = 0
        Top = 265
        Width = 780
        Height = 49
        DataSource = DMVFP.DsDBprovider
        Align = alBottom
        TabOrder = 0
      end
      object dbgrd1: TDBGrid
        Left = 0
        Top = 0
        Width = 780
        Height = 257
        Align = alTop
        DataSource = DMVFP.DsDBprovider
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'code_pv'
            Title.Caption = ' '#1050#1086#1076
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'number_pv'
            Title.Caption = '  '#1053#1086#1084#1077#1088
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'address_pv'
            Title.Caption = '  '#1040#1076#1088#1077#1089#1072
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'name_pv'
            Title.Caption = '   '#1053#1072#1079#1074#1072
            Visible = True
          end>
      end
    end
    object tsPCsearch: TTabSheet
      Caption = #1055#1086#1096#1091#1082
      ImageIndex = 1
      object lblMessageForInput: TLabel
        Left = 424
        Top = 192
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
        Width = 780
        Height = 177
        Align = alTop
        DataSource = DMVFP.DsDBQprovider
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object rgCategorySearch: TRadioGroup
        Left = 192
        Top = 200
        Width = 201
        Height = 105
        BiDiMode = bdLeftToRight
        Caption = #1054#1073#1077#1088#1110#1090#1100' '#1087#1086#1083#1077' '#1076#1083#1103' '#1087#1086#1096#1091#1082#1091
        Color = clAqua
        ItemIndex = 0
        Items.Strings = (
          #1050#1086#1076
          #1053#1072#1079#1074#1072
          #1053#1086#1084#1077#1088
          #1040#1076#1088#1077#1089#1072)
        ParentBiDiMode = False
        ParentColor = False
        TabOrder = 1
      end
      object edtInputField: TEdit
        Left = 424
        Top = 208
        Width = 169
        Height = 21
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        TabOrder = 2
      end
      object btnSearchData: TButton
        Left = 424
        Top = 240
        Width = 169
        Height = 25
        BiDiMode = bdLeftToRight
        Caption = #1055#1086#1096#1091#1082
        ParentBiDiMode = False
        TabOrder = 3
        OnClick = btnSearchDataClick
      end
      object btnClearForm: TButton
        Left = 424
        Top = 280
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
