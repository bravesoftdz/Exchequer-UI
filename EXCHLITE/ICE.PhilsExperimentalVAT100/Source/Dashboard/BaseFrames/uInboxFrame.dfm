inherited frmInboxFrame: TfrmInboxFrame
  inherited advPanelMail: TAdvPanel
    ParentFont = True
    FullHeight = 0
    inherited AdvOutlook: TAdvOutlookList
      PopupMenu = ppmInbox
    end
    inherited advPanelCaption: TAdvPanel
      FullHeight = 26
    end
    inherited advPanelDetails: TAdvPanel
      FullHeight = 110
      inherited lblFrom: TLabel
        Font.Color = clBlack
      end
      inherited mmSubject: TMemo
        Font.Color = clBlack
      end
    end
  end
  inherited tmBox: TTimer
    OnTimer = tmBoxTimer
    Top = 164
  end
  object ppmInbox: TAdvPopupMenu
    OnPopup = ppmInboxPopup
    MenuStyler = AdvMenuOfficeStyler
    Version = '2.5.0.1'
    Left = 136
    Top = 172
    object SelectAll1: TMenuItem
      Action = actSelectAll
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mnuAccept: TMenuItem
      Action = actAccept
    end
    object mnuDeny: TMenuItem
      Action = actDeny
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object mnuImport: TMenuItem
      Action = actImport
    end
    object mnuImportTo: TMenuItem
      Action = actImportTo
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuDelete: TMenuItem
      Action = actDelete
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object Preview1: TMenuItem
      Action = actPreview
    end
  end
  object AdvMenuOfficeStyler: TAdvMenuOfficeStyler
    AntiAlias = aaNone
    AutoThemeAdapt = False
    Style = osOffice2007Luna
    Background.Position = bpCenter
    Background.Color = 16185078
    Background.ColorTo = 16185078
    IconBar.Color = 15658729
    IconBar.ColorTo = 15658729
    IconBar.CheckBorder = clNavy
    IconBar.RadioBorder = clNavy
    IconBar.SeparatorColor = 12961221
    SelectedItem.Color = 15465983
    SelectedItem.ColorTo = 11267071
    SelectedItem.ColorMirror = 6936319
    SelectedItem.ColorMirrorTo = 9889023
    SelectedItem.BorderColor = 10079963
    SelectedItem.Font.Charset = DEFAULT_CHARSET
    SelectedItem.Font.Color = clWindowText
    SelectedItem.Font.Height = -11
    SelectedItem.Font.Name = 'Tahoma'
    SelectedItem.Font.Style = []
    SelectedItem.NotesFont.Charset = DEFAULT_CHARSET
    SelectedItem.NotesFont.Color = clWindowText
    SelectedItem.NotesFont.Height = -8
    SelectedItem.NotesFont.Name = 'Tahoma'
    SelectedItem.NotesFont.Style = []
    SelectedItem.CheckBorder = clNavy
    SelectedItem.RadioBorder = clNavy
    RootItem.Color = 15915714
    RootItem.ColorTo = 15784385
    RootItem.GradientDirection = gdVertical
    RootItem.Font.Charset = DEFAULT_CHARSET
    RootItem.Font.Color = clMenuText
    RootItem.Font.Height = -11
    RootItem.Font.Name = 'Tahoma'
    RootItem.Font.Style = []
    RootItem.SelectedColor = 7778289
    RootItem.SelectedColorTo = 4296947
    RootItem.SelectedColorMirror = 946929
    RootItem.SelectedColorMirrorTo = 5021693
    RootItem.SelectedBorderColor = 4548219
    RootItem.HoverColor = 15465983
    RootItem.HoverColorTo = 11267071
    RootItem.HoverColorMirror = 6936319
    RootItem.HoverColorMirrorTo = 9889023
    RootItem.HoverBorderColor = 10079963
    Glyphs.SubMenu.Data = {
      5A000000424D5A000000000000003E0000002800000004000000070000000100
      0100000000001C0000000000000000000000020000000200000000000000FFFF
      FF0070000000300000001000000000000000100000003000000070000000}
    Glyphs.Check.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FDFF0000F8FF0000F07F0000F23F
      0000F71F0000FF8F0000FFCF0000FFEF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    Glyphs.Radio.Data = {
      7E000000424D7E000000000000003E0000002800000010000000100000000100
      010000000000400000000000000000000000020000000200000000000000FFFF
      FF00FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FC3F0000F81F0000F81F
      0000F81F0000F81F0000FC3F0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000}
    SideBar.Font.Charset = DEFAULT_CHARSET
    SideBar.Font.Color = clWhite
    SideBar.Font.Height = -19
    SideBar.Font.Name = 'Tahoma'
    SideBar.Font.Style = [fsBold, fsItalic]
    SideBar.Image.Position = bpCenter
    SideBar.Background.Position = bpCenter
    SideBar.SplitterColorTo = clBlack
    Separator.Color = 12961221
    Separator.GradientType = gtBoth
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    NotesFont.Charset = DEFAULT_CHARSET
    NotesFont.Color = clGray
    NotesFont.Height = -8
    NotesFont.Name = 'Tahoma'
    NotesFont.Style = []
    MenuBorderColor = clSilver
    Left = 166
    Top = 172
  end
  object aclInbox: TActionList
    Images = imlPopupmenu
    Left = 196
    Top = 172
    object actImport: TAction
      Caption = '&Import'
      ImageIndex = 2
      OnExecute = actImportExecute
    end
    object actDelete: TAction
      Caption = '&Delete'
      ImageIndex = 0
      ShortCut = 46
      OnExecute = actDeleteExecute
    end
    object actImportTo: TAction
      Caption = 'Import To...'
      Enabled = False
      Visible = False
      OnExecute = actImportToExecute
    end
    object actAccept: TAction
      Caption = 'Accept'
      OnExecute = actAcceptExecute
    end
    object actDeny: TAction
      Caption = 'Deny'
      OnExecute = actDenyExecute
    end
    object actSelectAll: TAction
      Caption = 'Select All'
      OnExecute = actSelectAllExecute
    end
    object actPreview: TAction
      Caption = 'Preview'
      OnExecute = actPreviewExecute
    end
  end
  object imlPopupmenu: TImageList
    Left = 312
    Top = 100
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000AD948400634A3100634A3100634A3100634A3100634A3100634A3100634A
      3100634A3100634A3100634A3100634A31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A5A5A5005252
      5200949494000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000735A4200735A4200735A42000000
      0000BDA59400F7F7F700DEDEDE00DED6CE00DECEC600DEC6B500DEBDAD00DEB5
      A500DEB59C00DEAD9400DEAD9400634A31000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006B6B6B001010
      10004A4A4A00ADADAD0000000000000000000000000000000000000000000000
      000073737300A5A5A50000000000000000000000000000000000000000000000
      0000BDAD9C00FFFFFF00FFFFFF00D6C6B500D6BDAD00D6B5A500CEAD9C00CEA5
      9400C69C8C00F7D6BD00DEAD9400634A31000000000000000000BDA594006342
      3100634A3100634A3100634A3100634A3100634A3100634A3100634A3100634A
      3100634A31006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000949494001010
      1000212121007B7B7B0000000000000000000000000000000000000000000000
      000039393900B5B5B5000000000000000000735A4200735A4200735A42000000
      0000C6AD9C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7EF00FFEFE700FFE7
      DE00FFDED600F7DEC600DEB59C00634A31000000000000000000B5A59400FFF7
      EF00E7DED600E7D6CE00E7D6C600DECEBD00DEC6BD00DEC6BD00D6BDB500D6BD
      AD00D6BDAD006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006363
      63002121210042424200B5B5B500000000000000000000000000000000004A4A
      4A006B6B6B000000000000000000000000000000000000000000000000000000
      0000C6AD9C00FFFFFF00FFFFFF00D6C6B500D6BDAD00D6B5A500CEAD9C00CEA5
      9400C6A58C00FFDED600DEBDA500634A31000000000000000000BDAD9C00FFF7
      F700FFF7F700FFF7EF00FFF7EF00FFEFE700FFEFE700FFEFDE00FFEFDE00FFEF
      DE00D6BDAD006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000042424200212121005A5A5A000000000000000000000000006B6B6B003939
      390000000000000000000000000000000000735A4200735A4200735A42000000
      0000C6B5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7
      F700FFEFE7004A63FF001831F700634A31000000000000000000C6B5A500FFFF
      FF00DEC6BD00D6C6B500FFF7EF00CEB5A500CEB5A500FFEFE700CEAD9C00CEAD
      9C00DEC6B5006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000424242002121210063636300B5B5B5005A5A5A00313131008C8C
      8C00000000000000000000000000000000000000000000000000000000000000
      0000CEB5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFF7F7006B84FF005263F700634A31000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFF700FFFFF700FFF7EF00FFF7EF00FFF7E700FFEFE700FFEF
      E700DECEBD006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000042424200313131003131310031313100424242000000
      000000000000000000000000000000000000AD948400735A4200735A4200735A
      4200CEB5A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00CEC6DE00C6BDDE006B4A39000000000000000000CEB5A500FFFF
      FF00DECEC600DECEBD00FFFFF700D6BDAD00D6C6B500FFF7EF00D6BDAD00CEB5
      A500E7D6C6006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B5B5B500313131003939390042424200000000000000
      000000000000000000000000000000000000BDA59400F7F7F700E7DEDE00DED6
      CE00CEB5A500CEB5A500CEB5A500CEB5A500C6B5A500C6AD9C00C6AD9C00BDAD
      9C00BDA59C00BDA59400BDA59400AD9484000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFFF700FFF7F700FFF7EF00FFF7
      EF00E7D6CE006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C6C6C6005A5A5A003131310039393900393939005A5A5A000000
      000000000000000000000000000000000000BDAD9C00FFFFFF00FFFFFF00D6C6
      B500B5A5A500A5A5A5009C9C9C009494940094949400F7D6BD00DEAD9400735A
      4200000000000000000000000000000000000000000000000000CEB5A500FFFF
      FF00DECEC600DECEC600FFFFFF00DEC6BD00DEC6BD00FFFFF700D6C6B500D6C6
      B500EFE7DE006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00009C9C9C00424242004242420084848400C6C6C60084848400424242007B7B
      7B0000000000000000000000000000000000C6AD9C00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00FFEFE700FFE7DE00FFDED600F7DEC600DEB59C00735A
      420000000000735A4200735A4200735A42000000000000000000CEB5A500FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFF700FFFF
      F700FFF7EF006B4A390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BDBDBD007373
      730042424200424242007B7B7B00000000000000000000000000737373004242
      42007B7B7B00000000000000000000000000C6AD9C00FFFFFF00FFFFFF00D6C6
      B500D6BDAD00D6B5A500CEAD9C00CEA59400C6A58C00FFDED600DEB5A5006B52
      4200000000000000000000000000000000000000000000000000EFAD8C00EFAD
      8C00EFAD8C00EFA57B00EF9C7300E78C6300E7845200E77B4200E7733900E773
      3900E7733900CE63310000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500737373003131
      310042424200949494000000000000000000000000000000000000000000BDBD
      BD00525252007B7B7B000000000000000000C6B5A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFF7F700FFEFE7004A63FF001831F700634A
      310000000000735A4200735A4200735A42000000000000000000EFAD8C00FFC6
      A500FFBD9C00FFBD9C00FFB59400FFB58C00FFAD8400FFA57B00F7A57300F79C
      6B00F7946B00D66B390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000A5A5A500424242004A4A
      4A00B5B5B5000000000000000000000000000000000000000000000000000000
      0000000000009C9C9C000000000000000000CEB5A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF7F7006B84FF005263F700634A
      3100000000000000000000000000000000000000000000000000EFAD8C00EFAD
      8C00EFAD8C00EFAD8C00EFA58400EF9C7300E7946B00E78C6300E7845200E77B
      4A00E7734200E773390000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000073737300BDBD
      BD00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB5A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEC6DE00C6BDDE00634A
      310000000000735A4200735A4200735A42000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000CEB5A500CEB5A500CEB5A500CEB5
      A500C6B5A500C6AD9C00C6AD9C00BDAD9C00BDA59C00BDA59400BDA59400AD94
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFF000FFFF0000C7FF1000FFFF0000
      C3F3F000C0030000C3F31000C0030000E1E7F000C0030000F1CF1000C0030000
      F80FF000C0030000FC1F0000C0030000FC3F0000C0030000F81F000FC0030000
      F00F0008C0030000C1C7000FC003000083E30008C003000087FB000FC0030000
      CFFF0008FFFF0000FFFF000FFFFF000000000000000000000000000000000000
      000000000000}
  end
  object tmChangeStatus: TTimer
    Enabled = False
    Interval = 8000
    OnTimer = tmChangeStatusTimer
    Left = 314
    Top = 164
  end
end
