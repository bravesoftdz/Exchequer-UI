object frmSystem: TfrmSystem
  Left = 353
  Top = 131
  Width = 274
  Height = 480
  BorderStyle = bsSizeToolWin
  Caption = 'System Details'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object vlProperties: TValueListEditor
    Left = 0
    Top = 0
    Width = 266
    Height = 408
    Align = alClient
    TabOrder = 0
    ColWidths = (
      127
      133)
  end
  object Panel1: TPanel
    Left = 0
    Top = 408
    Width = 266
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      266
      38)
    object btnClose: TButton
      Left = 186
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = '&Close'
      TabOrder = 0
      OnClick = btnCloseClick
    end
  end
end
