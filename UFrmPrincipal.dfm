object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Validador de CPF e CNPJ'
  ClientHeight = 143
  ClientWidth = 339
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 17
  object LblDocumento: TLabel
    Left = 200
    Top = 17
    Width = 78
    Height = 17
    Caption = ' Digite o CPF:'
  end
  object RadTipo: TRadioGroup
    Left = 18
    Top = 16
    Width = 167
    Height = 49
    Caption = ' Tipo de Documento:'
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'CPF'
      'CNPJ')
    TabOrder = 0
    OnClick = RadTipoClick
  end
  object EdtDocumento: TMaskEdit
    Left = 200
    Top = 40
    Width = 120
    Height = 25
    Alignment = taCenter
    EditMask = '999.999.999-99;0;_'
    MaxLength = 14
    TabOrder = 1
    Text = ''
  end
  object BtnValidar: TBitBtn
    Left = 18
    Top = 96
    Width = 167
    Height = 33
    Caption = '&Validar'
    Kind = bkHelp
    NumGlyphs = 2
    TabOrder = 2
  end
  object BtnLimpar: TBitBtn
    Left = 203
    Top = 96
    Width = 117
    Height = 33
    Caption = '&Limpar'
    Kind = bkRetry
    NumGlyphs = 2
    TabOrder = 3
    OnClick = BtnLimparClick
  end
end
