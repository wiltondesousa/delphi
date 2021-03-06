object FPesquisaProdutos: TFPesquisaProdutos
  Left = 18
  Top = 132
  Width = 791
  Height = 511
  BorderIcons = [biSystemMenu]
  Caption = 'CONSULTA CADASTRO DE PRODUTOS'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SB: TStatusBar
    Left = 0
    Top = 456
    Width = 783
    Height = 21
    Panels = <
      item
        Width = 150
      end
      item
        Text = 
          'Tipo de Pesquisas:  [ F6 ] - Descri'#231#227'o / [ F7 ] - Refer'#234'ncia / [' +
          ' F8 ] - C'#243'digo de Barras / [ F9 ] - C'#243'digo Interno'
        Width = 50
      end>
    ParentColor = True
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 783
    Height = 46
    Align = alTop
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object BtConsulta: TSpeedButton
      Left = 754
      Top = 18
      Width = 25
      Height = 24
      Cursor = crHandPoint
      Flat = True
      Glyph.Data = {
        F6000000424DF60000000000000076000000280000000E000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888800
        88008888888884EC0800880000004ECC000088788884ECC88000887FFF4ECC8F
        80008870078CC8FF8000878E80778FFF80007FE8E808FFFF80007EFE8E08FFFF
        80007FEFE808FFFF800087FEF08FFFFF8000887708FFFFFF8000887FFFFFFF00
        0000887FFFFFFF8F7800887FFFFFFF8788008877777777788800}
      OnClick = BtConsultaClick
    end
    object Label6: TLabel
      Left = 4
      Top = 3
      Width = 82
      Height = 13
      Caption = 'Pesquisar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object CPesquisa: TComboBox
      Left = 3
      Top = 18
      Width = 154
      Height = 24
      Style = csDropDownList
      Ctl3D = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ItemHeight = 16
      ItemIndex = 0
      ParentColor = True
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Text = 'DESCRI'#199#195'O'
      OnKeyPress = CPesquisaKeyPress
      Items.Strings = (
        'DESCRI'#199#195'O'
        'REFER'#202'NCIA'
        'C'#211'DIGO DE BARRAS'
        'C'#211'DIGO INTERNO')
    end
    object EPesquisa: TMaskEdit
      Left = 157
      Top = 18
      Width = 598
      Height = 24
      CharCase = ecUpperCase
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnChange = EPesquisaChange
      OnEnter = EPesquisaEnter
      OnExit = EPesquisaExit
      OnKeyPress = EPesquisaKeyPress
      OnKeyUp = EPesquisaKeyUp
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 394
    Width = 783
    Height = 62
    Align = alBottom
    BevelInner = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    object Label4: TLabel
      Left = 3
      Top = 44
      Width = 106
      Height = 14
      Caption = 'Descr.Tributa'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText4: TDBText
      Left = 113
      Top = 44
      Width = 245
      Height = 17
      DataField = 'NOME_3'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 378
      Top = 44
      Width = 40
      Height = 14
      Caption = 'Se'#231#227'o:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText3: TDBText
      Left = 420
      Top = 44
      Width = 317
      Height = 17
      DataField = 'NOME_1'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 69
      Top = 25
      Width = 40
      Height = 14
      Caption = 'Marca:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 113
      Top = 25
      Width = 311
      Height = 17
      DataField = 'NOME_2'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 377
      Top = 25
      Width = 41
      Height = 14
      Caption = 'Grupo:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText2: TDBText
      Left = 420
      Top = 25
      Width = 317
      Height = 17
      DataField = 'NOME'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 45
      Top = 4
      Width = 64
      Height = 14
      Caption = 'C'#243'd.Barra:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText7: TDBText
      Left = 113
      Top = 4
      Width = 153
      Height = 17
      DataField = 'CODBARRA'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 350
      Top = 4
      Width = 68
      Height = 14
      Caption = 'Refer'#234'ncia:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText8: TDBText
      Left = 420
      Top = 4
      Width = 105
      Height = 17
      DataField = 'REFERENCIA'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 582
      Top = 4
      Width = 25
      Height = 14
      Caption = 'IAT:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText5: TDBText
      Left = 611
      Top = 4
      Width = 54
      Height = 17
      DataField = 'IAT'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 678
      Top = 4
      Width = 32
      Height = 14
      Caption = 'IPPT:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBText6: TDBText
      Left = 713
      Top = 4
      Width = 54
      Height = 17
      DataField = 'IPPT'
      DataSource = dsPesqProdutos
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl: TPageControl
    Left = 0
    Top = 46
    Width = 783
    Height = 348
    ActivePage = TabSheet1
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Style = tsFlatButtons
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Produtos [ F11 ]'
      object DBGrid: TDBGrid
        Left = 0
        Top = 0
        Width = 775
        Height = 317
        Cursor = crHandPoint
        Align = alClient
        Color = clWhite
        Ctl3D = True
        DataSource = dsPesqProdutos
        FixedColor = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGridDrawColumnCell
        OnEnter = DBGridEnter
        OnKeyPress = DBGridKeyPress
        OnKeyUp = DBGridKeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'CODIGO'
            Title.Caption = 'C'#211'D. INTERNO'
            Width = 102
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO'
            Title.Caption = 'DESCRI'#199#195'O'
            Width = 285
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MED'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Title.Caption = 'ESTOQUE'
            Width = 67
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECOVENDA'
            Title.Caption = 'R$:P.VISTA'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECOPRAZO'
            Title.Caption = 'R$:P.PRAZO'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALIQUOTA'
            Title.Caption = '% Aliq.'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGOCUPOM'
            Title.Caption = 'Posi.Ecf'
            Visible = True
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Grade [ F12 ]'
      ImageIndex = 1
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 775
        Height = 317
        Cursor = crHandPoint
        Align = alClient
        Color = clWhite
        Ctl3D = True
        DataSource = dsPesqGrade
        FixedColor = clTeal
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        OnDrawColumnCell = DBGrid1DrawColumnCell
        OnEnter = DBGrid1Enter
        OnKeyPress = DBGridKeyPress
        OnKeyUp = DBGridKeyUp
        Columns = <
          item
            Expanded = False
            FieldName = 'VARIACAO'
            Title.Caption = 'VARIA'#199#195'O'
            Width = 215
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COR'
            Title.Caption = 'COR'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_TAMANHO'
            Title.Caption = 'TAMANHO'
            Width = 74
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_BARRA'
            Title.Caption = 'C'#211'D. BARRAS'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'REFERENCIA'
            Title.Caption = 'REFER'#202'NCIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MED'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Title.Caption = 'ESTOQUE'
            Width = 69
            Visible = True
          end>
      end
    end
  end
  object dsPesqProdutos: TDataSource
    AutoEdit = False
    DataSet = DM.TPesqProduto
    Left = 352
    Top = 208
  end
  object dsPesqGrade: TDataSource
    DataSet = DM.TPesqGradeProd
    Left = 388
    Top = 208
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 100
    OnTimer = Timer1Timer
    Left = 420
    Top = 209
  end
end
