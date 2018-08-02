object frmIntrastatControlCentre: TfrmIntrastatControlCentre
  Left = 440
  Top = 240
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Intrastat Control Centre'
  ClientHeight = 337
  ClientWidth = 478
  Color = clWindow
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  PopupMenu = mnuWindowSettingsPopup
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 81
    Height = 14
    Caption = 'Intrastat Settings'
  end
  object Bevel1: TBevel
    Left = 94
    Top = 17
    Width = 373
    Height = 9
    Shape = bsTopLine
  end
  object lblLastClosedIntrastatDateArrivals: TLabel
    Left = 30
    Top = 130
    Width = 171
    Height = 14
    Alignment = taRightJustify
    Caption = 'Last Closed Intrastat Date - Arrivals'
  end
  object lblSupplementaryDeclarationReporting: TLabel
    Left = 10
    Top = 187
    Width = 178
    Height = 14
    Caption = 'Supplementary Declaration Reporting'
  end
  object Bevel2: TBevel
    Left = 192
    Top = 194
    Width = 275
    Height = 9
    Shape = bsTopLine
  end
  object lblIntrastatPeriodYear: TLabel
    Left = 30
    Top = 210
    Width = 98
    Height = 14
    Alignment = taRightJustify
    Caption = 'Intrastat Period/Year'
  end
  object lblDateRangeFrom: TLabel
    Left = 38
    Top = 239
    Width = 90
    Height = 14
    Alignment = taRightJustify
    Caption = 'Date Range - From'
  end
  object lblDateRangeTo: TLabel
    Left = 209
    Top = 239
    Width = 9
    Height = 14
    Caption = 'to'
  end
  object lblAggregationMode: TLabel
    Left = 40
    Top = 269
    Width = 88
    Height = 14
    Alignment = taRightJustify
    Caption = 'Aggregation Mode'
  end
  object lblIntrastatPeriodControl: TLabel
    Left = 10
    Top = 108
    Width = 109
    Height = 14
    Caption = 'Intrastat Period Control'
  end
  object Bevel3: TBevel
    Left = 122
    Top = 115
    Width = 345
    Height = 9
    Shape = bsTopLine
  end
  object lblArrivalsDate: TLabel
    Left = 230
    Top = 130
    Width = 54
    Height = 14
    Caption = '30/09/2015'
  end
  object lblDispatchesDate: TLabel
    Left = 230
    Top = 148
    Width = 54
    Height = 14
    Caption = '30/09/2015'
  end
  object lblLastClosedIntrastatDateDispatches: TLabel
    Left = 30
    Top = 148
    Width = 188
    Height = 14
    Alignment = taRightJustify
    Caption = 'Last Closed Intrastat Date - Dispatches'
  end
  object lblReportOptions: TLabel
    Left = 49
    Top = 293
    Width = 79
    Height = 14
    Alignment = taRightJustify
    Caption = 'Report Options:-'
  end
  object chkEnableIntrastat: TCheckBox
    Left = 30
    Top = 27
    Width = 94
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Enable Intrastat'
    TabOrder = 0
    OnClick = chkEnableIntrastatClick
  end
  object edtFromDate: TEditDate
    Left = 135
    Top = 236
    Width = 67
    Height = 22
    AutoSelect = False
    EditMask = '00/00/0000;0;'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 4
    Text = '01102015'
    Placement = cpAbove
  end
  object edtToDate: TEditDate
    Left = 224
    Top = 236
    Width = 67
    Height = 22
    AutoSelect = False
    EditMask = '00/00/0000;0;'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    MaxLength = 10
    ParentFont = False
    TabOrder = 5
    Text = '31102015'
    OnExit = edtToDateExit
    Placement = cpAbove
  end
  object lstAggregationMode: TComboBox
    Left = 135
    Top = 265
    Width = 156
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    ItemIndex = 0
    TabOrder = 6
    Text = 'Aggregated'
    Items.Strings = (
      'Aggregated'
      'Not Aggregated'
      'Detailed Audit')
  end
  object btnPrintDispatchesSD: TButton
    Left = 337
    Top = 235
    Width = 129
    Height = 25
    Caption = 'Print Dispatches SD'
    TabOrder = 8
    OnClick = btnPrintDispatchesSDClick
  end
  object btnPrintArrivalsSD: TButton
    Left = 337
    Top = 205
    Width = 129
    Height = 25
    Caption = 'Print Arrivals SD'
    TabOrder = 7
    OnClick = btnPrintArrivalsSDClick
  end
  object chkShowDeliveryTerms: TCheckBox
    Left = 68
    Top = 47
    Width = 123
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Show Delivery Terms'
    TabOrder = 1
    OnClick = chkShowDeliveryTermsClick
  end
  object chkShowModeOfTransport: TCheckBox
    Left = 50
    Top = 67
    Width = 141
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Show Mode of Transport'
    TabOrder = 2
    OnClick = chkShowModeOfTransportClick
  end
  object lstIntrastatPeriod: TComboBox
    Left = 135
    Top = 206
    Width = 156
    Height = 22
    Style = csDropDownList
    ItemHeight = 14
    ItemIndex = 0
    TabOrder = 3
    Text = '01/16 - January 2016'
    OnChange = lstIntrastatPeriodChange
    Items.Strings = (
      '01/16 - January 2016')
  end
  object chkIncludeOutOfPeriodCommodityCodesOnly: TCheckBox
    Left = 135
    Top = 310
    Width = 250
    Height = 17
    Caption = 'Include Out of Period Commodity Codes Only'
    TabOrder = 9
  end
  object mnuPrintPopup: TPopupMenu
    Images = ImageList1
    Left = 412
    Top = 28
    object WARNINGDateRangeincludesOpenPeriod1: TMenuItem
      Bitmap.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFF9B9B9B7D7C7D7D7C7D7D7C7D7D7C7D7D7C7D7D7C7D7D
        7C7D7E7D7D7E7D7E7E7D7E7E7D7E7E7D7E7E7D7E7D7C7D9A999A939292B2BCC5
        94D5F807B7F700CBFE00D0FF00DCFF04DFF204E2F30DFEFF32FFFF55FFFF70FF
        FFC5FEFEBDC0C18E8D8EBCBBBCB2BCC594D5F807B7F700CBFE00D0FF00DCFF38
        3E3F22888E0DFEFF32FFFF55FFFF70FFFFC5FEFEBDC0C1BAB9BAFFFFFF8F8D8E
        EAF3F925B8F502C5FC00CEFF00D1F9393B3B51616200F9FF10FEFF2CFFFF57FF
        FFEFFAFA828182FFFFFFFFFFFFDFDDDDB9BCBF93D7F805BBF900CCFE00D0FF04
        DFF204E2F300EFFF00F8FF07FDFF99FBFBB8B9B9DCDCDCFFFFFFFFFFFFFFFFFF
        9E9D9EDBE8F046B6E903C3FC00CDFE2325253D4F5100E4FF00ECFF38F5FFDDED
        ED969596FFFFFFFFFFFFFFFFFFFFFFFFF0F0F0A0A0A1D4EEFB43B1E519C6F614
        14142B333511DBFF17E2FFD1F7FC9A999AEDEDEDFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFBBBABBE4E9EC4FB0E14BB1E116151412131352DEFE7AE8FEE3E8E9A9A9
        A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA3A2A3DCECF74BADDF22
        211F2221204CD4F7DFF2F79B9A9BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFCECDCECACDD15DB3E11E1D1B2423219BDBF2C7C8C9CACACAFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9E9FEFF3F74F
        BFE74DCBF0F0F4F7969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFEEEEEEC7C7C763A8CC50CEF3C5C5C5DEDEDEFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB3B2B3D3
        DBE4D4D9DFACACACFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFF0F0F09493948C8B8CEFEFEFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Caption = 'WARNING: Date Range includes Open Period'
      Enabled = False
      ImageIndex = 0
      OnDrawItem = WARNINGDateRangeincludesOpenPeriod1DrawItem
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuPrintReport: TMenuItem
      Caption = 'Print Report'
      OnClick = mnuPrintReportClick
    end
    object mnuExportToCSV: TMenuItem
      Caption = 'Export to HMRC CSV Format'
      OnClick = mnuExportToCSVClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuClosePeriodAndPrintReport: TMenuItem
      Caption = 'Close Period and Print Report'
      OnClick = mnuClosePeriodAndPrintReportClick
    end
    object mnuClosePeriodAndExportToCSV: TMenuItem
      Caption = 'Close Period and Export to HMRC CSV Format'
      OnClick = mnuClosePeriodAndExportToCSVClick
    end
  end
  object SaveDialog1: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'Save CSV As'
    Left = 440
    Top = 28
  end
  object ImageList1: TImageList
    Left = 356
    Top = 28
    Bitmap = {
      494C010101000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000009B9B9B007D7C7D007D7C7D007D7C
      7D007D7C7D007D7C7D007D7C7D007D7C7D007E7D7D007E7D7E007E7D7E007E7D
      7E007E7D7E007E7D7E007D7C7D009A999A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000093929200B2BCC50094D5F80007B7
      F70000CBFE0000D0FF0000DCFF0004DFF20004E2F3000DFEFF0032FFFF0055FF
      FF0070FFFF00C5FEFE00BDC0C1008E8D8E000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BCBBBC00B2BCC50094D5F80007B7
      F70000CBFE0000D0FF0000DCFF00383E3F0022888E000DFEFF0032FFFF0055FF
      FF0070FFFF00C5FEFE00BDC0C100BAB9BA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008F8D8E00EAF3F90025B8
      F50002C5FC0000CEFF0000D1F900393B3B005161620000F9FF0010FEFF002CFF
      FF0057FFFF00EFFAFA0082818200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DFDDDD00B9BCBF0093D7
      F80005BBF90000CCFE0000D0FF0004DFF20004E2F30000EFFF0000F8FF0007FD
      FF0099FBFB00B8B9B900DCDCDC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000009E9D9E00DBE8
      F00046B6E90003C3FC0000CDFE00232525003D4F510000E4FF0000ECFF0038F5
      FF00DDEDED009695960000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F0F0F000A0A0
      A100D4EEFB0043B1E50019C6F600141414002B33350011DBFF0017E2FF00D1F7
      FC009A999A00EDEDED0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000BBBA
      BB00E4E9EC004FB0E1004BB1E100161514001213130052DEFE007AE8FE00E3E8
      E900A9A9A9000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000A3A2A300DCECF7004BADDF0022211F00222120004CD4F700DFF2F7009B9A
      9B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000CECDCE00CACDD1005DB3E1001E1D1B00242321009BDBF200C7C8C900CACA
      CA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000009F9E9F00EFF3F7004FBFE7004DCBF000F0F4F700969696000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000EEEEEE00C7C7C70063A8CC0050CEF300C5C5C500DEDEDE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B3B2B300D3DBE400D4D9DF00ACACAC00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000F0F0F000949394008C8B8C00EFEFEF00000000000000
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
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFF0000000000000000000000000000
      0000000000000000000000000000000080010000000000008001000000000000
      C003000000000000C003000000000000E007000000000000F00F000000000000
      F00F000000000000F81F000000000000F81F000000000000FC3F000000000000
      FC3F000000000000FFFF00000000000000000000000000000000000000000000
      000000000000}
  end
  object mnuWindowSettingsPopup: TPopupMenu
    Left = 384
    Top = 28
    object PropFlg: TMenuItem
      Caption = '&Properties'
      HelpContext = 65
      Hint = 'Access Colour & Font settings'
      OnClick = PropFlgClick
    end
    object MenuItem1: TMenuItem
      Caption = '-'
    end
    object optStoreCoordinates: TMenuItem
      AutoCheck = True
      Caption = '&Save Coordinates'
      HelpContext = 177
      Hint = 'Make the current window settings permanent'
    end
    object N3: TMenuItem
      Caption = '-'
      Enabled = False
      Visible = False
    end
  end
end
