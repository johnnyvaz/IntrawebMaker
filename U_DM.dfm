object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 453
  Width = 716
  object FDQMenu: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'Select * from Menu'
      'WHERE IDMODULO=1'
      'Order by Item')
    Left = 184
    Top = 5
    object FDQMenuIDMODULO: TIntegerField
      FieldName = 'IDMODULO'
      Origin = 'IDMODULO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQMenuITEM: TStringField
      FieldName = 'ITEM'
      Origin = 'ITEM'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object FDQMenuDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 50
    end
    object FDQMenuNIVELMENU: TStringField
      FieldName = 'NIVELMENU'
      Origin = 'NIVELMENU'
      Size = 15
    end
    object FDQMenuICONE: TStringField
      FieldName = 'ICONE'
      Origin = 'ICONE'
      Size = 50
    end
    object FDQMenuNOMEFORM: TStringField
      FieldName = 'NOMEFORM'
      Origin = 'NOMEFORM'
      Size = 50
    end
  end
  object ConexaoBD: TFDConnection
    Params.Strings = (
      'Database=C:\IBDB\SISFERRAGENS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'Port=3050'
      'DriverID=FB')
    TxOptions.Isolation = xiDirtyRead
    Connected = True
    LoginPrompt = False
    BeforeConnect = ConexaoBDBeforeConnect
    Left = 16
    Top = 6
  end
  object FDQQuery: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'SELECT * FROM PECAPADRAO')
    Left = 16
    Top = 87
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 104
    Top = 5
  end
  object FDQQuery1: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'Select * from Menu'
      'Order by Item')
    Left = 80
    Top = 87
  end
  object FDQQuery3: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      ''
      'Select * from R1000Empregador'
      'Where Empresa_ID = :Empresa_ID'
      'and Empresa_Filial = :Empresa_Filial'
      '')
    Left = 208
    Top = 80
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EMPRESA_FILIAL'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object FDQEmpresa: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'SELECT * from EMPRESA'
      'ORDER BY EMPRESA_NOME'
      '')
    Left = 336
    Top = 12
    object FDQEmpresaEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
      Origin = 'EMPRESA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEmpresaEMPRESA_FILIAL: TIntegerField
      FieldName = 'EMPRESA_FILIAL'
      Origin = 'EMPRESA_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEmpresaEMPRESA_NOME: TStringField
      FieldName = 'EMPRESA_NOME'
      Origin = 'EMPRESA_NOME'
      Size = 100
    end
    object FDQEmpresaEMPRESA_CNPJ: TStringField
      FieldName = 'EMPRESA_CNPJ'
      Origin = 'EMPRESA_CNPJ'
    end
    object FDQEmpresaEMPRESA_AMBIENTE_ESOCIAL: TIntegerField
      FieldName = 'EMPRESA_AMBIENTE_ESOCIAL'
      Origin = 'EMPRESA_AMBIENTE_ESOCIAL'
    end
    object FDQEmpresaEMPRESA_SENHA_CERTIFICADO: TStringField
      FieldName = 'EMPRESA_SENHA_CERTIFICADO'
      Origin = 'EMPRESA_SENHA_CERTIFICADO'
      Size = 50
    end
    object FDQEmpresaEMPRESA_VIGENCIA_ESOCIAL: TStringField
      FieldName = 'EMPRESA_VIGENCIA_ESOCIAL'
      Origin = 'EMPRESA_VIGENCIA_ESOCIAL'
    end
    object FDQEmpresaEMPRESA_SEQ: TIntegerField
      FieldName = 'EMPRESA_SEQ'
      Origin = 'EMPRESA_SEQ'
    end
  end
  object FDQEmpresaCad: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'SELECT *  FROM EMPRESA'
      'Where EMPRESA_SEQ=:EMPRESA_SEQ')
    Left = 32
    Top = 162
    ParamData = <
      item
        Name = 'EMPRESA_SEQ'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQEmpresaCadEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
      Origin = 'EMPRESA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEmpresaCadEMPRESA_FILIAL: TIntegerField
      FieldName = 'EMPRESA_FILIAL'
      Origin = 'EMPRESA_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEmpresaCadEMPRESA_NOME: TStringField
      FieldName = 'EMPRESA_NOME'
      Origin = 'EMPRESA_NOME'
      Size = 100
    end
    object FDQEmpresaCadEMPRESA_CNPJ: TStringField
      FieldName = 'EMPRESA_CNPJ'
      Origin = 'EMPRESA_CNPJ'
    end
    object FDQEmpresaCadEMPRESA_AMBIENTE_ESOCIAL: TIntegerField
      FieldName = 'EMPRESA_AMBIENTE_ESOCIAL'
      Origin = 'EMPRESA_AMBIENTE_ESOCIAL'
    end
    object FDQEmpresaCadEMPRESA_SENHA_CERTIFICADO: TStringField
      FieldName = 'EMPRESA_SENHA_CERTIFICADO'
      Origin = 'EMPRESA_SENHA_CERTIFICADO'
      Size = 50
    end
    object FDQEmpresaCadEMPRESA_VIGENCIA_ESOCIAL: TStringField
      FieldName = 'EMPRESA_VIGENCIA_ESOCIAL'
      Origin = 'EMPRESA_VIGENCIA_ESOCIAL'
    end
    object FDQEmpresaCadEMPRESA_SEQ: TIntegerField
      FieldName = 'EMPRESA_SEQ'
      Origin = 'EMPRESA_SEQ'
    end
  end
  object FDQEmpresaAux: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'SELECT *  FROM EMPRESA'
      'WHERE EMPRESA_FILIAL = 1'
      'ORDER BY EMPRESA_NOME')
    Left = 256
    Top = 10
    object FDQEmpresaAuxEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
      Origin = 'EMPRESA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEmpresaAuxEMPRESA_FILIAL: TIntegerField
      FieldName = 'EMPRESA_FILIAL'
      Origin = 'EMPRESA_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQEmpresaAuxEMPRESA_NOME: TStringField
      FieldName = 'EMPRESA_NOME'
      Origin = 'EMPRESA_NOME'
      Size = 100
    end
    object FDQEmpresaAuxEMPRESA_CNPJ: TStringField
      FieldName = 'EMPRESA_CNPJ'
      Origin = 'EMPRESA_CNPJ'
    end
    object FDQEmpresaAuxEMPRESA_AMBIENTE_ESOCIAL: TIntegerField
      FieldName = 'EMPRESA_AMBIENTE_ESOCIAL'
      Origin = 'EMPRESA_AMBIENTE_ESOCIAL'
    end
    object FDQEmpresaAuxEMPRESA_SENHA_CERTIFICADO: TStringField
      FieldName = 'EMPRESA_SENHA_CERTIFICADO'
      Origin = 'EMPRESA_SENHA_CERTIFICADO'
      Size = 50
    end
    object FDQEmpresaAuxEMPRESA_VIGENCIA_ESOCIAL: TStringField
      FieldName = 'EMPRESA_VIGENCIA_ESOCIAL'
      Origin = 'EMPRESA_VIGENCIA_ESOCIAL'
    end
    object FDQEmpresaAuxEMPRESA_SEQ: TIntegerField
      FieldName = 'EMPRESA_SEQ'
      Origin = 'EMPRESA_SEQ'
    end
  end
  object FDQUsuarioCad: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'SELECT * FROM USUARIO'
      'WHERE USUARIO_ID=:USUARIO_ID')
    Left = 408
    Top = 3
    ParamData = <
      item
        Name = 'USUARIO_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQUsuarioCadUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQUsuarioCadUSUARIO_NOME: TStringField
      FieldName = 'USUARIO_NOME'
      Origin = 'USUARIO_NOME'
      Size = 50
    end
    object FDQUsuarioCadUSUARIO_EMAIL: TStringField
      FieldName = 'USUARIO_EMAIL'
      Origin = 'USUARIO_EMAIL'
      Size = 100
    end
    object FDQUsuarioCadUSUARIO_ADMIN: TStringField
      FieldName = 'USUARIO_ADMIN'
      Origin = 'USUARIO_ADMIN'
      FixedChar = True
      Size = 1
    end
    object FDQUsuarioCadUSUARIO_SENHA: TStringField
      FieldName = 'USUARIO_SENHA'
      Origin = 'USUARIO_SENHA'
      Size = 50
    end
    object FDQUsuarioCadUSUARIO_ERP: TStringField
      FieldName = 'USUARIO_ERP'
      Origin = 'USUARIO_ERP'
      Size = 50
    end
    object FDQUsuarioCadUSUARIO_DATAULTIMOACESSO: TSQLTimeStampField
      FieldName = 'USUARIO_DATAULTIMOACESSO'
      Origin = 'USUARIO_DATAULTIMOACESSO'
    end
  end
  object FDQUsuario: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'SELECT * FROM EMPRESA_USUARIO A'
      'INNER JOIN USUARIO B ON A.USUARIO_ID = B.USUARIO_ID'
      'WHERE A.EMPRESA_ID = :EMPRESA_ID')
    Left = 496
    Top = 8
    ParamData = <
      item
        Name = 'EMPRESA_ID'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object FDQUsuarioEMPRESA_ID: TIntegerField
      FieldName = 'EMPRESA_ID'
      Origin = 'EMPRESA_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQUsuarioEMPRESA_FILIAL: TIntegerField
      FieldName = 'EMPRESA_FILIAL'
      Origin = 'EMPRESA_FILIAL'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQUsuarioUSUARIO_ID: TIntegerField
      FieldName = 'USUARIO_ID'
      Origin = 'USUARIO_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQUsuarioUSUARIO_ID_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO_ID_1'
      Origin = 'USUARIO_ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object FDQUsuarioUSUARIO_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO_NOME'
      Origin = 'USUARIO_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQUsuarioUSUARIO_EMAIL: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO_EMAIL'
      Origin = 'USUARIO_EMAIL'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object FDQUsuarioUSUARIO_ADMIN: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO_ADMIN'
      Origin = 'USUARIO_ADMIN'
      ProviderFlags = []
      ReadOnly = True
      FixedChar = True
      Size = 1
    end
    object FDQUsuarioUSUARIO_SENHA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO_SENHA'
      Origin = 'USUARIO_SENHA'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQUsuarioUSUARIO_ERP: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO_ERP'
      Origin = 'USUARIO_ERP'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object FDQUsuarioUSUARIO_DATAULTIMOACESSO: TSQLTimeStampField
      AutoGenerateValue = arDefault
      FieldName = 'USUARIO_DATAULTIMOACESSO'
      Origin = 'USUARIO_DATAULTIMOACESSO'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object FDQQuery2: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      '')
    Left = 168
    Top = 128
  end
  object FDQCAD: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'Select * from Menu'
      'Order by Item')
    Left = 328
    Top = 87
  end
  object FDQLISTA: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'Select * from Menu'
      'Order by Item')
    Left = 264
    Top = 87
  end
  object FDQTeste: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'Select * from Menu'
      'Order by Item')
    Left = 400
    Top = 87
  end
  object FDQDET: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'Select * from Menu'
      'Order by Item')
    Left = 456
    Top = 87
  end
  object FDQ_PECAPADRAO: TFDQuery
    Connection = ConexaoBD
    SQL.Strings = (
      'SELECT * FROM PECAPADRAO')
    Left = 48
    Top = 232
  end
end
