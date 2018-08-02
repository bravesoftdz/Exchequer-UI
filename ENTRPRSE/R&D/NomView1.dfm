object NViews: TNViews
  Left = 519
  Top = 227
  Width = 673
  Height = 416
  HelpContext = 2131
  Caption = 'General Ledger View'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  PopupMenu = PopupMenu1
  Position = poDefault
  Scaled = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object SBSPanel1: TSBSPanel
    Left = 0
    Top = 328
    Width = 603
    Height = 29
    BevelOuter = bvNone
    TabOrder = 0
    AllowReSize = False
    IsGroupBox = False
    TextId = 0
    object NCurrLab: Label8
      Left = 155
      Top = 10
      Width = 21
      Height = 14
      Caption = '&Curr'
      FocusControl = Currency
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Bevel6: TBevel
      Left = 0
      Top = 0
      Width = 603
      Height = 2
      Align = alTop
    end
    object Label86: Label8
      Left = 377
      Top = 10
      Width = 8
      Height = 14
      Caption = '&V'
      FocusControl = ViewCB1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Panel4: TSBSPanel
      Left = 4
      Top = 7
      Width = 143
      Height = 20
      Hint = 
        'General Ledger Code|Displays the General Ledger Code for the cur' +
        'rently highlighted line.'
      Alignment = taRightJustify
      BevelOuter = bvLowered
      TabOrder = 0
      AllowReSize = False
      IsGroupBox = False
      TextId = 0
      object lblViewCode: Label8
        Left = 2
        Top = 3
        Width = 116
        Height = 14
        AutoSize = False
        Caption = 'View Code :'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
    end
    object TxLateChk: TBorCheck
      Left = 241
      Top = 7
      Width = 129
      Height = 20
      Hint = 
        'Translate Currency|When selected allows a transaction currency t' +
        'o be selected'
      HelpContext = 2134
      Align = alRight
      Caption = '&Translate to currency'
      Color = clBtnFace
      ParentColor = False
      TabOrder = 1
      TabStop = True
      TextId = 0
      OnClick = TxLateChkClick
    end
    object Currency: TSBSComboBox
      Tag = 1
      Left = 177
      Top = 6
      Width = 57
      Height = 22
      Hint = 
        'Set Currency|Selects the currency of the balances to be displaye' +
        'd by the General Ledger'
      HelpContext = 2134
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
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = CurrencyClick
      OnExit = PeriodExit
      ExtendedList = True
      MaxListWidth = 90
      Validate = True
    end
    object OptBtn: TButton
      Left = 507
      Top = 7
      Width = 80
      Height = 21
      Hint = 
        'General Ledger record options|Gives access to options for ammend' +
        'ing General Ledger Records.'
      HelpContext = 2136
      Caption = '&Options'
      TabOrder = 3
      OnClick = OptBtnClick
    end
    object ViewF: TCurrencyEdit
      Tag = 1
      Left = 93
      Top = 6
      Width = 41
      Height = 22
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'ARIAL'
      Font.Style = []
      Lines.Strings = (
        '0 ')
      MaxLength = 3
      ParentFont = False
      TabOrder = 4
      Visible = False
      WantReturns = False
      WordWrap = False
      OnExit = ViewFExit
      AutoSize = False
      BlockNegative = False
      BlankOnZero = False
      DisplayFormat = '###,###,##0 ;###,###,##0-'
      DecPlaces = 0
      ShowCurrency = False
      TextId = 0
      Value = 1E-10
    end
    object ViewCB1: TSBSComboBox
      Tag = 1
      Left = 389
      Top = 6
      Width = 104
      Height = 22
      Hint = 'Set Year|Selects the year to be displayed by the General Ledger'
      HelpContext = 2135
      Style = csDropDownList
      Color = clWhite
      DropDownCount = 15
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ItemHeight = 14
      MaxLength = 4
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnChange = ViewCB1Change
      ExtendedList = True
      MaxListWidth = 200
    end
  end
  object SBSPanel2: TSBSPanel
    Left = 0
    Top = 46
    Width = 1090
    Height = 28
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    AllowReSize = False
    IsGroupBox = False
    TextId = 0
    object Label85: Label8
      Left = 4
      Top = 9
      Width = 67
      Height = 14
      Alignment = taRightJustify
      Caption = 'Last Updated '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label87: Label8
      Left = 477
      Top = 9
      Width = 36
      Height = 14
      Alignment = taRightJustify
      Caption = 'CC/Dep'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label84: Label8
      Left = 225
      Top = 9
      Width = 41
      Height = 14
      Alignment = taRightJustify
      Caption = 'By / Run'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object I1TransDateF: TEditDate
      Left = 74
      Top = 5
      Width = 80
      Height = 22
      HelpContext = 2165
      TabStop = False
      AutoSelect = False
      Color = clBtnFace
      Enabled = False
      EditMask = '00/00/0000;0;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Placement = cpAbove
      AllowBlank = True
    end
    object I2PrYrF: TEditPeriod
      Left = 163
      Top = 5
      Width = 59
      Height = 22
      HelpContext = 2165
      TabStop = False
      AutoSelect = False
      Color = clBtnFace
      Enabled = False
      EditMask = '00/0000;0;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = '011996'
      Placement = cpAbove
      EPeriod = 1
      EYear = 96
      ViewMask = '000/0000;0;'
    end
    object NCCF: Text8Pt
      Left = 518
      Top = 5
      Width = 67
      Height = 22
      HelpContext = 2166
      TabStop = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 2
      TextId = 0
      ViaSBtn = False
    end
    object NOpoF: Text8Pt
      Left = 268
      Top = 5
      Width = 106
      Height = 22
      HelpContext = 2165
      TabStop = False
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
      TextId = 0
      ViaSBtn = False
    end
    object NIICF: TBorCheck
      Left = 380
      Top = 6
      Width = 91
      Height = 20
      HelpContext = 2133
      Caption = 'Use Committed'
      Color = clBtnFace
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 4
      TabStop = True
      TextId = 0
    end
  end
  object AdvDockPanel: TAdvDockPanel
    Left = 0
    Top = 0
    Width = 1090
    Height = 46
    MinimumSize = 3
    LockHeight = False
    Persistence.Location = plRegistry
    Persistence.Enabled = False
    ToolBarStyler = AdvStyler
    UseRunTimeHeight = True
    Version = '2.9.0.0'
    object AdvToolBar: TAdvToolBar
      Left = 3
      Top = 1
      Width = 1084
      Height = 44
      AllowFloating = False
      CaptionFont.Charset = DEFAULT_CHARSET
      CaptionFont.Color = clWindowText
      CaptionFont.Height = -11
      CaptionFont.Name = 'MS Sans Serif'
      CaptionFont.Style = []
      CompactImageIndex = -1
      ShowRightHandle = False
      ShowClose = False
      ShowOptionIndicator = False
      FullSize = True
      TextAutoOptionMenu = 'Add or Remove Buttons'
      TextOptionMenu = 'Options'
      ToolBarStyler = AdvStyler
      ParentOptionPicture = True
      ToolBarIndex = -1
      object AdvToolBarSeparator1: TAdvToolBarSeparator
        Left = 82
        Top = 2
        Width = 10
        Height = 40
        LineColor = clBtnShadow
      end
      object AdvToolBarSeparator2: TAdvToolBarSeparator
        Left = 252
        Top = 2
        Width = 10
        Height = 40
        LineColor = clBtnShadow
      end
      object AdvToolBarSeparator3: TAdvToolBarSeparator
        Left = 555
        Top = 2
        Width = 8
        Height = 40
        LineColor = clBtnShadow
      end
      object AdvToolBarSeparator4: TAdvToolBarSeparator
        Left = 499
        Top = 2
        Width = 10
        Height = 40
        LineColor = clBtnShadow
      end
      object AdvToolBarSeparator5: TAdvToolBarSeparator
        Left = 403
        Top = 2
        Width = 10
        Height = 40
        LineColor = clBtnShadow
      end
      object FullExBtn: TAdvGlowButton
        Left = 2
        Top = 2
        Width = 40
        Height = 40
        Hint = 'Expand All|Opens all folders in the General Ledger'
        FocusType = ftHot
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F40000024D4944415458C3ED554D4F1351143DAFD32160491735A535468DAD0B
          3E0CB04237EAC40A62DC109AAE49E3C618E20F006DCA7FE00F3476035121240D
          35152DA0623421F8917601F603BF9044DA149A5A3AD3E7A2A64C07C7DAF8C6C6
          C8D94C72DF7D73CFBBE7BD738103FCEF20CAC085C1400C142735AA179B9FBA6A
          970774FB52B42B0E00366540576F09F4CA8073A84BD382F3535508B4755AFE6A
          07EA2EC101017DB58417EF32180F7D545DEFB11931DC77543B02A7AC4D18EE55
          2F606AE6B5ED80C9C0A3C7CED74F0225D6BEE4107CB5A5BA6EB736E14AA7E9DF
          B984FB86512856A05A16ECB5F1842981AD6C016B1BB9BD576137626367152F3F
          CC20995E81582C00002CCD769CB6389079B0C479BDDE223302F267EABBDE8AC5
          841F4BEB93A050FDCD131071606E68EE2B73099EAD4F602171676FAE985BD162
          3097865062513EF39F37643861F6E66C5ECF4ADBCFDBAB5848FA2B62AE0E27CE
          9F38F78340BF5CF9B379A3740BC06D664EB8FC2900505AC3ED273784C7C21833
          274CA65F97DBEEEA700200DACD6DE53C8F300A00886C467137721F004CFC7BBE
          9B9913EEEC96CCA9C5602EB75D8E8A58A4F49124728499113572876ADEC3715C
          86D92B9878E3413CB55C11F308A3E5935FF2F52BB7EC4A346F61D6812E6B5FAD
          167C2FEC0EA7F5D5ACF2B741412E462F8708E0284BBD19552B9E122919F9A911
          FD091C3EC76152D40728C1995F9C3C054A061FBA836100E05812884FC773C707
          8EF939F01208BA0134CA96454A302D51E27CE40EAEA8CE0256704DBAB85436DB
          0E9D64A120D96F62C3DBA7D766B69579DF01872AC9F8B2F38F7A000000004945
          4E44AE426082}
        Position = bpLeft
        ShowDisabled = False
        TabOrder = 0
        OnClick = FullExBtnClick
        Appearance.BorderColor = clBtnFace
        Appearance.BorderColorHot = clHighlight
        Appearance.BorderColorDown = clHighlight
        Appearance.BorderColorChecked = clBlack
        Appearance.Color = clBtnFace
        Appearance.ColorTo = clBtnFace
        Appearance.ColorChecked = 12179676
        Appearance.ColorCheckedTo = 12179676
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 11899524
        Appearance.ColorDownTo = 11899524
        Appearance.ColorHot = 15717318
        Appearance.ColorHotTo = 15717318
        Appearance.ColorMirror = clBtnFace
        Appearance.ColorMirrorTo = clBtnFace
        Appearance.ColorMirrorHot = 15717318
        Appearance.ColorMirrorHotTo = 15717318
        Appearance.ColorMirrorDown = 11899524
        Appearance.ColorMirrorDownTo = 11899524
        Appearance.ColorMirrorChecked = 12179676
        Appearance.ColorMirrorCheckedTo = 12179676
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object FullColBtn: TAdvGlowButton
        Left = 42
        Top = 2
        Width = 40
        Height = 40
        Hint = 
          'Collapse All|Closes all folders in the General Ledger to the top' +
          '-level'
        FocusType = ftHot
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000002014944415458C3ED554D4B1B51143D77924127A3410362C48834294A
          BB507111152C06C542B12B450A5DD47D71E72F107F81A53B2994EE4D74111162
          70820A318552C18F2E3464614B5BD058ED24928C795D0856271D92D037063177
          F7CEBD8F7339E7BEFB804ADCF7203D30301A8C83E181497CF14860C4731D10F2
          4ACC230700B71E10CA6D81550F8C4D749A4A18091468E05147E3AD2A50760B2A
          0D580B15C40E4EF136F4D530EF75DB31F9B4D9BC061E3A254C0E1B13386A4473
          1570C822BC1EB17C16E863FF471ACB5BC786798F53C2B30EC7DD19C2BCCF2814
          CF32330987DD22FD9705FA3856B3D8FF9ECEC35F2AB3A8DBFB08D2320000B5A5
          0DBB536FF82BA07FA6ABCE35B8963E008C1949BE2E87634F4CB1C0157C8F9685
          B982750C88D686637D5C87B026B107D7E2BB6207AFF76CB06786EB2674AEFA41
          2C57FCF4137BCD7CBE696E9BD0FEE5D3152607234055F53FEBD3AFC690FB7608
          008E9498EAE2B609C55F47A5FB76C19AB8CD404E924BBF63C1A9955703BF5BDB
          51B7B379F9E647068AB992D1B2D92D6E0AFCEC7F5EEA0E9EAF573E9F10AF0618
          40EAA03704C2100090CD06964AFDE5BB7E26242D9AD02D29D1043705086039C2
          0B103601DC20BF712624198451498926B8FF86F670EC48D66C3E46980670A24B
          6BC4C86FD184EEDA95A862B88AB959323E6E5193878F01AD5160A4AAE7E276C3
          C6C699BEEE0FE615ABCB2648E3690000000049454E44AE426082}
        Position = bpRight
        ShowDisabled = False
        TabOrder = 1
        OnClick = FullExBtnClick
        Appearance.BorderColor = clBtnFace
        Appearance.BorderColorHot = clHighlight
        Appearance.BorderColorDown = clHighlight
        Appearance.BorderColorChecked = clBlack
        Appearance.Color = clBtnFace
        Appearance.ColorTo = clBtnFace
        Appearance.ColorChecked = 12179676
        Appearance.ColorCheckedTo = 12179676
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 11899524
        Appearance.ColorDownTo = 11899524
        Appearance.ColorHot = 15717318
        Appearance.ColorHotTo = 15717318
        Appearance.ColorMirror = clBtnFace
        Appearance.ColorMirrorTo = clBtnFace
        Appearance.ColorMirrorHot = 15717318
        Appearance.ColorMirrorHotTo = 15717318
        Appearance.ColorMirrorDown = 11899524
        Appearance.ColorMirrorDownTo = 11899524
        Appearance.ColorMirrorChecked = 12179676
        Appearance.ColorMirrorCheckedTo = 12179676
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object GraphBtn: TAdvGlowButton
        Left = 92
        Top = 2
        Width = 40
        Height = 40
        Hint = 
          'Show Graph|Displays the Graph window for the G/L account or head' +
          'ing currently selected'
        FocusType = ftHot
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B474400FF00FF00FFA0BDA79300000091494441545809636018
          05233D04186912007BAEAC069A1B02C498C84507C54E264C15F4151975000B46
          80EFB9F21F430C22B086C1452714C2A41E391A05A32130E02180990B0825F0FD
          176518FEB1586255C6F4E73883A3FE13AC723804597088E3160659FEFFFF2AAC
          0AFEB18401C541C53090220E0D78148C3A6034044643603404464360C04380B8
          1A6354D5700E0100F56D131C9033746D0000000049454E44AE426082}
        Position = bpLeft
        ShowDisabled = False
        TabOrder = 2
        OnClick = HistBtnClick
        Appearance.BorderColor = clBtnFace
        Appearance.BorderColorHot = clHighlight
        Appearance.BorderColorDown = clHighlight
        Appearance.BorderColorChecked = clBlack
        Appearance.Color = clBtnFace
        Appearance.ColorTo = clBtnFace
        Appearance.ColorChecked = 12179676
        Appearance.ColorCheckedTo = 12179676
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 11899524
        Appearance.ColorDownTo = 11899524
        Appearance.ColorHot = 15717318
        Appearance.ColorHotTo = 15717318
        Appearance.ColorMirror = clBtnFace
        Appearance.ColorMirrorTo = clBtnFace
        Appearance.ColorMirrorHot = 15717318
        Appearance.ColorMirrorHotTo = 15717318
        Appearance.ColorMirrorDown = 11899524
        Appearance.ColorMirrorDownTo = 11899524
        Appearance.ColorMirrorChecked = 12179676
        Appearance.ColorMirrorCheckedTo = 12179676
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object HistBtn: TAdvGlowButton
        Left = 132
        Top = 2
        Width = 40
        Height = 40
        Hint = 
          'Show G/L History|Displays period and year-to-date balances for t' +
          'he General Ledger record or group selected'
        FocusType = ftHot
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B474400FF00FF00FFA0BDA7930000057E494441545809ED566D
          4C5367143EF7DEB65C28588A16ACA844654EA593B90113338D42823F44E84C74
          4B962C247324FBD088CEC589CE26359A198C5B24D1853F332EC338E326B8F9C5
          E423C62966BA4DA94E9481B25654A820741D6DEFBBF3DEDE5BEFED0722FB6BF3
          3EF79CF39CF39EF7E97DEF17C0F3DFFF3C035BEA0A8BB7D417148DB58D66AC13
          6D361BEB7FA5650730E413C2C09B63EDC33CCBC4F6DED62C2042C9BFFEA1E2E6
          3F0F65BB066EEBA5F94EB4ED04E0A41060EA765A7F76603CAA312A01B77ACF2F
          00607763C7F908E87C78155ADA0F814070494A8401D946566037D84B1BAE84A5
          22C211051042988EBED6CF0890AD389343888301067A06BAA0E1C60118F6FF03
          1CABB91F10FC2998546EA91F08D8B62F3F8BDB841E26A38D50D3F0A4EDF04ADD
          F809295F6B39DD5ACCB108E03549302121034CFA6930D56881D9690BA0FD412B
          2C7F699DDE9ABD7ED0C0A75EB9F3C8E1F60786D3B09E459D058BDAA7CD2EB0E6
          D4357DE708201731620A78FD9D8935377B2EE6CC4ACBD368357C7C6AE20C7171
          1D170F0C23EA017D5C3258CC8B01454272FCC4B8C9C9B3262F9AF1561AAFD5FF
          72FBC1AF465C4D87C812749E492DDF76D6A11F31A26EC1D6FA828F701FF7D2EA
          C438E385F505DFE46A393EA6585A170E57FFAD8EFDE7DE4F10883051CC31F0C1
          F6E2B3FB445F7108FE1505613B5A948A8BEF9028CFDBB9F614E5E2151515B06F
          5F441FA9FC89311B32A7BFBBE0CB7E643C08C0AB60E7A7470BC78BBEE21021C0
          AF0DACC37C1202E6A6175E9A9C3C7B26F565701C07959595E076BB652AA69D6A
          9CF3A2C5BCA4552A30703A5221F921A312401F2E982903FCE13EF758E76EC843
          5735E8E20CC3405555958A8F15BCF1F2C7B90CB03D629E40199E09D5B6AB04F8
          5E3D87F73B31D3E24C53CE0D2D17174F7D258C46236CDAB409F6ECD903DDDDDD
          CA54545FC7F1FAE913E6DD9092E95B8F17CE977CD1A804E0532E94CCCD283688
          15510E6BD6AC0193C90476BB3D4A3692CACB281E27B38408A13528A7128077D7
          244A5298C765A6511B0D3CCFC3B66DDBA0A6A606CACBCB2110887A8B87A69A0D
          339FF46298F450021D950010C0849C3812E352524427C6818A58BAFA05B8439A
          A1B1B1314655904EE255BD52836CF0A81240586620480378FD8383B21F6E5D2E
          9778062ED6774357EB306467678797A862EFF090A21709AD418B54021810EE51
          92A26FC8F590DA70747676427E7EBE78011E3AF03D5CFFFD2FF17A08AF53C6BD
          9EBF43BD08C33A953995002280434E5EB97B4A5528F3656565E0743AA1B6B616
          8A8A8A647A447BF9EE09975CC090276B504E2540EB25A790F422E09AAB31743D
          D058467575351C397204AC56AB4C3DD55E7335CB17A1C7ABE3CE2827A804D856
          350DE283E2275AE0F50D592E779FBC407D252C160B94949428A911FD4B5DC7CF
          E32B7B0E2DC227D08F554B4F0F515F864A0025054EB0A3151070EC8F2FCC5EDF
          E37EEA8F051EDFC0A3E36D7BA74873056059DA5B0A832642C08E654DBF01905A
          9A16045F4675F37B3703C4EFA3F1B380CEA96E5E7D4B10FC920072D0BEACE16A
          788F0801B4C0C7731FA2BD8E807EEF83DC5D6756390687DD7D341E0D06BDEEDE
          5DA7573A1E7B7B73A4FA360DC7AF957C95C16D51C5A1C0766C71A69FE55AF06C
          9829892FA7BED7324AAF2D9D539EA761753CE5C2E11786BD271CFB5B2F75D559
          F0732E45CA3B350CBBD056DCD021C52A135300ADAAAC2F486708F3037E7ACBFF
          84D21E43BCA96D4A72D690D930438B02C1D5DFE1BBEB6ED3E3D9CAC28204843C
          2E6A046E85ADF48C5326C2ED88026871C5E1FCF8043E6123C3908D1827224633
          1EE3DDF4B92649D86D5BD224DED6B1263D55803C71F3C98566D6A72DC7B81431
          0F116D5C46B24EC30A5FD99635DD43FFA963D402949D361F2B4C6358920124F8
          ED805FA92EAD4FD3695B71FABEB2EEB93F9A33F01F56BBC356DBAFF895000000
          0049454E44AE426082}
        Position = bpMiddle
        ShowDisabled = False
        TabOrder = 3
        OnClick = HistBtnClick
        Appearance.BorderColor = clBtnFace
        Appearance.BorderColorHot = clHighlight
        Appearance.BorderColorDown = clHighlight
        Appearance.BorderColorChecked = clBlack
        Appearance.Color = clBtnFace
        Appearance.ColorTo = clBtnFace
        Appearance.ColorChecked = 12179676
        Appearance.ColorCheckedTo = 12179676
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 11899524
        Appearance.ColorDownTo = 11899524
        Appearance.ColorHot = 15717318
        Appearance.ColorHotTo = 15717318
        Appearance.ColorMirror = clBtnFace
        Appearance.ColorMirrorTo = clBtnFace
        Appearance.ColorMirrorHot = 15717318
        Appearance.ColorMirrorHotTo = 15717318
        Appearance.ColorMirrorDown = 11899524
        Appearance.ColorMirrorDownTo = 11899524
        Appearance.ColorMirrorChecked = 12179676
        Appearance.ColorMirrorCheckedTo = 12179676
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object ReconBtn: TAdvGlowButton
        Left = 172
        Top = 2
        Width = 40
        Height = 40
        Hint = 
          'Show Reconciliation screen|Displays list of transactions which c' +
          'an be reconciled'
        FocusType = ftHot
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B474400FF00FF00FFA0BDA793000002DA494441545809ED564D
          685341109E7DD15A9A7830050FFEB4088237F1921F7F2EDAD04BF3D394C69F5A
          DB0822C583527AD15BAE5E447BF0A245B188686A9B3FF5207810252D5A3C796F
          0D1EAD4893A069F3C66F9F647969AB4DCD1305136677676627F3CD9B9D9DF788
          1ABFFF290381C9B03F980CEE373FB36616ACE001B09598C44A5F5DC96090053F
          D675EDB93FEDDF59D9B7340080EF00C01B7FA2FB762C1653BE0389509FD0B549
          80360916773281CC47F0066D32664CD767BE4510F723B01B22C13471C9B32522
          FFB44CB417A86DE0F7BD3DF0AE844C5C0824BA4F32D33DE86C00BF9AEE99BA0C
          5E91A6380B98A7A1D44B8074C2559E580C01FC35138D43B661DC4887A7AE60AD
          2295018D458E8927AA766B1074E2ACD90C4FF8AA2B11EA85BF14C00F1A7BCCB7
          32E1E430320C95A151D3AA62513B7532FE647888996F12F1EC9350D2BD16789D
          10EBFFBD2B19EE411D587ACCEBA3FEC2A2D107909C9FF781D1E9E22E5DD87E54
          2D2C6B25547BEEA2B7695ADAFF4E1F50B7C08A462483C0391F41CB7D06DE01E7
          59DC3B3778A30F64BA13ABAEA2E5152AFB0002E8057809E032A336927D600D70
          0486DB29670C2B8E006E1435FA804AC5DF60163B0F6D5F89BB964EDA585E8405
          9F2724CACBF3799F7B4002C8913FE639035D6EB1C37542CAE6A1DE8666653D3C
          EB7C1CA5DD8C77C0D8A2CFF595482BE3168CC1E766415A18EB430C452A80D1E9
          9217D76744EDD4C8C8D7F1B0A7F95AC5DCDEDA3E5058F8A0E32DD88F6F830744
          6049C84CDFB73BDB0689662AA6C6AA02D005EF46E4BD867603133A6195B588C7
          CB1C89448B9FE6F6B01087094ED113B22DCEF641B957650C414686C55A2A2CCC
          9D02B8B7E29589DC85CFF3A72BB279457066B17E3EDFE1EAC753DF25227440C2
          1168F846D6FB20A316C459C78B9971F08AFE4006C45178B7A19E52F6D642D4FE
          65298A0C24A48E047760AD22CB03B03BDBCF0361C4B1AD1811F1F725313BBBE4
          7016E4F51BB1975BCE61AF41FF5606BE03A555273023C6E2BA0000000049454E
          44AE426082}
        Position = bpMiddle
        ShowDisabled = False
        TabOrder = 4
        OnClick = ReconBtnClick
        Appearance.BorderColor = clBtnFace
        Appearance.BorderColorHot = clHighlight
        Appearance.BorderColorDown = clHighlight
        Appearance.BorderColorChecked = clBlack
        Appearance.Color = clBtnFace
        Appearance.ColorTo = clBtnFace
        Appearance.ColorChecked = 12179676
        Appearance.ColorCheckedTo = 12179676
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 11899524
        Appearance.ColorDownTo = 11899524
        Appearance.ColorHot = 15717318
        Appearance.ColorHotTo = 15717318
        Appearance.ColorMirror = clBtnFace
        Appearance.ColorMirrorTo = clBtnFace
        Appearance.ColorMirrorHot = 15717318
        Appearance.ColorMirrorHotTo = 15717318
        Appearance.ColorMirrorDown = 11899524
        Appearance.ColorMirrorDownTo = 11899524
        Appearance.ColorMirrorChecked = 12179676
        Appearance.ColorMirrorCheckedTo = 12179676
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object NomSplitBtn: TAdvGlowButton
        Left = 212
        Top = 2
        Width = 40
        Height = 40
        Hint = 
          'Generate ObjectClone|Displays a clone General Ledger which can b' +
          'e used to compare different periods, years or currencies'
        FocusType = ftHot
        Picture.Data = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F400000006624B474400FF00FF00FFA0BDA793000002A1494441545809ED544D
          68134114FE76DDEA264DAB45688A6943151A8D7AF520422A4528F6201868113C
          B407BDF873D19B570F2278F02AF82F145344DB434184185BB18882AD5A8395B8
          DA462CB635FF314D4CB2CEA464936C66D69B0AEE30EFCDF7BE37EFCDCB9BEC00
          E6F8DF3B20E81BD07D78FC3AE18E12594F8437E3822A0C3D19ED1BA51B9207F6
          78894DE336529B2339C2DFB1F95F1C23AB36450D55C0208146871337C841EA11
          0AA808AA384056C211CD9F34E710748355008BD38501AA2068FB045241DD0636
          B14E4F4B7AA2DA1E38B415BBB6B768946F4C41F0434CB3594074EF46433FBDC1
          356F31F8163FEF0DAF190C6D58003DBC7B6F9B161678B6F8FB025AED903C3D5A
          4C5E436C20B2E93FC79A05981D303BF0D73B60F810D1978F3E3EE557E1DD5CB4
          0CB96B81BC7CD9F3E7347F71E99B8659C0B000FAEC526105F238757909F9093F
          CF5DC7FFDB57E07048F0EC93D1DC2422FC258FC06406998C5AF72BAA899CD586
          B95E2FA29D5DB04423E8F28F615358A9DE5283B91D903708E8EB9571FBAA0F67
          4F5DC2E7D0347AF65B6A8259C6FB83FD985616F0F4C4714CDDB88619EF20F216
          7E9CC84A4239BB5DC2A7D03C665F7F443AB58AFB2313E874365097A17CDFE642
          D8378C7C2A85D8CC2BAC280A126D1DDC186E018964015BDA5B616D944BC13BDC
          4EC4E2C512365256D2F626F7CED216C96683B5DD094B9CFFF570BF8268B48890
          22E3E2E59358FCBA820EA703E30F33A5C446CAF5E801D2A7CF201A9E47A3C301
          D79B97B04496B921DC0268C4D4F355CC064534DB36E3F1641AD99CF11F90C6B4
          2C84E0B9720149BB037220024B2C4269AEB00AA07DD6AE269128828A3E83A0AA
          745F89565581E04A715236035A48C959AB0AB526A01D54E5B84570251B3118F3
          0720DC2DF3E4FC11820947347FD29C37610EB303BA0EFC02EA27C8A0F4540305
          0000000049454E44AE426082}
        Position = bpRight
        ShowDisabled = False
        TabOrder = 5
        OnClick = NomSplitBtnClick
        Appearance.BorderColor = clBtnFace
        Appearance.BorderColorHot = clHighlight
        Appearance.BorderColorDown = clHighlight
        Appearance.BorderColorChecked = clBlack
        Appearance.Color = clBtnFace
        Appearance.ColorTo = clBtnFace
        Appearance.ColorChecked = 12179676
        Appearance.ColorCheckedTo = 12179676
        Appearance.ColorDisabled = 15921906
        Appearance.ColorDisabledTo = 15921906
        Appearance.ColorDown = 11899524
        Appearance.ColorDownTo = 11899524
        Appearance.ColorHot = 15717318
        Appearance.ColorHotTo = 15717318
        Appearance.ColorMirror = clBtnFace
        Appearance.ColorMirrorTo = clBtnFace
        Appearance.ColorMirrorHot = 15717318
        Appearance.ColorMirrorHotTo = 15717318
        Appearance.ColorMirrorDown = 11899524
        Appearance.ColorMirrorDownTo = 11899524
        Appearance.ColorMirrorChecked = 12179676
        Appearance.ColorMirrorCheckedTo = 12179676
        Appearance.ColorMirrorDisabled = 11974326
        Appearance.ColorMirrorDisabledTo = 15921906
        Appearance.GradientHot = ggVertical
        Appearance.GradientMirrorHot = ggVertical
        Appearance.GradientDown = ggVertical
        Appearance.GradientMirrorDown = ggVertical
        Appearance.GradientChecked = ggVertical
      end
      object Panel1: TPanel
        Left = 509
        Top = 2
        Width = 46
        Height = 39
        BevelOuter = bvNone
        TabOrder = 8
        object YTDChk: TBorCheck
          Left = 2
          Top = 10
          Width = 46
          Height = 20
          Hint = 
            'Show YTD|When selected shows balances upto and including the cur' +
            'rent period, otherwise shows balance for period only'
          Align = alRight
          Caption = 'YT&D'
          Color = clBtnFace
          Checked = True
          ParentColor = False
          State = cbChecked
          TabOrder = 0
          TabStop = True
          TextId = 0
          OnClick = YTDChkClick
        end
      end
      object Panel2: TPanel
        Left = 563
        Top = 2
        Width = 86
        Height = 39
        BevelOuter = bvNone
        TabOrder = 9
        object ClsI1Btn: TButton
          Left = 2
          Top = 10
          Width = 80
          Height = 21
          HelpContext = 24
          Cancel = True
          Caption = 'C&lose'
          ModalResult = 2
          TabOrder = 0
          OnClick = ClsI1BtnClick
        end
      end
      object Panel3: TPanel
        Left = 262
        Top = 2
        Width = 141
        Height = 39
        BevelOuter = bvNone
        TabOrder = 6
        object Label82: Label8
          Left = 2
          Top = 14
          Width = 30
          Height = 14
          Caption = '&Period'
          FocusControl = Period
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          TextId = 0
        end
        object Label81: Label8
          Left = 86
          Top = 13
          Width = 4
          Height = 14
          Caption = '-'
          FocusControl = Period
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          TextId = 0
        end
        object Period: TSBSComboBox
          Left = 35
          Top = 10
          Width = 48
          Height = 22
          Hint = 
            'Set Period|Selects the period to be displayed by the General Led' +
            'ger'
          Style = csDropDownList
          Color = clWhite
          DropDownCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 14
          MaxLength = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = CurrencyClick
          OnExit = PeriodExit
          OnKeyPress = YearKeyPress
          AllowChangeInExit = True
          MaxListWidth = 0
        end
        object ToPeriod: TSBSComboBox
          Tag = 1
          Left = 93
          Top = 10
          Width = 48
          Height = 22
          Hint = 
            'Set Period|Selects the period to be displayed by the General Led' +
            'ger'
          Style = csDropDownList
          Color = clWhite
          DropDownCount = 2
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 14
          MaxLength = 2
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Visible = False
          OnClick = CurrencyClick
          OnExit = PeriodExit
          OnKeyPress = YearKeyPress
          AllowChangeInExit = True
          MaxListWidth = 0
        end
      end
      object Panel6: TPanel
        Left = 413
        Top = 2
        Width = 86
        Height = 39
        BevelOuter = bvNone
        TabOrder = 7
        object Label83: Label8
          Left = 2
          Top = 14
          Width = 23
          Height = 14
          Caption = '&Year'
          FocusControl = Year
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          Transparent = True
          TextId = 0
        end
        object Year: TSBSComboBox
          Tag = 1
          Left = 29
          Top = 10
          Width = 57
          Height = 22
          Hint = 'Set Year|Selects the year to be displayed by the General Ledger'
          Style = csDropDownList
          Color = clWhite
          DropDownCount = 2
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 14
          MaxLength = 4
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = CurrencyClick
          OnExit = PeriodExit
          OnKeyPress = YearKeyPress
          AllowChangeInExit = True
          MaxListWidth = 0
        end
      end
    end
  end
  object ScrollBox1: TScrollBox
    Left = 4
    Top = 75
    Width = 1086
    Height = 250
    BorderStyle = bsNone
    TabOrder = 4
    object NLDPanel: TSBSPanel
      Left = 0
      Top = 1
      Width = 354
      Height = 19
      Alignment = taLeftJustify
      BevelOuter = bvLowered
      Caption = '  General Ledger View Accounts'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      AllowReSize = False
      IsGroupBox = False
      TextId = 0
      Purpose = puBtrListColumnHeader
      object lblTBDiff: Label8
        Left = 222
        Top = 2
        Width = 83
        Height = 14
        Alignment = taRightJustify
        AutoSize = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Visible = False
        TextId = 0
      end
    end
    object NLCrPanel: TSBSPanel
      Left = 357
      Top = 1
      Width = 131
      Height = 19
      Alignment = taRightJustify
      BevelOuter = bvLowered
      Caption = 'Debit  '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      AllowReSize = False
      IsGroupBox = False
      TextId = 0
      Purpose = puBtrListColumnHeader
    end
    object NLDrPanel: TSBSPanel
      Left = 492
      Top = 1
      Width = 131
      Height = 19
      Alignment = taRightJustify
      BevelOuter = bvLowered
      Caption = 'Credit  '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      AllowReSize = False
      IsGroupBox = False
      TextId = 0
      Purpose = puBtrListColumnHeader
    end
    object NLOLine: TSBSOutlineB
      Left = 0
      Top = 23
      Width = 1056
      Height = 222
      OnExpand = NLOLineExpand
      OnCollapse = NLOLineCollapse
      Options = [ooDrawTreeRoot]
      ItemHeight = 16
      ItemSpace = 6
      OnDrawItem = NLOLineDrawItem
      BarColor = clHighlight
      BarTextColor = clHighlightText
      HLBarColor = clBlack
      HLBarTextColor = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      Color = clWhite
      TabOrder = 3
      OnMouseUp = NLOLineMouseUp
      ItemSeparator = '\'
      PictureMinus.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100001F2E00001F2E00000001000000000000C4852900C281
        3300B1835000C29C7000CEA16900D8AB6900DAB07300DDB27100DBB37800DBB4
        7A00DBB47B00DCB67D00DCB67E00DCB67F00DCB77F002A23EB003731EC00453F
        EE00524CEF005F5AF0006D68F1007A75F200FF00FF00A891B700CDAF8E00DCB7
        8000DCB88000DCB88100DCB88200DDB98300D3B59000E3BD8400E4BE8500E1BE
        8A00E2C08F00E7C38E00E7C48E00E5C39000E4C59800E4C69A00E4C79B00E4C8
        9E00E9CA9D00DBC4AD00DEC6AF00D3C0BE00E5C9A000E6C8AC00ECD3AE00E0CB
        BA00EED5B100EDD5B200ECD7B800EDD9BB008F86E6009D95E6009591F500A19C
        F100A29FF600AFADF800BBB7F600BCBAF900DDCED200EEDCC100E8DACB00F1E0
        C800F3E2CA00F6E3C900F2E5D100F2E1D800F1E3DA00F9ECDA00FAEDDD00D3CC
        EF00D6D2F400D7D4F700EFE8EB00FAF1E400FBF2E500FBF3E700FBF5EB00FCF4
        E900FCF4EB00E4E2FA00FDF7F100FDF8F100FDF9F300FDFAF500FEFAF500FEFB
        F700F2F1FE00FEFCF800FEFCF900FEFCFA00FEFDFC00FFFEFD00FFFFFF000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000161616161616
        1616161616161616161616161616161616161616161616161616161600000000
        0000000000000000161616003D383B60383838383B5A3A38001616003F3F3F3F
        3F443D3813113A3F001616002A1F234D3441100F0F0F1320001616003025244E
        3534564B0F0F1033001616002205074F190D311112390F2C0016160052484350
        5D5C15104A3E144C00161600280821551C2D0F37273206090016160059544E58
        5F5E535C57475156001616002E19265B1D1D1C1B29420B19001616001C1B0C1B
        1D1D1C1C1A0A0E1B0016160001010101010104021E033617001616002F454545
        45454618402B3C49001616160000000000000000000000001616}
      PictureOpen.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000202E0000202E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF7473767473767473767473767473767473767473767473767473767473
        76747376747376747376FF00FFFF00FF1382D71382D71382D71382D71382D713
        82D71382D71382D71382D71382D71382D71382D71382D7747376FF00FF1382D7
        1382D737C8FD2ABFFC19B3FB1AAEFA1BAAFA1BAAFA1AACFA1AB1FB18B6FC17BD
        FD1382D71382D7747376FF00FF1382D750D0FE52CBFD53C5FC4DBDFB32ADF91D
        A0F81DA0F81CA4F91BABFA19B2FB17BAFC1382D71382D77473761382D71382D7
        51CEFE52C8FC53C1FB55BBFB56B5F949ABF8269DF71DA1F81BA9FA19B1FB18BA
        FC1382D71382D77473761382D752C8FD51CDFE53C6FC54C0FB55BAFB56B5FA57
        B3F956B6FA44B4FA30B3FA24B7FB1382D71382D71382D77473761382D750D0FE
        51CEFE52C8FC53C3FB54BEFB55BBFB55BAFB55BCFB54C0FB53C5FC52CBFD1382
        D750D0FE1382D77473761382D750D0FE50CFFE51CCFD52C7FC53C4FC53C2FB53
        C2FB53C4FC52C7FC51CCFD50CFFE1382D750D0FE1382D77473761382D71382D7
        1382D71382D71382D71382D71382D71382D71382D71382D71382D71382D71382
        D744BEFB1382D7747376FF00FFFF00FF1382D750D0FE50CEFE51CAFD53C6FC53
        C3FC53C2FC53C2FC53C5FC52C9FD50CDFE50D0FE1382D7747376FF00FFFF00FF
        1382D73AA9F93AA9F93AA8F83AA7F81382D71382D71382D71382D71382D71382
        D71382D71382D7FF00FFFF00FFFF00FF1382D71382D71382D71382D71382D713
        82D7E312FEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      PictureClosed.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000202E0000202E00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF7473767473767473767473767473767473767473767473767473767473
        76747376747376FF00FFFF00FFFF00FF1382D71382D71382D71382D71382D713
        82D71382D71382D71382D71382D71382D71382D7747376FF00FFFF00FF1382D7
        1DC2FD16BFFD17BAFC19B5FB19B2FB1AB0FB1AB1FB19B4FB18B9FC16BEFD16C0
        FD1382D7747376FF00FFFF00FF1382D750D0FE4ACAFD36BEFC1EAFFA1BAAF91C
        A8F91BA9F91AADFA19B2FB18BAFC16C0FD1382D7747376FF00FFFF00FF1382D7
        50CFFE52CAFD53C4FB51BDFB2FAAF91E9FF81DA1F81CA6F91AAEFA18B6FB16BD
        FD1382D7747376FF00FFFF00FF1382D750CEFE52C8FD53C1FB55BBFB56B5FA42
        A8F8229DF71DA2F81BAAFA19B3FB17BBFD1382D7747376FF00FFFF00FF1382D7
        50CEFE52C7FD53C1FB55BBFB56B5FA57B1F953B2F939ADF922ADFA19B2FB17BB
        FD1382D7747376FF00FFFF00FF1382D750CEFE52C9FD53C2FC54BDFB56B8FA56
        B6FA56B7FA55BBFB53C1FB47C3FC3BC7FD1382D7747376FF00FFFF00FF1382D7
        50CFFE51CBFD53C6FC53C1FB54BDFB55BCFB54BDFB53C0FB53C4FC51CAFD50CF
        FE1382D7747376FF00FFFF00FF1382D750D0FE50CEFE51CAFD53C6FC53C3FC53
        C2FC53C2FC53C5FC52C9FD50CDFE50D0FE1382D7747376FF00FFFF00FF1382D7
        3AA9F93AA9F93AA8F83AA7F81382D71382D71382D71382D71382D71382D71382
        D71382D7FF00FFFF00FFFF00FFFF00FF1382D71382D71382D71382D71382D7FF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      PictureLeaf.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100001F2E00001F2E0000000100000000000094551000BA73
        0800C3852700C4852900B5824200C99D6300D7A96400D2A06D00D8AB6900D9AE
        6E00DCB16F00DAAF7100DAB07100DDB27200DAB17400DBB37800DBB47B00DCB6
        7E002A23EB003731EC004E44DF006D5BC400524CED005F59EF005F5AF0006B65
        F2006C67F0006D68F100987FAB00FF00FF00AF939E00CFAB8100DCB78000DCB8
        8100DCB88200DDB98300DDB98400DFBC8800D4BB9F00E3BD8400E0BC8600E4BE
        8600C1A8AA00CFB7AD00DFB9A100DABFA400E5C28E00E0C09100E3C19000E1C1
        9200E1C29300E7C69700E4C59800E5C99E00E9C99900E8CA9E00DFC7B300E9CB
        A100E9CDA500EBCEA500EACEA700EAD0AA00E8D0AC00EBD1AC00EBD2AF00F1D6
        AD00F1D7AF00E7CAB800ECD6B600EDDBBF00F3DCBA00A292C800BCACC900A19D
        F700ABA3E700AFABF600AFACF600C8B5C000EEDCC100E7D7CE00F5E2C600F7E7
        D000FAEDDC00FAEEDF00D2CBE700D6D1F300D6D2F300FBF0E300FBF2E700FCF4
        EA00FCF5EC00FDF6EE00FDF7F000FEFCF800FEFCF900FEFDFB00FEFDFC00FFFE
        FD00FFFFFE00FFFFFF0000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000000000000000000000001D1D1D1D1D1D
        1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D1D0303030303
        03030303030303031D1D035D545634593052283B360D410A031D036013132A5B
        0F570B3933064227031D03604A12135510590E3C37084629031D0361224C1213
        48172D3F3A09502E031D036223604712121216383D0C5133031D03622361224B
        121B12144F4D5337031D0363236222602B5D15121713583A031D036323622361
        215E201A12125A3D031D036324622362225F1F1B18185C40031D034E324E324E
        31452F353E114425031D03010101010101020405041E1C01031D032C2C2C2C2C
        2C43002600491907031D1D030303030303030303030303031D1D}
      PictureLeaf2.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100001F2E00001F2E00000001000000000000BA730800C485
        2900C48B3600BE884500B1835000BD926600C6914500C7975400CA9A5400D6A5
        5B00D7A96500D9AF6F00D9AF7000DAB17300DBB37700DBB37800DBB47A00DBB5
        7C00DCB57D00DCB67D00DCB67F00DCB77F00352DED00FF00FF008E7DCC008E7E
        CF00B48F8000D1AC8C00CDB08F00DCB78000DCB88100DCB88200DDB98300DDB4
        9800E3BD8400CCB5B900E4C08A00E7C38E00E6C59400E7C89B00EACA9800E8C9
        9C00E8C99D00EBCC9E00EACFA800EAD0AA00EBD1AC00F1D6AD00F1D7AF00EBD4
        B200ECD5B500ECD6B500ECD6B600ECD7B900ECD8B900ECD8BA00EDD9BB00EDDA
        BD00F2D9B300A693C400AA9CD700B6A8D5009288E400948EEF00ADA7EC00BAB2
        E900AEAAF400C1AFC900C5AFC800CEBAC500C5B8DB00D2C5DA00F2DFC300F5E0
        C200F2E1C700F3E1C800F3E4CF00F6E5CD00F4E4CE00F7EAD700F9EAD600F9EA
        D700F7EAD900F9EAD800F9EDDD00FAEEDD00FAEEDE00D4CBE700FAEFE000FAF0
        E200FBF2E600FAF2E700FCF3E700FCF5EB00FCF5EC00FCF6EE00FDF7F000FDF8
        F100FDF8F200FDF9F300FDF9F400FDFAF600FEFBF800FEFCF800FEFCF900FEFC
        FA00FEFCFB00FEFDFB00FEFDFC00FFFEFD00FFFFFE0000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000171717171717
        1717171717171717171717171717171717171717171717171717171701010101
        010101010101010117171701252F2F545C58534D492F2F28011717013B183B48
        100E0D0B27220909011717013A2F2F59605E5A56502F2F30011717013C193B4A
        1412100E2C22090A011717014743234F383533314B28242A0117170157464552
        393836344E2B292D01171701403E3D4C1E1D151332260C0F01171701645D5563
        6D6A676563515C6201171701423F415B201F1E1D372E1115011717016C666168
        6E6D6C69675F656B01171701000000000000020706081A030117170121212121
        21211B04051C1644011717170101010101010101010101011717}
      PictureLeaf3.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100001F2E00001F2E00000001000000000000FF00FF009895
        93009E9C9A00A5A2A100ABA9A700B2B0AE00B8B6B500BFBDBC00C5C3C200CCCA
        C900D2D1D000D8D7D700DFDEDD00E5E5E400ECEBEB00F2F2F200F9F8F800FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000001010101
        0101010101010101000000010401010A0D0D0D0801010101010000010C040102
        1011100201010106010000010D0F0201051106010101060D010000010D110C01
        010501010102100D010000010D11110901010101010C110D010000010D111111
        040101010611110D010000010D11110C010101010F11110D010000010D111002
        010101010711110D010000010D11060101010201010B110D010000010D0A0101
        0103100501020E0D010000010A020101010D11100201040C0100000102010101
        050D0D0D09010104010000000101010101010101010101010000}
      PictureLeaf4.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        080000000000000100001F2E00001F2E00000001000000000000CE8F2000CF90
        2000D0912000D0922000D1922000D2952000D5992100D69A2100D5992200D99F
        2500D0942B00D1962E00D3982E00D79F2E00C08D3900C08E3900C18F3900C18F
        3D00C4923900C4933A00C6963B00C7983C00C8983C00C9993D00C99A3D00C99A
        3E00C99B3E00D39A3500D39B3900DAA02400DEA62700DFAA3400E0A92900E1A9
        2900E0AB3500AF8B5200B08F5900B3915400C2914000C3944700C3954700C69B
        5500C69C5500D7A44A00D8A64D00DDAC4B00DEAD4C00D9A85100D9A95500DAAB
        5800DEB46900E3BC7400FF00FF0095939200E4C08100E8C99000E8CA9000EBD2
        A400EED9B200F1DEBA00F4E5CB00F6EAD500F6EBD500F7ECD600FCF8F100FFFF
        FF00000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000343434343434
        3434343434343434343434343434343434343434343434343434343435353535
        353535353535353534343435230E0F1012141517181A1825353434350E000003
        071D091E20212119353434350F000003072E413B2221211A353434350F000002
        062D41413F22201835343435260A000105083341413F1F173534343528394141
        414141414141381635343435283A4141414141414141371435343435282F2B2B
        2B1B3641413E0D133534343528313131313240413D0C04103534343528313131
        3132413C2C1C0B11353434352731313131312B30313131273534343524292A2A
        2A2A2A2A2A2A2924353434343535353535353535353535353434}
      ParentFont = False
      ScrollBars = ssVertical
      ShowValCol = 2
      OnNeedValue = NLOLineNeedValue
      OnUpdateNode = NLOLineUpdateNode
      TreeColor = clNavy
      Data = {FF00}
    end
    object NLBudgetPanel: TSBSPanel
      Left = 627
      Top = 1
      Width = 131
      Height = 19
      Alignment = taRightJustify
      BevelOuter = bvLowered
      Caption = 'Budget  '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      AllowReSize = False
      IsGroupBox = False
      TextId = 0
      Purpose = puBtrListColumnHeader
    end
    object NLRevisedPanel: TSBSPanel
      Left = 762
      Top = 1
      Width = 131
      Height = 19
      Alignment = taRightJustify
      BevelOuter = bvLowered
      Caption = 'Revised  '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      AllowReSize = False
      IsGroupBox = False
      TextId = 0
      Purpose = puBtrListColumnHeader
    end
    object NLVariancePanel: TSBSPanel
      Left = 897
      Top = 1
      Width = 131
      Height = 19
      Alignment = taRightJustify
      BevelOuter = bvLowered
      Caption = 'Variance  '
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      AllowReSize = False
      IsGroupBox = False
      TextId = 0
      Purpose = puBtrListColumnHeader
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 321
    Top = 124
    object Record1: TMenuItem
      Caption = '&G/L View Account Records'
      object Edit1: TMenuItem
        Tag = 2
        Caption = '&Edit'
        HelpContext = 227
        Hint = 
          'Choosing this option allows you to edit the currently highlighte' +
          'd G/L line.'
        OnClick = Edit1Click
      end
      object Add1: TMenuItem
        Tag = 1
        Caption = '&Add'
        HelpContext = 228
        Hint = 
          'Choosing this option allows you to add a new General Ledger reco' +
          'rd within the currently open heading.'
        OnClick = Edit1Click
      end
      object Delete1: TMenuItem
        Tag = 3
        Caption = '&Delete'
        Hint = 
          'Choosing this option allows you to delete the currently highligh' +
          'ted G/L line.'
        OnClick = Delete1Click
      end
      object DeleteAll1: TMenuItem
        Caption = 'Delete A&ll'
        OnClick = DeleteAll1Click
      end
      object Copy1: TMenuItem
        Caption = 'Cop&y Main G/L Structure'
        OnClick = Copy1Click
      end
    end
    object Add2: TMenuItem
      Tag = 1
      Caption = '&Add G/L View Account'
      HelpContext = 228
      Hint = 
        'Choosing this option allows you to add a new General Ledger reco' +
        'rd within the currently open heading.'
      OnClick = Edit1Click
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object Check1: TMenuItem
      Caption = 'Refresh G/L View Totals'
      object CheckThis1: TMenuItem
        Caption = '&Refresh Current View'
        OnClick = Check1Click
      end
      object CheckAll1: TMenuItem
        Tag = -1
        Caption = 'Refresh &All Views'
        OnClick = Check1Click
      end
    end
    object N8: TMenuItem
      Caption = '-'
    end
    object ViewCtrl1: TMenuItem
      Caption = 'G/L View &Ctrl Records'
      object Edit2: TMenuItem
        Tag = 2
        Caption = '&Edit'
        OnClick = Edit2Click
      end
      object Add3: TMenuItem
        Tag = 1
        Caption = '&Add'
        OnClick = Edit2Click
      end
      object Delete2: TMenuItem
        Tag = 3
        Caption = '&Delete'
        OnClick = Edit2Click
      end
      object Copy2: TMenuItem
        Tag = 7
        Caption = 'Cop&y'
        OnClick = Edit2Click
      end
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object MIHist: TMenuItem
      Caption = '&History'
      HelpContext = 180
      Hint = 
        'Displays period and year-to-date balances for the General Ledger' +
        ' record or group selected'
      OnClick = HistBtnClick
    end
    object Graph1: TMenuItem
      Caption = '&Graph'
      HelpContext = 182
      Hint = 
        'Displays the Graph window for the G/L account or heading current' +
        'ly selected'
      OnClick = HistBtnClick
    end
    object MIFind: TMenuItem
      Caption = '&Find'
      Hint = 
        'Finds a specified General Ledger Code, and makes it the curret l' +
        'ine, expanding any headings it is contained within.'
      OnClick = MIFindClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Move1: TMenuItem
      Caption = '&Move - From (Pick up)     '
      HelpContext = 737
      ShortCut = 16461
      OnClick = Move1Click
    end
    object Move2: TMenuItem
      Caption = '&Move - To (Put down)'
      HelpContext = 737
      ShortCut = 16461
      OnClick = Move1Click
    end
    object CanlMove1: TMenuItem
      Caption = 'Cancel Mo&ve'
      HelpContext = 737
      Visible = False
      OnClick = Move1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object Expand1: TMenuItem
      Caption = '&Expand'
      object MIETL: TMenuItem
        Tag = 1
        Caption = '&This Level'
        Hint = 'Opens the currently highlighted folder (heading).'
        OnClick = MIEALClick
      end
      object MIEAL: TMenuItem
        Tag = 2
        Caption = '&All Levels'
        Hint = 
          'Opens the currently highlighted folder (heading), and any sub le' +
          'vels within it.'
        OnClick = MIEALClick
      end
      object EntireGeneralLedger1: TMenuItem
        Tag = 3
        Caption = '&Entire General Ledger'
        Hint = 'Opens the entire General Ledger.'
        OnClick = MIEALClick
      end
    end
    object MIColl: TMenuItem
      Caption = '&Collapse'
      object MICTL: TMenuItem
        Tag = 4
        Caption = '&This Level'
        Hint = 'Closes the currently highlighted folder (heading).'
        OnClick = MIEALClick
      end
      object EntireGeneralLedger2: TMenuItem
        Tag = 5
        Caption = '&Entire General Ledger'
        Hint = 'Closes the entire General Ledger'
        OnClick = MIEALClick
      end
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object ObjectClone1: TMenuItem
      Caption = '&ObjectClone'
      HelpContext = 173
      Hint = 
        'Displays a clone General Ledger which can be used to compare dif' +
        'ferent periods, years or currencies.'
      OnClick = NomSplitBtnClick
    end
    object ObjectClone2: TMenuItem
      Caption = 'O&bjectClone Difference'
      Visible = False
      OnClick = ObjectClone2Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object ShowC1: TMenuItem
      Caption = '&Show Carry Forwards'
      Hint = 
        'Displays all carry forward (F type) General Ledger records, whic' +
        'h are used for reporting purposes.'
      Visible = False
      OnClick = ShowC1Click
    end
    object Show1: TMenuItem
      Caption = 'Show Account T&ypes'
      OnClick = Show1Click
    end
    object ShowG1: TMenuItem
      Caption = 'Sho&w G/L View Codes'
      OnClick = ShowG1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object PropFlg: TMenuItem
      Caption = '&Properties'
      HelpContext = 65
      Hint = 'Access Colour & Font settings'
      OnClick = PropFlgClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object StoreCoordFlg: TMenuItem
      Caption = '&Save Coordinates'
      HelpContext = 177
      Hint = 'Make the current window settings permanent'
      OnClick = StoreCoordFlgClick
    end
    object N3: TMenuItem
      Caption = '-'
      Enabled = False
      Visible = False
    end
  end
  object AdvStyler: TAdvToolBarOfficeStyler
    Style = bsCustom
    BorderColorHot = clHighlight
    ButtonAppearance.Color = clBtnFace
    ButtonAppearance.ColorTo = clBtnFace
    ButtonAppearance.ColorChecked = clBtnFace
    ButtonAppearance.ColorCheckedTo = 5812223
    ButtonAppearance.ColorDown = 11899524
    ButtonAppearance.ColorDownTo = 9556991
    ButtonAppearance.ColorHot = 15717318
    ButtonAppearance.ColorHotTo = 9556223
    ButtonAppearance.BorderDownColor = clNavy
    ButtonAppearance.BorderHotColor = clNavy
    ButtonAppearance.BorderCheckedColor = clNavy
    ButtonAppearance.CaptionFont.Charset = DEFAULT_CHARSET
    ButtonAppearance.CaptionFont.Color = clWindowText
    ButtonAppearance.CaptionFont.Height = -11
    ButtonAppearance.CaptionFont.Name = 'Segoe UI'
    ButtonAppearance.CaptionFont.Style = []
    CaptionAppearance.CaptionColor = clHighlight
    CaptionAppearance.CaptionColorTo = clHighlight
    CaptionAppearance.CaptionBorderColor = clHighlight
    CaptionAppearance.CaptionColorHot = clHighlight
    CaptionAppearance.CaptionColorHotTo = clHighlight
    CaptionAppearance.CaptionTextColorHot = clBlack
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -11
    CaptionFont.Name = 'Segoe UI'
    CaptionFont.Style = []
    ContainerAppearance.LineColor = clBtnShadow
    ContainerAppearance.Line3D = True
    Color.Color = clBtnFace
    Color.ColorTo = clBtnFace
    Color.Direction = gdVertical
    ColorHot.Color = 15717318
    ColorHot.ColorTo = 15717318
    ColorHot.Direction = gdVertical
    CompactGlowButtonAppearance.BorderColor = 12179676
    CompactGlowButtonAppearance.BorderColorHot = clHighlight
    CompactGlowButtonAppearance.BorderColorDown = clHighlight
    CompactGlowButtonAppearance.BorderColorChecked = clBlack
    CompactGlowButtonAppearance.Color = 15653832
    CompactGlowButtonAppearance.ColorTo = 12179676
    CompactGlowButtonAppearance.ColorChecked = 12179676
    CompactGlowButtonAppearance.ColorCheckedTo = 12179676
    CompactGlowButtonAppearance.ColorDisabled = 15921906
    CompactGlowButtonAppearance.ColorDisabledTo = 15921906
    CompactGlowButtonAppearance.ColorDown = 11899524
    CompactGlowButtonAppearance.ColorDownTo = 11899524
    CompactGlowButtonAppearance.ColorHot = 15717318
    CompactGlowButtonAppearance.ColorHotTo = 15717318
    CompactGlowButtonAppearance.ColorMirror = 12179676
    CompactGlowButtonAppearance.ColorMirrorTo = 12179676
    CompactGlowButtonAppearance.ColorMirrorHot = 15717318
    CompactGlowButtonAppearance.ColorMirrorHotTo = 15717318
    CompactGlowButtonAppearance.ColorMirrorDown = 11899524
    CompactGlowButtonAppearance.ColorMirrorDownTo = 11899524
    CompactGlowButtonAppearance.ColorMirrorChecked = 12179676
    CompactGlowButtonAppearance.ColorMirrorCheckedTo = 12179676
    CompactGlowButtonAppearance.ColorMirrorDisabled = 11974326
    CompactGlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    CompactGlowButtonAppearance.GradientHot = ggVertical
    CompactGlowButtonAppearance.GradientMirrorHot = ggVertical
    CompactGlowButtonAppearance.GradientDown = ggVertical
    CompactGlowButtonAppearance.GradientMirrorDown = ggVertical
    CompactGlowButtonAppearance.GradientChecked = ggVertical
    DockColor.Color = clBtnFace
    DockColor.ColorTo = clBtnFace
    DockColor.Direction = gdHorizontal
    DockColor.Steps = 128
    DragGripStyle = dsNone
    FloatingWindowBorderColor = clHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = []
    GlowButtonAppearance.BorderColor = clBtnFace
    GlowButtonAppearance.BorderColorHot = clHighlight
    GlowButtonAppearance.BorderColorDown = clHighlight
    GlowButtonAppearance.BorderColorChecked = clBlack
    GlowButtonAppearance.Color = clBtnFace
    GlowButtonAppearance.ColorTo = clBtnFace
    GlowButtonAppearance.ColorChecked = 12179676
    GlowButtonAppearance.ColorCheckedTo = 12179676
    GlowButtonAppearance.ColorDisabled = 15921906
    GlowButtonAppearance.ColorDisabledTo = 15921906
    GlowButtonAppearance.ColorDown = 11899524
    GlowButtonAppearance.ColorDownTo = 11899524
    GlowButtonAppearance.ColorHot = 15717318
    GlowButtonAppearance.ColorHotTo = 15717318
    GlowButtonAppearance.ColorMirror = clBtnFace
    GlowButtonAppearance.ColorMirrorTo = clBtnFace
    GlowButtonAppearance.ColorMirrorHot = 15717318
    GlowButtonAppearance.ColorMirrorHotTo = 15717318
    GlowButtonAppearance.ColorMirrorDown = 11899524
    GlowButtonAppearance.ColorMirrorDownTo = 11899524
    GlowButtonAppearance.ColorMirrorChecked = 12179676
    GlowButtonAppearance.ColorMirrorCheckedTo = 12179676
    GlowButtonAppearance.ColorMirrorDisabled = 11974326
    GlowButtonAppearance.ColorMirrorDisabledTo = 15921906
    GlowButtonAppearance.GradientHot = ggVertical
    GlowButtonAppearance.GradientMirrorHot = ggVertical
    GlowButtonAppearance.GradientDown = ggVertical
    GlowButtonAppearance.GradientMirrorDown = ggVertical
    GlowButtonAppearance.GradientChecked = ggVertical
    GroupAppearance.BorderColor = clHighlight
    GroupAppearance.Color = 15717318
    GroupAppearance.ColorTo = 15717318
    GroupAppearance.ColorMirror = 15717318
    GroupAppearance.ColorMirrorTo = 15717318
    GroupAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.Font.Color = clWindowText
    GroupAppearance.Font.Height = -11
    GroupAppearance.Font.Name = 'Segoe UI'
    GroupAppearance.Font.Style = []
    GroupAppearance.Gradient = ggVertical
    GroupAppearance.GradientMirror = ggVertical
    GroupAppearance.TextColor = clBlack
    GroupAppearance.CaptionAppearance.CaptionColor = 15915714
    GroupAppearance.CaptionAppearance.CaptionColorTo = 15915714
    GroupAppearance.CaptionAppearance.CaptionTextColor = clBlack
    GroupAppearance.CaptionAppearance.CaptionColorHot = 15915714
    GroupAppearance.CaptionAppearance.CaptionColorHotTo = 15915714
    GroupAppearance.CaptionAppearance.CaptionTextColorHot = clBlack
    GroupAppearance.PageAppearance.BorderColor = clBlack
    GroupAppearance.PageAppearance.Color = 15717318
    GroupAppearance.PageAppearance.ColorTo = clBtnFace
    GroupAppearance.PageAppearance.ColorMirror = clBtnFace
    GroupAppearance.PageAppearance.ColorMirrorTo = clBtnFace
    GroupAppearance.PageAppearance.Gradient = ggVertical
    GroupAppearance.PageAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.BorderColor = clHighlight
    GroupAppearance.TabAppearance.BorderColorHot = clHighlight
    GroupAppearance.TabAppearance.BorderColorSelected = clBlack
    GroupAppearance.TabAppearance.BorderColorSelectedHot = clHighlight
    GroupAppearance.TabAppearance.BorderColorDisabled = clNone
    GroupAppearance.TabAppearance.BorderColorDown = clNone
    GroupAppearance.TabAppearance.Color = clBtnFace
    GroupAppearance.TabAppearance.ColorTo = clWhite
    GroupAppearance.TabAppearance.ColorSelected = 15717318
    GroupAppearance.TabAppearance.ColorSelectedTo = 15717318
    GroupAppearance.TabAppearance.ColorDisabled = clNone
    GroupAppearance.TabAppearance.ColorDisabledTo = clNone
    GroupAppearance.TabAppearance.ColorHot = 15717318
    GroupAppearance.TabAppearance.ColorHotTo = 15717318
    GroupAppearance.TabAppearance.ColorMirror = clWhite
    GroupAppearance.TabAppearance.ColorMirrorTo = clWhite
    GroupAppearance.TabAppearance.ColorMirrorHot = 15717318
    GroupAppearance.TabAppearance.ColorMirrorHotTo = 15717318
    GroupAppearance.TabAppearance.ColorMirrorSelected = 15717318
    GroupAppearance.TabAppearance.ColorMirrorSelectedTo = 15717318
    GroupAppearance.TabAppearance.ColorMirrorDisabled = clNone
    GroupAppearance.TabAppearance.ColorMirrorDisabledTo = clNone
    GroupAppearance.TabAppearance.Font.Charset = DEFAULT_CHARSET
    GroupAppearance.TabAppearance.Font.Color = clWindowText
    GroupAppearance.TabAppearance.Font.Height = -11
    GroupAppearance.TabAppearance.Font.Name = 'Tahoma'
    GroupAppearance.TabAppearance.Font.Style = []
    GroupAppearance.TabAppearance.Gradient = ggVertical
    GroupAppearance.TabAppearance.GradientMirror = ggVertical
    GroupAppearance.TabAppearance.GradientHot = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorHot = ggVertical
    GroupAppearance.TabAppearance.GradientSelected = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorSelected = ggVertical
    GroupAppearance.TabAppearance.GradientDisabled = ggVertical
    GroupAppearance.TabAppearance.GradientMirrorDisabled = ggVertical
    GroupAppearance.TabAppearance.TextColor = clBlack
    GroupAppearance.TabAppearance.TextColorHot = clBlack
    GroupAppearance.TabAppearance.TextColorSelected = clBlack
    GroupAppearance.TabAppearance.TextColorDisabled = clWhite
    GroupAppearance.ToolBarAppearance.BorderColor = clBlack
    GroupAppearance.ToolBarAppearance.BorderColorHot = clHighlight
    GroupAppearance.ToolBarAppearance.Color.Color = clBtnFace
    GroupAppearance.ToolBarAppearance.Color.ColorTo = clBtnFace
    GroupAppearance.ToolBarAppearance.Color.Direction = gdHorizontal
    GroupAppearance.ToolBarAppearance.ColorHot.Color = 15717318
    GroupAppearance.ToolBarAppearance.ColorHot.ColorTo = 15717318
    GroupAppearance.ToolBarAppearance.ColorHot.Direction = gdHorizontal
    PageAppearance.BorderColor = clBlack
    PageAppearance.Color = clBtnFace
    PageAppearance.ColorTo = clBtnFace
    PageAppearance.ColorMirror = clBtnFace
    PageAppearance.ColorMirrorTo = clBtnFace
    PageAppearance.Gradient = ggVertical
    PageAppearance.GradientMirror = ggVertical
    PagerCaption.BorderColor = clBlack
    PagerCaption.Color = clBtnFace
    PagerCaption.ColorTo = clBtnFace
    PagerCaption.ColorMirror = clBtnFace
    PagerCaption.ColorMirrorTo = clBtnFace
    PagerCaption.Gradient = ggVertical
    PagerCaption.GradientMirror = ggVertical
    PagerCaption.TextColor = clBlue
    PagerCaption.Font.Charset = DEFAULT_CHARSET
    PagerCaption.Font.Color = clWindowText
    PagerCaption.Font.Height = -11
    PagerCaption.Font.Name = 'Segoe UI'
    PagerCaption.Font.Style = []
    QATAppearance.BorderColor = clGray
    QATAppearance.Color = clBtnFace
    QATAppearance.ColorTo = clBtnFace
    QATAppearance.FullSizeBorderColor = clGray
    QATAppearance.FullSizeColor = clBtnFace
    QATAppearance.FullSizeColorTo = clBtnFace
    RightHandleColor = clBtnFace
    RightHandleColorTo = clNone
    RightHandleColorHot = 15717318
    RightHandleColorHotTo = clNone
    RightHandleColorDown = 11899524
    RightHandleColorDownTo = clNone
    TabAppearance.BorderColor = clNone
    TabAppearance.BorderColorHot = clHighlight
    TabAppearance.BorderColorSelected = clBlack
    TabAppearance.BorderColorSelectedHot = clHighlight
    TabAppearance.BorderColorDisabled = clNone
    TabAppearance.BorderColorDown = clNone
    TabAppearance.Color = clBtnFace
    TabAppearance.ColorTo = clWhite
    TabAppearance.ColorSelected = clWhite
    TabAppearance.ColorSelectedTo = clBtnFace
    TabAppearance.ColorDisabled = clWhite
    TabAppearance.ColorDisabledTo = clSilver
    TabAppearance.ColorHot = 15717318
    TabAppearance.ColorHotTo = 15717318
    TabAppearance.ColorMirror = clWhite
    TabAppearance.ColorMirrorTo = clWhite
    TabAppearance.ColorMirrorHot = 15717318
    TabAppearance.ColorMirrorHotTo = 15717318
    TabAppearance.ColorMirrorSelected = clBtnFace
    TabAppearance.ColorMirrorSelectedTo = clBtnFace
    TabAppearance.ColorMirrorDisabled = clWhite
    TabAppearance.ColorMirrorDisabledTo = clSilver
    TabAppearance.Font.Charset = DEFAULT_CHARSET
    TabAppearance.Font.Color = clWindowText
    TabAppearance.Font.Height = -11
    TabAppearance.Font.Name = 'Segoe UI'
    TabAppearance.Font.Style = []
    TabAppearance.Gradient = ggVertical
    TabAppearance.GradientMirror = ggVertical
    TabAppearance.GradientHot = ggVertical
    TabAppearance.GradientMirrorHot = ggVertical
    TabAppearance.GradientSelected = ggVertical
    TabAppearance.GradientMirrorSelected = ggVertical
    TabAppearance.GradientDisabled = ggVertical
    TabAppearance.GradientMirrorDisabled = ggVertical
    TabAppearance.TextColor = clBlack
    TabAppearance.TextColorHot = clBlack
    TabAppearance.TextColorSelected = clBlack
    TabAppearance.TextColorDisabled = clGray
    TabAppearance.BackGround.Color = clBtnFace
    TabAppearance.BackGround.ColorTo = clBtnFace
    TabAppearance.BackGround.Direction = gdHorizontal
    Left = 409
    Top = 135
  end
end
