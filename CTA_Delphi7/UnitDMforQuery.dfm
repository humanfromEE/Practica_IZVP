object DMforQuery: TDMforQuery
  OldCreateOrder = False
  Left = 392
  Top = 151
  Height = 536
  Width = 565
  object qryName_product_is_dish_head_product_query: TADOQuery
    Connection = DMVFP.ADOFoxProDB
    Parameters = <>
    SQL.Strings = (
      
        'SELECT name_p AS '#1085#1072#1079#1074#1072'_'#1087#1088#1086#1076#1091#1082#1090#1091' FROM product_table WHERE  code_p' +
        ' IN (SELECT code_p  FROM product_table INNER JOIN dish_table ON ' +
        'code_p = code_p_d)')
    Left = 120
    Top = 48
  end
  object dsName_product_is_dish_head_product_query: TDataSource
    DataSet = qryName_product_is_dish_head_product_query
    Left = 384
    Top = 48
  end
  object qryProviders_in_lviv_query: TADOQuery
    Connection = DMVFP.ADOFoxProDB
    Parameters = <>
    SQL.Strings = (
      
        'SELECT code_pv AS '#1082#1086#1076'_'#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072', number_pv AS '#1085#1086#1084#1077#1088'_'#1087#1086#1089#1090#1072#1095#1072#1083 +
        #1100#1085#1080#1082#1072', address_pv AS '#1072#1076#1088#1077#1089#1072'_'#1087#1086#1089#1090#1072#1095#1072#1083#1100#1085#1080#1082#1072', name_pv AS '#1085#1072#1079#1074#1072'_'#1087#1086#1089#1090 +
        #1072#1095#1072#1083#1100#1085#1080#1082#1072' FROM provider_table WHERE  ( address_pv ) LIKE ( "%'#1051#1100#1074 +
        #1110#1074'%" ) OR  ( address_pv ) LIKE ( "%'#1083#1100#1074#1110#1074'%" ) ORDER BY name_pv')
    Left = 120
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = qryName_product_is_dish_head_product_query
    Left = 384
    Top = 48
  end
  object dsProviders_in_lviv_query: TDataSource
    DataSet = qryProviders_in_lviv_query
    Left = 384
    Top = 128
  end
end
