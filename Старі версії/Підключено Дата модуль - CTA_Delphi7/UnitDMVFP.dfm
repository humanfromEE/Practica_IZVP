object DMVFP: TDMVFP
  OldCreateOrder = False
  Left = 442
  Top = 261
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
end
