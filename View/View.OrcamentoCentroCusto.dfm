object FOrcamentoCentroCusto: TFOrcamentoCentroCusto
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Orcamento por Centro de Custo'
  ClientHeight = 442
  ClientWidth = 751
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object PanelFundo: TPanel
    Left = 0
    Top = 0
    Width = 751
    Height = 442
    Align = alClient
    BorderStyle = bsSingle
    ParentBackground = False
    TabOrder = 0
    object PanelGridCustos: TPanel
      Left = 1
      Top = 175
      Width = 745
      Height = 214
      Align = alBottom
      TabOrder = 0
      object PanelCamposCustoAdicionar: TPanel
        Left = 1
        Top = 1
        Width = 743
        Height = 48
        Align = alTop
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object ButtonAdicinarCusto: TSpeedButton
          Left = 341
          Top = 16
          Width = 73
          Height = 25
          Caption = 'Adicionar'
          OnClick = ButtonAdicinarCustoClick
        end
        object EditCodigoCentroCusto: TLabeledEdit
          Left = 18
          Top = 20
          Width = 153
          Height = 21
          Color = clInfoBk
          EditLabel.Width = 148
          EditLabel.Height = 13
          EditLabel.Caption = 'Codigo do Centro de Custo'
          MaxLength = 6
          TabOrder = 0
        end
        object EditValorCusto: TLabeledCalcEdit
          Left = 200
          Top = 20
          Width = 121
          Height = 21
          Color = clInfoBk
          TabOrder = 1
          DecimalPlacesAlwaysShown = False
          CalcEditLabel.Width = 84
          CalcEditLabel.Height = 13
          CalcEditLabel.Caption = 'Valor do Custo '
        end
      end
      object GridListaCustos: TDBGrid
        Left = 1
        Top = 48
        Width = 743
        Height = 165
        Align = alBottom
        DataSource = DSListasCustos
        TabOrder = 1
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
            FieldName = 'ValorCusto'
            Visible = True
          end>
      end
    end
    object PanelResumoOrcamentos: TPanel
      Left = 510
      Top = 8
      Width = 220
      Height = 153
      TabOrder = 1
      object GridlResumoOrcamento: TDBGrid
        Left = 1
        Top = 31
        Width = 218
        Height = 121
        Align = alBottom
        DataSource = DSOrcamento
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'Id'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Total'
            Visible = True
          end>
      end
      object PanelTitutoResumoOrcamentos: TPanel
        Left = 1
        Top = 1
        Width = 218
        Height = 32
        Align = alTop
        Caption = 'Orcamentos'
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
    object PanelRodape: TPanel
      Left = 1
      Top = 389
      Width = 745
      Height = 48
      Align = alBottom
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      object ButtonConfirmarOrcamento: TSpeedButton
        Left = 592
        Top = 6
        Width = 136
        Height = 35
        Caption = 'Confirmar Orcamento'
        OnClick = ButtonConfirmarOrcamentoClick
      end
    end
    inline FrameResumoCentroCustoPai: TFrameResumoCentroCustoPai
      Left = 19
      Top = 8
      Width = 248
      Height = 153
      TabOrder = 3
      ExplicitLeft = 19
      ExplicitTop = 8
      ExplicitWidth = 248
      ExplicitHeight = 153
      inherited PanelResumoCentroCustoPai: TPanel
        Width = 248
        Height = 153
        ExplicitWidth = 248
        ExplicitHeight = 153
        inherited GridlResumoCentroCustoPai: TDBGrid
          Top = 30
          Width = 246
        end
        inherited PanelTituloResumoCentroCustoPai: TPanel
          Width = 246
          Height = 32
          ExplicitWidth = 246
          ExplicitHeight = 32
        end
      end
    end
    inline FrameResumoCentroCustoFilho: TFrameTituloResumoCentroCustoFilho
      Left = 275
      Top = 8
      Width = 228
      Height = 153
      TabOrder = 4
      ExplicitLeft = 275
      ExplicitTop = 8
      ExplicitWidth = 228
      ExplicitHeight = 153
      inherited PanelResumoCentroCustoFilho: TPanel
        Width = 228
        Height = 153
        ExplicitWidth = 228
        ExplicitHeight = 153
        inherited GridlResumoCentroCustoFilho: TDBGrid
          Top = 31
          Width = 226
        end
        inherited PanelTituloResumoCentroCustoFilho: TPanel
          Width = 226
          Height = 32
          ExplicitWidth = 226
          ExplicitHeight = 32
        end
      end
      inherited CDSResumoCentroCustoFilho: TClientDataSet
        inherited CDSResumoCentroCustoFilhoCodigoPai: TStringField [0]
        end
        inherited CDSResumoCentroCustoFilhoCodigo: TStringField [1]
        end
      end
    end
  end
  object CDSListaCustos: TClientDataSet
    PersistDataPacket.Data = {
      480000009619E0BD010000001800000002000000000003000000480006436F64
      69676F01004900000001000557494454480200020006000A56616C6F72437573
      746F08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 81
    Top = 361
    object CDSListaCustosCodigo: TStringField
      DisplayLabel = 'Codigo C.C.'
      FieldName = 'Codigo'
      Size = 6
    end
    object CDSListaCustosValorCusto: TFloatField
      DisplayLabel = 'Vr. do Custo'
      FieldName = 'ValorCusto'
      DisplayFormat = '###,##0.00'
    end
  end
  object DSListasCustos: TDataSource
    DataSet = CDSListaCustos
    Left = 161
    Top = 361
  end
  object DSOrcamento: TDataSource
    DataSet = CDSOrcamento
    Left = 569
    Top = 137
  end
  object CDSOrcamento: TClientDataSet
    PersistDataPacket.Data = {
      330000009619E0BD010000001800000002000000000003000000330002496404
      0001000000000005546F74616C08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 96
    object CDSOrcamentoId: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'Id'
    end
    object CDSOrcamentoTotal: TFloatField
      FieldName = 'Total'
      DisplayFormat = '###,##0.000'
    end
  end
end
