object frmScanEnterprise: TfrmScanEnterprise
  Left = 327
  Top = 258
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Scanning Exchequer Data Sets, Please Wait...'
  ClientHeight = 60
  ClientWidth = 453
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object lblProgress: TLabel
    Left = 24
    Top = 10
    Width = 406
    Height = 13
    Alignment = taCenter
    AutoSize = False
    ShowAccelChar = False
    Transparent = True
  end
  object AdvProgressBar1: TAdvProgressBar
    Left = 24
    Top = 29
    Width = 406
    Height = 22
    Animated = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Verdana'
    Font.Style = []
    Infinite = True
    InfiniteInterval = 100
    Level0ColorTo = 14811105
    Level1ColorTo = 13303807
    Level2Color = 5483007
    Level2ColorTo = 11064319
    Level3ColorTo = 13290239
    Level1Perc = 70
    Level2Perc = 90
    Position = 50
    ShowBorder = True
    ShowPosition = False
    Steps = 20
    Version = '1.1.2.1'
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 250
    OnTimer = ScanEnterprise
    Left = 254
    Top = 23
  end
end
