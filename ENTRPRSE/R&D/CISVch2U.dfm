object CISVoucher: TCISVoucher
  Left = 616
  Top = 120
  HelpContext = 976
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = ' Voucher'
  ClientHeight = 395
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  Scaled = False
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 14
  object SBSPanel1: TSBSPanel
    Left = 6
    Top = 7
    Width = 562
    Height = 355
    HelpContext = 2123
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    AllowReSize = False
    IsGroupBox = False
    TextId = 0
    object Label81: Label8
      Left = 9
      Top = 63
      Width = 81
      Height = 14
      Alignment = taRightJustify
      Caption = 'Voucher Number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label86: Label8
      Left = 260
      Top = 64
      Width = 115
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Card Number'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label82: Label8
      Left = 10
      Top = 9
      Width = 75
      Height = 38
      AutoSize = False
      Caption = 'HM Revenue && Customs'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      TextId = 0
    end
    object Label85: Label8
      Left = 100
      Top = 20
      Width = 193
      Height = 23
      AutoSize = False
      Caption = 'Construction Industry Scheme'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold, fsItalic]
      ParentFont = False
      TextId = 0
    end
    object Label87: Label8
      Left = 310
      Top = 20
      Width = 244
      Height = 17
      AutoSize = False
      Caption = 'Tax Payment Voucher'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextId = 0
    end
    object Label88: Label8
      Left = 85
      Top = 92
      Width = 2
      Height = 14
      Caption = 'I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label89: Label8
      Left = 97
      Top = 113
      Width = 184
      Height = 33
      AutoSize = False
      Caption = 'complete and certify the voucher in respect of payment to'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      TextId = 0
    end
    object Label810: Label8
      Left = 14
      Top = 326
      Width = 76
      Height = 20
      AutoSize = False
      Caption = 'CIS25'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextId = 0
    end
    object Label811: Label8
      Left = 300
      Top = 92
      Width = 77
      Height = 14
      Alignment = taRightJustify
      Caption = 'National Ins. No.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label812: Label8
      Left = 289
      Top = 169
      Width = 92
      Height = 28
      AutoSize = False
      Caption = 'Covers Payments within the month to'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      TextId = 0
    end
    object Label814: Label8
      Left = 290
      Top = 207
      Width = 85
      Height = 33
      AutoSize = False
      Caption = 'Gross Amount of payment'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      TextId = 0
    end
    object Label815: Label8
      Left = 290
      Top = 244
      Width = 85
      Height = 33
      AutoSize = False
      Caption = 'Less cost of materials'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      TextId = 0
    end
    object Label813: Label8
      Left = 290
      Top = 281
      Width = 85
      Height = 33
      AutoSize = False
      Caption = 'Amount liable to deduction'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      TextId = 0
    end
    object Label816: Label8
      Left = 290
      Top = 323
      Width = 85
      Height = 17
      AutoSize = False
      Caption = 'Amount deducted'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      TextId = 0
    end
    object Label817: Label8
      Left = 96
      Top = 300
      Width = 187
      Height = 17
      AutoSize = False
      Caption = 'Contractor tax reference'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      TextId = 0
    end
    object Label83: Label8
      Left = 301
      Top = 119
      Width = 73
      Height = 14
      Alignment = taRightJustify
      Caption = 'Verification No.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object EAD1F: Text8Pt
      Tag = 1
      Left = 96
      Top = 175
      Width = 187
      Height = 22
      HelpContext = 2128
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
    object EAd2F: Text8Pt
      Tag = 1
      Left = 96
      Top = 198
      Width = 187
      Height = 22
      HelpContext = 2128
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 4
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
    object EAD3F: Text8Pt
      Tag = 1
      Left = 96
      Top = 221
      Width = 187
      Height = 22
      HelpContext = 2128
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 5
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
    object EAD4F: Text8Pt
      Tag = 1
      Left = 96
      Top = 244
      Width = 187
      Height = 22
      HelpContext = 2128
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 6
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
    object EAD5F: Text8Pt
      Tag = 1
      Left = 96
      Top = 267
      Width = 187
      Height = 22
      HelpContext = 2128
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 7
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
    object SNameF: Text8Pt
      Tag = 1
      Left = 96
      Top = 148
      Width = 187
      Height = 22
      HelpContext = 2128
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 80
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      TextId = 0
      ViaSBtn = False
    end
    object Card1F: Text8Pt
      Tag = 1
      Left = 383
      Top = 61
      Width = 128
      Height = 22
      HelpContext = 976
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 5
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 9
      OnExit = VNOFExit
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
    object Card2F: Text8Pt
      Tag = 1
      Left = 383
      Top = 61
      Width = 128
      Height = 22
      HelpContext = 2125
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 10
      OnExit = VNOFExit
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
    object NIF: Text8Pt
      Tag = 1
      Left = 383
      Top = 89
      Width = 128
      Height = 22
      HelpContext = 2126
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 11
      OnExit = VNOFExit
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
    object BehalfF: Text8Pt
      Left = 96
      Top = 89
      Width = 187
      Height = 22
      HelpContext = 2163
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 1
      TextId = 0
      ViaSBtn = False
    end
    object VNOF: Text8Pt
      Tag = 1
      Left = 96
      Top = 61
      Width = 117
      Height = 22
      HelpContext = 2124
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      OnExit = VNOFExit
      TextId = 0
      ViaSBtn = False
    end
    object PayDF: TEditDate
      Left = 383
      Top = 171
      Width = 100
      Height = 22
      HelpContext = 2160
      TabStop = False
      AutoSelect = False
      Color = clBtnFace
      EditMask = '00/00/0000;0;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
      Placement = cpAbove
      AllowBlank = True
    end
    object GrossF: TCurrencyEdit
      Left = 383
      Top = 210
      Width = 100
      Height = 22
      HelpContext = 2161
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '0 ')
      ParentFont = False
      ReadOnly = True
      TabOrder = 14
      WantReturns = False
      WordWrap = False
      AutoSize = False
      BlockNegative = False
      BlankOnZero = False
      DisplayFormat = '###,###,##0 ;###,###,##0-'
      DecPlaces = 0
      ShowCurrency = True
      TextId = 0
      Value = 1E-10
    end
    object MatF: TCurrencyEdit
      Left = 383
      Top = 247
      Width = 100
      Height = 22
      HelpContext = 818
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '0 ')
      ParentFont = False
      ReadOnly = True
      TabOrder = 15
      WantReturns = False
      WordWrap = False
      AutoSize = False
      BlockNegative = False
      BlankOnZero = False
      DisplayFormat = '###,###,##0 ;###,###,##0-'
      DecPlaces = 0
      ShowCurrency = True
      TextId = 0
      Value = 1E-10
    end
    object DedF: TCurrencyEdit
      Left = 383
      Top = 284
      Width = 100
      Height = 22
      HelpContext = 818
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '0 ')
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
      WantReturns = False
      WordWrap = False
      AutoSize = False
      BlockNegative = False
      BlankOnZero = False
      DisplayFormat = '###,###,##0 ;###,###,##0-'
      DecPlaces = 0
      ShowCurrency = True
      TextId = 0
      Value = 1E-10
    end
    object TaxF: TCurrencyEdit
      Left = 383
      Top = 320
      Width = 100
      Height = 22
      HelpContext = 818
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Lines.Strings = (
        '0.00 ')
      ParentFont = False
      ReadOnly = True
      TabOrder = 17
      WantReturns = False
      WordWrap = False
      AutoSize = False
      BlockNegative = False
      BlankOnZero = False
      DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
      ShowCurrency = True
      TextId = 0
      Value = 1E-10
    end
    object ConRefF: Text8Pt
      Left = 96
      Top = 320
      Width = 189
      Height = 22
      HelpContext = 2162
      TabStop = False
      CharCase = ecUpperCase
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 8
      TextId = 0
      ViaSBtn = False
    end
    object VerF: Text8Pt
      Tag = 1
      Left = 383
      Top = 116
      Width = 128
      Height = 22
      HelpContext = 2127
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 13
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 12
      OnExit = VNOFExit
      TextId = 0
      ViaSBtn = False
      GDPREnabled = True
    end
  end
  object OkCP1Btn: TButton
    Tag = 1
    Left = 208
    Top = 369
    Width = 80
    Height = 21
    HelpContext = 2129
    Caption = '&OK'
    ModalResult = 1
    TabOrder = 1
    OnClick = CanCP1BtnClick
  end
  object CanCP1Btn: TButton
    Tag = 1
    Left = 292
    Top = 369
    Width = 80
    Height = 21
    HelpContext = 2130
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
    OnClick = CanCP1BtnClick
  end
end
