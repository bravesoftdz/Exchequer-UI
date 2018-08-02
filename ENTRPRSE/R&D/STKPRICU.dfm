object Prices: TPrices
  Left = 690
  Top = 205
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Prices'
  ClientHeight = 258
  ClientWidth = 274
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
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
  object Label828: Label8
    Left = 6
    Top = 9
    Width = 54
    Height = 14
    Caption = 'Sales Price'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object Label81: Label8
    Left = 25
    Top = 31
    Width = 35
    Height = 14
    Caption = 'Band A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object Label82: Label8
    Left = 25
    Top = 55
    Width = 35
    Height = 14
    Caption = 'Band B'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object Label83: Label8
    Left = 25
    Top = 79
    Width = 35
    Height = 14
    Caption = 'Band C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object Label84: Label8
    Left = 25
    Top = 103
    Width = 35
    Height = 14
    Caption = 'Band D'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object Label85: Label8
    Left = 25
    Top = 127
    Width = 34
    Height = 14
    Caption = 'Band E'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object Label86: Label8
    Left = 25
    Top = 151
    Width = 34
    Height = 14
    Caption = 'Band F'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object Label87: Label8
    Left = 25
    Top = 175
    Width = 36
    Height = 14
    Caption = 'Band G'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object Label88: Label8
    Left = 25
    Top = 199
    Width = 35
    Height = 14
    Caption = 'Band H'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TextId = 0
  end
  object LabCur2: TLabel
    Left = 69
    Top = 9
    Width = 45
    Height = 14
    Caption = 'Currency'
  end
  object Label4: TLabel
    Left = 185
    Top = 9
    Width = 27
    Height = 14
    Caption = 'Value'
  end
  object LabMg: TLabel
    Left = 225
    Top = 9
    Width = 42
    Height = 14
    Caption = 'Margin%'
  end
  object ClsCP1Btn: TButton
    Left = 87
    Top = 228
    Width = 80
    Height = 22
    Cancel = True
    Caption = 'C&lose'
    TabOrder = 25
    OnClick = ClsCP1BtnClick
  end
  object OKCP1Btn: TButton
    Left = 2
    Top = 228
    Width = 80
    Height = 22
    Caption = '&OK'
    TabOrder = 24
    Visible = False
    OnClick = OKCP1BtnClick
  end
  object P1F: TCurrencyEdit
    Tag = 1
    Left = 121
    Top = 27
    Width = 100
    Height = 22
    TabStop = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.00 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    WantReturns = False
    WordWrap = False
    OnExit = P1FExit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object P2F: TCurrencyEdit
    Tag = 1
    Left = 121
    Top = 51
    Width = 100
    Height = 22
    TabStop = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.00 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    WantReturns = False
    WordWrap = False
    OnExit = P1FExit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object P3F: TCurrencyEdit
    Tag = 1
    Left = 121
    Top = 75
    Width = 100
    Height = 22
    TabStop = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.00 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    WantReturns = False
    WordWrap = False
    OnExit = P1FExit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object P4F: TCurrencyEdit
    Tag = 1
    Left = 121
    Top = 99
    Width = 100
    Height = 22
    TabStop = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.00 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 10
    WantReturns = False
    WordWrap = False
    OnExit = P1FExit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object P5F: TCurrencyEdit
    Tag = 1
    Left = 121
    Top = 123
    Width = 100
    Height = 22
    TabStop = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.00 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 13
    WantReturns = False
    WordWrap = False
    OnExit = P1FExit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object P6F: TCurrencyEdit
    Tag = 1
    Left = 121
    Top = 147
    Width = 100
    Height = 22
    TabStop = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.00 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 16
    WantReturns = False
    WordWrap = False
    OnExit = P1FExit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object P7F: TCurrencyEdit
    Tag = 1
    Left = 121
    Top = 171
    Width = 100
    Height = 22
    TabStop = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.00 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 19
    WantReturns = False
    WordWrap = False
    OnExit = P1FExit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object P8F: TCurrencyEdit
    Tag = 1
    Left = 121
    Top = 195
    Width = 100
    Height = 22
    TabStop = False
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.00 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 22
    WantReturns = False
    WordWrap = False
    OnExit = P1FExit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object C1F: TSBSComboBox
    Tag = 1
    Left = 67
    Top = 27
    Width = 53
    Height = 22
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    MaxLength = 3
    ParentFont = False
    TabOrder = 0
    TabStop = False
    ExtendedList = True
    MaxListWidth = 115
    ReadOnly = True
  end
  object C2F: TSBSComboBox
    Tag = 1
    Left = 67
    Top = 51
    Width = 53
    Height = 22
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    MaxLength = 3
    ParentFont = False
    TabOrder = 3
    TabStop = False
    ExtendedList = True
    MaxListWidth = 115
    ReadOnly = True
  end
  object C3F: TSBSComboBox
    Tag = 1
    Left = 67
    Top = 75
    Width = 53
    Height = 22
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    MaxLength = 3
    ParentFont = False
    TabOrder = 6
    TabStop = False
    ExtendedList = True
    MaxListWidth = 115
    ReadOnly = True
  end
  object C4F: TSBSComboBox
    Tag = 1
    Left = 67
    Top = 99
    Width = 53
    Height = 22
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    MaxLength = 3
    ParentFont = False
    TabOrder = 9
    TabStop = False
    ExtendedList = True
    MaxListWidth = 115
    ReadOnly = True
  end
  object C5F: TSBSComboBox
    Tag = 1
    Left = 67
    Top = 123
    Width = 53
    Height = 22
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    MaxLength = 3
    ParentFont = False
    TabOrder = 12
    TabStop = False
    ExtendedList = True
    MaxListWidth = 115
    ReadOnly = True
  end
  object C6F: TSBSComboBox
    Tag = 1
    Left = 67
    Top = 147
    Width = 53
    Height = 22
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    MaxLength = 3
    ParentFont = False
    TabOrder = 15
    TabStop = False
    ExtendedList = True
    MaxListWidth = 115
    ReadOnly = True
  end
  object C7F: TSBSComboBox
    Tag = 1
    Left = 67
    Top = 171
    Width = 53
    Height = 22
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    MaxLength = 3
    ParentFont = False
    TabOrder = 18
    TabStop = False
    ExtendedList = True
    MaxListWidth = 115
    ReadOnly = True
  end
  object C8F: TSBSComboBox
    Tag = 1
    Left = 67
    Top = 195
    Width = 53
    Height = 22
    Style = csDropDownList
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ItemHeight = 14
    MaxLength = 3
    ParentFont = False
    TabOrder = 21
    TabStop = False
    ExtendedList = True
    MaxListWidth = 115
    ReadOnly = True
  end
  object SRGP1: TCurrencyEdit
    Tag = 1
    Left = 223
    Top = 26
    Width = 43
    Height = 22
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '1.0 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    WantReturns = False
    WordWrap = False
    OnEnter = SRGP1Enter
    OnExit = SRGP1Exit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.0 ;###,###,##0.0-'
    DecPlaces = 1
    ShowCurrency = False
    TextId = 0
    Value = 1
  end
  object SRGP2: TCurrencyEdit
    Tag = 1
    Left = 223
    Top = 51
    Width = 43
    Height = 22
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.0 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    WantReturns = False
    WordWrap = False
    OnEnter = SRGP1Enter
    OnExit = SRGP1Exit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.0 ;###,###,##0.0-'
    DecPlaces = 1
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object SRGP3: TCurrencyEdit
    Tag = 1
    Left = 223
    Top = 75
    Width = 43
    Height = 22
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.0 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    WantReturns = False
    WordWrap = False
    OnEnter = SRGP1Enter
    OnExit = SRGP1Exit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.0 ;###,###,##0.0-'
    DecPlaces = 1
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object SRGP4: TCurrencyEdit
    Tag = 1
    Left = 223
    Top = 99
    Width = 43
    Height = 22
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.0 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 11
    WantReturns = False
    WordWrap = False
    OnEnter = SRGP1Enter
    OnExit = SRGP1Exit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.0 ;###,###,##0.0-'
    DecPlaces = 1
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object SRGP5: TCurrencyEdit
    Tag = 1
    Left = 223
    Top = 123
    Width = 43
    Height = 22
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.0 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 14
    WantReturns = False
    WordWrap = False
    OnEnter = SRGP1Enter
    OnExit = SRGP1Exit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.0 ;###,###,##0.0-'
    DecPlaces = 1
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object SRGP6: TCurrencyEdit
    Tag = 1
    Left = 223
    Top = 147
    Width = 43
    Height = 22
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.0 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 17
    WantReturns = False
    WordWrap = False
    OnEnter = SRGP1Enter
    OnExit = SRGP1Exit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.0 ;###,###,##0.0-'
    DecPlaces = 1
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object SRGP7: TCurrencyEdit
    Tag = 1
    Left = 223
    Top = 171
    Width = 43
    Height = 22
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.0 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 20
    WantReturns = False
    WordWrap = False
    OnEnter = SRGP1Enter
    OnExit = SRGP1Exit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.0 ;###,###,##0.0-'
    DecPlaces = 1
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
  object SRGP8: TCurrencyEdit
    Tag = 1
    Left = 223
    Top = 195
    Width = 43
    Height = 22
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Lines.Strings = (
      '0.0 ')
    ParentFont = False
    ReadOnly = True
    TabOrder = 23
    WantReturns = False
    WordWrap = False
    OnEnter = SRGP1Enter
    OnExit = SRGP1Exit
    AutoSize = False
    BlockNegative = False
    BlankOnZero = False
    DisplayFormat = '###,###,##0.0 ;###,###,##0.0-'
    DecPlaces = 1
    ShowCurrency = False
    TextId = 0
    Value = 1E-10
  end
end
