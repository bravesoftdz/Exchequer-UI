object frmIntOther: TfrmIntOther
  Left = 0
  Top = 0
  Width = 633
  Height = 692
  Background.Fixed = False
  HandleTabs = False
  SupportedBrowsers = [brIE, brNetscape6]
  TemplateProcessor = TemplateProcessor
  OnCreate = IWAppFormCreate
  DesignLeft = 366
  DesignTop = 6
  object capDealership: TIWLabel
    Left = 24
    Top = 40
    Width = 75
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Dealership:'
  end
  object lblDealership: TIWLabel
    Left = 176
    Top = 40
    Width = 90
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'ABC Systems'
  end
  object capCustomer: TIWLabel
    Left = 24
    Top = 64
    Width = 66
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Customer:'
  end
  object lblCustomer: TIWLabel
    Left = 176
    Top = 64
    Width = 82
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'MS Systems'
  end
  object capESN: TIWLabel
    Left = 24
    Top = 88
    Width = 34
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'ESN:'
  end
  object lblESN: TIWLabel
    Left = 176
    Top = 88
    Width = 188
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = '123-456-789-012-345-678-901'
  end
  object capVersion: TIWLabel
    Left = 24
    Top = 112
    Width = 53
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Version:'
  end
  object lblhdrPasswords: TIWLabel
    Left = 16
    Top = 192
    Width = 83
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = [fsBold]
    Caption = 'Passwords'
  end
  object cbDate: TIWComboBox
    Left = 176
    Top = 160
    Width = 325
    Height = 21
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ItemsHaveValues = False
    NoSelectionText = ' '
    RequireSelection = True
    ScriptEvents = <>
    OnChange = cbDateChange
    UseSize = True
    DoSubmitValidation = True
    Editable = True
    TabOrder = 0
    ItemIndex = -1
    Sorted = False
  end
  object lblVersion: TIWLabel
    Left = 176
    Top = 112
    Width = 178
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Exchequer Enterprise v5.01'
  end
  object lblDate: TIWLabel
    Left = 24
    Top = 160
    Width = 91
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Security Date:'
  end
  object edPlugIn: TIWEdit
    Left = 176
    Top = 224
    Width = 169
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edPlugIn'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    TabOrder = 9
    PasswordPrompt = False
  end
  object edMCM: TIWEdit
    Left = 176
    Top = 248
    Width = 169
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edMCM'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    TabOrder = 10
    PasswordPrompt = False
  end
  object edDaily: TIWEdit
    Left = 176
    Top = 272
    Width = 169
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edDaily'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    TabOrder = 11
    PasswordPrompt = False
  end
  object edDirectors: TIWEdit
    Left = 176
    Top = 296
    Width = 169
    Height = 21
    Visible = False
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edDirectors'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    TabOrder = 12
    PasswordPrompt = False
  end
  object lblPlugIn: TIWLabel
    Left = 24
    Top = 224
    Width = 48
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Plug-In:'
  end
  object lblMCM: TIWLabel
    Left = 24
    Top = 248
    Width = 37
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'MCM:'
  end
  object lblDaily: TIWLabel
    Left = 24
    Top = 272
    Width = 90
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Daily System:'
  end
  object lblDirectors: TIWLabel
    Left = 24
    Top = 296
    Width = 62
    Height = 16
    Visible = False
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Directors:'
  end
  object lblhdrSecurity: TIWLabel
    Left = 16
    Top = 393
    Width = 145
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = [fsBold]
    AutoSize = False
    Caption = 'Secondary Security'
  end
  object lblResync: TIWLabel
    Left = 24
    Top = 424
    Width = 133
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Resync Companies:'
  end
  object edResync: TIWEdit
    Left = 175
    Top = 424
    Width = 169
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edResync'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 13
    PasswordPrompt = False
  end
  object edResetEnt: TIWEdit
    Left = 176
    Top = 452
    Width = 169
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edResetEnt'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 14
    PasswordPrompt = False
  end
  object edResetPlugIn: TIWEdit
    Left = 177
    Top = 480
    Width = 169
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edResetPlugIn'
    MaxLength = 0
    ReadOnly = True
    Required = False
    ScriptEvents = <>
    TabOrder = 15
    PasswordPrompt = False
  end
  object bnResetEnt: TIWButton
    Left = 360
    Top = 450
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Get Password'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 6
    OnClick = bnResetEntClick
  end
  object bnResetPlugIn: TIWButton
    Left = 360
    Top = 478
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Get Password'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 7
    OnClick = bnResetPlugInClick
  end
  object lblResetPlugIn: TIWLabel
    Left = 24
    Top = 480
    Width = 174
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Reset Plug-In User Counts:'
  end
  object lblResetEnt: TIWLabel
    Left = 24
    Top = 452
    Width = 150
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Reset Ent User Counts:'
  end
  object bnResync: TIWButton
    Left = 360
    Top = 421
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Get Password'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 5
    OnClick = bnResyncClick
  end
  object bnPlugIn: TIWButton
    Left = 362
    Top = 221
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Get Password'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 1
    OnClick = bnPlugInClick
  end
  object bnDaily: TIWButton
    Left = 362
    Top = 271
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Get Password'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 3
    OnClick = bnDailyClick
  end
  object bnDirectors: TIWButton
    Left = 362
    Top = 296
    Width = 137
    Height = 25
    Visible = False
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Get Password'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 4
    OnClick = bnDirectorsClick
  end
  object bnMCM: TIWButton
    Left = 362
    Top = 246
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Get Password'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 2
    OnClick = bnMCMClick
  end
  object bnReturnMain: TIWButton
    Left = 362
    Top = 105
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Return To Main'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 18
    OnClick = bnReturnMainClick
  end
  object capUserName: TIWLabel
    Left = 24
    Top = 136
    Width = 79
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'User Name:'
  end
  object lblUserName: TIWLabel
    Left = 176
    Top = 136
    Width = 95
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Mr User Name'
  end
  object img1: TIWImage
    Left = 16
    Top = 350
    Width = 100
    Height = 25
    ZIndex = 0
    DoSubmitValidation = True
    ScriptEvents = <>
    UseBorder = False
    UseSize = True
    JpegOptions.CompressionQuality = 90
    JpegOptions.Performance = jpBestSpeed
    JpegOptions.ProgressiveEncoding = False
    JpegOptions.Smoothing = True
  end
  object img2: TIWImage
    Left = 120
    Top = 350
    Width = 100
    Height = 25
    ZIndex = 0
    DoSubmitValidation = True
    ScriptEvents = <>
    UseBorder = False
    UseSize = True
    JpegOptions.CompressionQuality = 90
    JpegOptions.Performance = jpBestSpeed
    JpegOptions.ProgressiveEncoding = False
    JpegOptions.Smoothing = True
  end
  object img3: TIWImage
    Left = 224
    Top = 350
    Width = 100
    Height = 25
    ZIndex = 0
    DoSubmitValidation = True
    ScriptEvents = <>
    UseBorder = False
    UseSize = True
    JpegOptions.CompressionQuality = 90
    JpegOptions.Performance = jpBestSpeed
    JpegOptions.ProgressiveEncoding = False
    JpegOptions.Smoothing = True
  end
  object img4: TIWImage
    Left = 328
    Top = 350
    Width = 100
    Height = 25
    ZIndex = 0
    DoSubmitValidation = True
    ScriptEvents = <>
    UseBorder = False
    UseSize = True
    JpegOptions.CompressionQuality = 90
    JpegOptions.Performance = jpBestSpeed
    JpegOptions.ProgressiveEncoding = False
    JpegOptions.Smoothing = True
  end
  object img5: TIWImage
    Left = 432
    Top = 350
    Width = 100
    Height = 25
    ZIndex = 0
    DoSubmitValidation = True
    ScriptEvents = <>
    UseBorder = False
    UseSize = True
    JpegOptions.CompressionQuality = 90
    JpegOptions.Performance = jpBestSpeed
    JpegOptions.ProgressiveEncoding = False
    JpegOptions.Smoothing = True
  end
  object bnLogOut: TIWButton
    Left = 362
    Top = 53
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Logout'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 19
    OnClick = bnLogOutClick
  end
  object lblhdrSpecialFunction: TIWLabel
    Left = 16
    Top = 529
    Width = 145
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = [fsBold]
    AutoSize = False
    Caption = 'Special Functions'
  end
  object lblSFSecCode: TIWLabel
    Left = 24
    Top = 560
    Width = 92
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Security Code'
  end
  object edSFSecCode: TIWEdit
    Left = 175
    Top = 560
    Width = 169
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edResync'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 16
    PasswordPrompt = False
  end
  object edSFPassword: TIWEdit
    Left = 176
    Top = 588
    Width = 169
    Height = 21
    ZIndex = 0
    BGColor = clNone
    DoSubmitValidation = True
    Editable = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    FriendlyName = 'edResetEnt'
    MaxLength = 0
    ReadOnly = False
    Required = False
    ScriptEvents = <>
    TabOrder = 17
    PasswordPrompt = False
  end
  object lblSFPassword: TIWLabel
    Left = 24
    Top = 588
    Width = 66
    Height = 16
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    Caption = 'Password'
  end
  object bnSFGetCode: TIWButton
    Left = 360
    Top = 557
    Width = 137
    Height = 25
    ZIndex = 0
    ButtonType = btButton
    Caption = 'Get Password'
    Color = clBtnFace
    DoSubmitValidation = True
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
    ScriptEvents = <>
    TabOrder = 8
    OnClick = bnSFGetCodeClick
  end
  object lblMCMLast: TIWLabel
    Left = 506
    Top = 249
    Width = 0
    Height = 0
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
  end
  object lblDailyLast: TIWLabel
    Left = 506
    Top = 274
    Width = 0
    Height = 0
    ZIndex = 0
    Font.Color = clNone
    Font.Enabled = True
    Font.Size = 10
    Font.Style = []
  end
  object TemplateProcessor: TIWTemplateProcessorHTML
    Enabled = True
    MasterFormTag = True
    TagType = ttIntraWeb
    Left = 120
    Top = 20
  end
end
