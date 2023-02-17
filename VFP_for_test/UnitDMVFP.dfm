object DMVFP: TDMVFP
  OldCreateOrder = False
  Left = 332
  Top = 131
  Height = 531
  Width = 801
  object ADOFoxProDB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=VFPOLEDB.1;Data Source=F:\Practica_IZVP\CTA_Delphi7\dat' +
      'abase_file.dbc;Password="";Collating Sequence=MACHINE'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'VFPOLEDB.1'
    Left = 48
    Top = 24
  end
  object TblDBdish: TADOTable
    Active = True
    Connection = ADOFoxProDB
    CursorType = ctStatic
    TableName = 'dish_table'
    Left = 152
    Top = 24
  end
  object TblDBproduct: TADOTable
    Active = True
    Connection = ADOFoxProDB
    CursorType = ctStatic
    TableName = 'product_table'
    Left = 152
    Top = 200
  end
  object TblDBtype_product: TADOTable
    Active = True
    Connection = ADOFoxProDB
    CursorType = ctStatic
    TableName = 'type_product_table'
    Left = 152
    Top = 80
  end
  object TblDBtype_dish: TADOTable
    Active = True
    Connection = ADOFoxProDB
    CursorType = ctStatic
    TableName = 'type_dish_table'
    Left = 152
    Top = 136
  end
  object TblDBworker: TADOTable
    Active = True
    Connection = ADOFoxProDB
    CursorType = ctStatic
    TableName = 'worker_table'
    Left = 152
    Top = 312
  end
  object TblDBprovider: TADOTable
    Active = True
    Connection = ADOFoxProDB
    CursorType = ctStatic
    TableName = 'provider_table'
    Left = 152
    Top = 376
  end
  object TblDBsupply_product: TADOTable
    Active = True
    Connection = ADOFoxProDB
    CursorType = ctStatic
    TableName = 'supply_product_table'
    Left = 152
    Top = 256
  end
  object TblDBorder: TADOTable
    Active = True
    Connection = ADOFoxProDB
    CursorType = ctStatic
    TableName = 'order_table'
    Left = 152
    Top = 432
  end
  object DsDBdish: TDataSource
    DataSet = TblDBdish
    Left = 272
    Top = 24
  end
  object DsDBtype_product: TDataSource
    DataSet = TblDBtype_product
    Left = 272
    Top = 80
  end
  object DsDBtype_dish: TDataSource
    DataSet = TblDBtype_dish
    Left = 272
    Top = 136
  end
  object DsDBproduct: TDataSource
    DataSet = TblDBproduct
    Left = 272
    Top = 200
  end
  object DsDBsupply_product: TDataSource
    DataSet = TblDBsupply_product
    Left = 272
    Top = 256
  end
  object DsDBworker: TDataSource
    DataSet = TblDBworker
    Left = 272
    Top = 312
  end
  object DsDBprovider: TDataSource
    DataSet = TblDBprovider
    Left = 272
    Top = 376
  end
  object DsDBorder: TDataSource
    DataSet = TblDBorder
    Left = 272
    Top = 432
  end
  object qryDBdish: TADOQuery
    Connection = ADOFoxProDB
    Parameters = <>
    Left = 392
    Top = 24
  end
  object qryDBtype_product: TADOQuery
    Connection = ADOFoxProDB
    Parameters = <>
    Left = 392
    Top = 80
  end
  object qryDBtype_dish: TADOQuery
    Connection = ADOFoxProDB
    Parameters = <>
    Left = 392
    Top = 136
  end
  object qryDBproduct: TADOQuery
    Connection = ADOFoxProDB
    Parameters = <>
    Left = 392
    Top = 200
  end
  object qryDBsupply_product: TADOQuery
    Connection = ADOFoxProDB
    Parameters = <>
    Left = 392
    Top = 264
  end
  object qryDBworker: TADOQuery
    Connection = ADOFoxProDB
    Parameters = <>
    Left = 392
    Top = 320
  end
  object qryDBprovider: TADOQuery
    Connection = ADOFoxProDB
    Parameters = <>
    Left = 392
    Top = 376
  end
  object qryDBorder: TADOQuery
    Connection = ADOFoxProDB
    Parameters = <>
    Left = 392
    Top = 432
  end
  object DsDBQdish: TDataSource
    DataSet = qryDBdish
    Left = 512
    Top = 24
  end
  object DsDBQtype_product: TDataSource
    DataSet = qryDBtype_product
    Left = 512
    Top = 80
  end
  object DsDBQtype_dish: TDataSource
    DataSet = qryDBtype_dish
    Left = 512
    Top = 136
  end
  object DsDBQproduct: TDataSource
    DataSet = qryDBproduct
    Left = 512
    Top = 200
  end
  object DsDBQsupply_product: TDataSource
    DataSet = qryDBsupply_product
    Left = 512
    Top = 264
  end
  object DsDBQworker: TDataSource
    DataSet = qryDBworker
    Left = 512
    Top = 320
  end
  object DsDBQprovider: TDataSource
    DataSet = qryDBprovider
    Left = 512
    Top = 376
  end
  object DsDBQorder: TDataSource
    DataSet = qryDBorder
    Left = 512
    Top = 440
  end
end
