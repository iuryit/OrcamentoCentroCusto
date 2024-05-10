object FrameTituloResumoCentroCustoFilho: TFrameTituloResumoCentroCustoFilho
  Left = 0
  Top = 0
  Width = 233
  Height = 167
  TabOrder = 0
  object PanelResumoCentroCustoFilho: TPanel
    Left = 0
    Top = 0
    Width = 233
    Height = 167
    Align = alClient
    TabOrder = 0
    object GridlResumoCentroCustoFilho: TDBGrid
      Left = 1
      Top = 45
      Width = 231
      Height = 121
      Align = alBottom
      DataSource = DSResumoCentroCustoFilho
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
    object PanelTituloResumoCentroCustoFilho: TPanel
      Left = 1
      Top = 1
      Width = 231
      Height = 44
      Align = alTop
      Caption = 'Resumo Centro de Custo Filho'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
    end
  end
  object CDSResumoCentroCustoFilho: TClientDataSet
    PersistDataPacket.Data = {
      610000009619E0BD010000001800000003000000000003000000610006436F64
      69676F010049000000010005574944544802000200140009436F6469676F5061
      69010049000000010005574944544802000200140005546F74616C0800040000
      0000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 96
    Top = 72
    object CDSResumoCentroCustoFilhoCodigo: TStringField
      DisplayWidth = 7
      FieldName = 'Codigo'
    end
    object CDSResumoCentroCustoFilhoCodigoPai: TStringField
      DisplayLabel = 'Pai'
      DisplayWidth = 5
      FieldName = 'CodigoPai'
    end
    object CDSResumoCentroCustoFilhoTotal: TFloatField
      FieldName = 'Total'
    end
  end
  object DSResumoCentroCustoFilho: TDataSource
    DataSet = CDSResumoCentroCustoFilho
    Left = 90
    Top = 113
  end
end
