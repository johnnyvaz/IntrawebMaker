inherited FrmIndex: TFrmIndex
  OnCreate = IWAppFormCreate
  DesignLeft = 8
  DesignTop = 8
  object Empresa: TIWText [2]
    Left = 24
    Top = 74
    Width = 121
    Height = 17
    BGColor = clMenuBar
    ConvertSpaces = False
    Font.Color = clNone
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'Empresa'
    Lines.Strings = (
      'Empresa')
    RawText = False
    UseFrame = False
    WantReturns = True
  end
  inherited IWTemplateProcessorHTML1: TIWTemplateProcessorHTML
    Left = 56
    Top = 112
  end
end
