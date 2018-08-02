object frmTKPickList: TfrmTKPickList
  Left = 331
  Top = 172
  Width = 369
  Height = 415
  Caption = 'Pick List'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = pmMain
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormShow
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 14
  object btnOK: TButton
    Left = 184
    Top = 352
    Width = 80
    Height = 21
    Caption = '&OK'
    Default = True
    Enabled = False
    TabOrder = 1
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 272
    Top = 352
    Width = 80
    Height = 21
    Cancel = True
    Caption = 'Ca&ncel'
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object panList: TPanel
    Left = 8
    Top = 8
    Width = 345
    Height = 337
    BevelOuter = bvNone
    TabOrder = 0
    object mlList: TDBMultiList
      Left = 0
      Top = 0
      Width = 345
      Height = 337
      Cursor = crHSplit
      Colours.Selection = clTeal
      Custom.SplitterCursor = crHSplit
      Dimensions.HeaderHeight = 18
      Dimensions.SpacerWidth = 1
      Dimensions.SplitterWidth = 3
      Options.BoldActiveColumn = False
      Options.SearchTimeout = 3000
      Columns = <
        item
          Caption = 'Code'
          Field = 'C'
          Searchable = True
          Sortable = True
          Width = 107
        end
        item
          Caption = 'Description'
          Field = 'D'
          Searchable = True
          Sortable = True
          Width = 200
          IndexNo = 1
        end>
      TabStop = True
      OnRowDblClick = mlListRowDblClick
      OnScrollButtonKeyPress = mlListScrollButtonKeyPress
      Align = alClient
      TabOrder = 0
      HeaderFont.Charset = DEFAULT_CHARSET
      HeaderFont.Color = clWindowText
      HeaderFont.Height = -11
      HeaderFont.Name = 'Arial'
      HeaderFont.Style = []
      HighlightFont.Charset = DEFAULT_CHARSET
      HighlightFont.Color = clWhite
      HighlightFont.Height = -11
      HighlightFont.Name = 'Arial'
      HighlightFont.Style = []
      MultiSelectFont.Charset = DEFAULT_CHARSET
      MultiSelectFont.Color = clWindowText
      MultiSelectFont.Height = -11
      MultiSelectFont.Name = 'Arial'
      MultiSelectFont.Style = []
      Version = 'v1.13'
      OnAfterLoad = mlListAfterLoad
      OnBeforeLoad = mlListBeforeLoad
      OnAfterInit = mlListAfterInit
      Active = True
      SortColIndex = 0
      SortAsc = True
    end
  end
  object btnShowAll: TButton
    Left = 8
    Top = 352
    Width = 80
    Height = 21
    Caption = '&Show All'
    TabOrder = 3
    Visible = False
    OnClick = btnShowAllClick
  end
  object ctkDataSet: TComTKDataset
    OnFilterRecord = ctkDataSetFilterRecord
    OnGetFieldValue = GetFieldValue
    OnSelectRecord = SelectRecord
    Left = 16
    Top = 32
  end
  object pmMain: TPopupMenu
    Left = 104
    Top = 352
    object Properties1: TMenuItem
      Caption = 'Properties'
      OnClick = Properties1Click
    end
    object SaveCoordinates1: TMenuItem
      AutoCheck = True
      Caption = 'Save Coordinates'
    end
  end
end
