object FrameResumoCentroCustoPai: TFrameResumoCentroCustoPai
  Left = 0
  Top = 0
  Width = 233
  Height = 167
  TabOrder = 0
  object PanelResumoCentroCustoPai: TPanel
    Left = 0
    Top = 0
    Width = 233
    Height = 167
    Align = alClient
    TabOrder = 0
    object GridlResumoCentroCustoPai: TDBGrid
      Left = 1
      Top = 44
      Width = 231
      Height = 122
      Align = alBottom
      DataSource = DSResumoCentroCustoPai
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'Codigo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Total'
          Visible = True
        end>
    end
    object PanelTituloResumoCentroCustoPai: TPanel
      Left = 1
      Top = 1
      Width = 231
      Height = 36
      Align = alTop
      Caption = 'Resumo Centro de Custo Pai'
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
  object DSResumoCentroCustoPai: TDataSource
    DataSet = CDSResumoCentroCustoPai
    Left = 49
    Top = 113
  end
  object CDSResumoCentroCustoPai: TClientDataSet
    PersistDataPacket.Data = {
      430000009619E0BD010000001800000002000000000003000000430006436F64
      69676F010049000000010005574944544802000200020005546F74616C080004
      00000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 72
    object CDSResumoCentroCustoPaiCodigo: TStringField
      FieldName = 'Codigo'
      Size = 2
    end
    object CDSResumoCentroCustoPaiTotal: TFloatField
      FieldName = 'Total'
    end
  end
end
