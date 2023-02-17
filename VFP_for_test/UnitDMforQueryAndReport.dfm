object DMforQureryAndReport: TDMforQureryAndReport
  OldCreateOrder = False
  Left = 343
  Top = 183
  Height = 462
  Width = 725
  object qryForReportSupplyProductInJanuary: TADOQuery
    Connection = DMVFP.ADOFoxProDB
    Parameters = <>
    SQL.Strings = (
      
        'SELECT code_sp, name_p, price_d, count_sp, ROUND(price_d, count_' +
        'sp) FROM supply_product_table INNER JOIN code_p_sp = code_p WHER' +
        'E date_sp >= DATE(2023, 01, 01) AND date_sp < DATE(2023, 02, 01)')
    Left = 144
    Top = 64
  end
  object dsQryForReportSupplyProductInJanuary: TDataSource
    DataSet = qryForReportSupplyProductInJanuary
    Left = 376
    Top = 64
  end
end
