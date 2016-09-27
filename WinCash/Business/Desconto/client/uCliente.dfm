object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Cliente Desconto'
  ClientHeight = 310
  ClientWidth = 762
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 17
  object label1: TLabel
    Left = 576
    Top = 111
    Width = 82
    Height = 17
    Caption = 'Valor Liquido'
  end
  object Label2: TLabel
    Left = 576
    Top = 55
    Width = 71
    Height = 17
    Caption = 'Valor Bruto'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 55
    Width = 537
    Height = 233
    DataSource = dmCliente.dsItem
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -15
    TitleFont.Name = 'Arial'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DescricaoProduto'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ValorUnitarioBruto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Desconto'
        Width = 64
        Visible = True
      end>
  end
  object btnAdicionarItem: TBitBtn
    Left = 24
    Top = 17
    Width = 113
    Height = 25
    Caption = 'Adicionar Item'
    TabOrder = 1
    OnClick = btnAdicionarItemClick
  end
  object edtValorLiquido: TEdit
    Left = 576
    Top = 134
    Width = 121
    Height = 25
    TabOrder = 2
  end
  object btnAplicarVL: TBitBtn
    Left = 576
    Top = 176
    Width = 161
    Height = 25
    Caption = 'Aplicar valor liquido'
    TabOrder = 3
    OnClick = btnAplicarVLClick
  end
  object edtValorBruto: TEdit
    Left = 576
    Top = 78
    Width = 121
    Height = 25
    TabOrder = 4
  end
  object BitBtn1: TBitBtn
    Left = 576
    Top = 224
    Width = 161
    Height = 25
    Caption = 'Aplicar valor liquido 2'
    TabOrder = 5
    OnClick = BitBtn1Click
  end
end
