object WOR: TWOR
  Left = 589
  Top = 175
  Width = 639
  Height = 386
  HelpContext = 1303
  Caption = 'Works Order'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDefault
  Scaled = False
  ShowHint = True
  Visible = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 630
    Height = 351
    ActivePage = AdjustPage
    TabIndex = 0
    TabOrder = 0
    OnChange = PageControl1Change
    OnChanging = PageControl1Changing
    object AdjustPage: TTabSheet
      Caption = 'Works Order'
      object A1SBox: TScrollBox
        Left = 0
        Top = 98
        Width = 500
        Height = 204
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        VertScrollBar.Visible = False
        TabOrder = 0
        object A1HedPanel: TSBSPanel
          Left = 2
          Top = 1
          Width = 780
          Height = 17
          BevelInner = bvLowered
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          AllowReSize = False
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumnHeader
          object A1CLab: TSBSPanel
            Left = 2
            Top = 2
            Width = 94
            Height = 13
            Alignment = taLeftJustify
            BevelOuter = bvNone
            Caption = '  Stock Code'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1GLab: TSBSPanel
            Left = 635
            Top = 2
            Width = 59
            Height = 13
            BevelOuter = bvNone
            Caption = 'G/L Code'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1OLab: TSBSPanel
            Left = 220
            Top = 2
            Width = 51
            Height = 13
            BevelOuter = bvNone
            Caption = 'Reqd'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1DLab: TSBSPanel
            Left = 99
            Top = 2
            Width = 76
            Height = 13
            BevelOuter = bvNone
            Caption = 'Description'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 3
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1ILab: TSBSPanel
            Left = 173
            Top = 2
            Width = 43
            Height = 13
            BevelOuter = bvNone
            Caption = 'Qty Per'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 4
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1CCLab: TSBSPanel
            Left = 696
            Top = 2
            Width = 35
            Height = 13
            BevelOuter = bvNone
            Caption = 'CC'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 5
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1DpLab: TSBSPanel
            Left = 739
            Top = 2
            Width = 34
            Height = 13
            BevelOuter = bvNone
            Caption = 'Dept'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 6
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1BLab: TSBSPanel
            Left = 275
            Top = 2
            Width = 35
            Height = 13
            BevelOuter = bvNone
            Caption = '+/-'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 7
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1ULab: TSBSPanel
            Left = 511
            Top = 2
            Width = 72
            Height = 13
            BevelOuter = bvNone
            Caption = 'Unit Cost'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 8
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1LocLab: TSBSPanel
            Left = 583
            Top = 2
            Width = 52
            Height = 13
            BevelOuter = bvNone
            Caption = 'Location'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 9
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1UOLab: TSBSPanel
            Left = 315
            Top = 2
            Width = 49
            Height = 13
            BevelOuter = bvNone
            Caption = 'Issued'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 10
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1OSLab: TSBSPanel
            Left = 368
            Top = 2
            Width = 47
            Height = 13
            BevelOuter = bvNone
            Caption = 'O/S'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 11
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1BULab: TSBSPanel
            Left = 418
            Top = 2
            Width = 48
            Height = 13
            BevelOuter = bvNone
            Caption = 'Picked'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 12
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object A1IssLab: TSBSPanel
            Left = 467
            Top = 2
            Width = 44
            Height = 13
            BevelOuter = bvNone
            Caption = 'Built'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 13
            OnMouseDown = A1CLabMouseDown
            OnMouseMove = A1CLabMouseMove
            OnMouseUp = A1CPanelMouseUp
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
        end
        object A1CPanel: TSBSPanel
          Left = 3
          Top = 22
          Width = 97
          Height = 159
          HelpContext = 1294
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1IPanel: TSBSPanel
          Left = 176
          Top = 22
          Width = 44
          Height = 159
          HelpContext = 1296
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1GPanel: TSBSPanel
          Left = 643
          Top = 22
          Width = 59
          Height = 159
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1DPanel: TSBSPanel
          Left = 102
          Top = 22
          Width = 72
          Height = 159
          HelpContext = 1295
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1OPanel: TSBSPanel
          Left = 222
          Top = 22
          Width = 52
          Height = 159
          HelpContext = 1297
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1CCPanel: TSBSPanel
          Left = 704
          Top = 22
          Width = 35
          Height = 159
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1DpPanel: TSBSPanel
          Left = 741
          Top = 22
          Width = 35
          Height = 159
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1BPanel: TSBSPanel
          Left = 276
          Top = 22
          Width = 39
          Height = 159
          HelpContext = 1298
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1UPanel: TSBSPanel
          Left = 515
          Top = 22
          Width = 74
          Height = 159
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1LocPanel: TSBSPanel
          Left = 591
          Top = 22
          Width = 50
          Height = 159
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1UOPanel: TSBSPanel
          Left = 317
          Top = 22
          Width = 50
          Height = 159
          HelpContext = 1299
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1OSPanel: TSBSPanel
          Left = 369
          Top = 22
          Width = 50
          Height = 159
          HelpContext = 1300
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1BUPanel: TSBSPanel
          Left = 421
          Top = 22
          Width = 50
          Height = 159
          HelpContext = 1301
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object A1IssPanel: TSBSPanel
          Left = 473
          Top = 22
          Width = 40
          Height = 159
          HelpContext = 1302
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 14
          OnMouseUp = A1CPanelMouseUp
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
      end
      object A1BtmPanel: TSBSPanel
        Left = 0
        Top = 303
        Width = 622
        Height = 20
        HelpContext = 1311
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        AllowReSize = False
        IsGroupBox = False
        TextId = 0
        object CCPanel: TSBSPanel
          Left = 0
          Top = 3
          Width = 172
          Height = 17
          HelpContext = 1294
          BevelOuter = bvLowered
          ParentColor = True
          TabOrder = 0
          AllowReSize = False
          IsGroupBox = False
          TextId = 0
          Purpose = puFrame
          object CCTit: Label8
            Left = 3
            Top = 1
            Width = 17
            Height = 14
            Caption = 'CC:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextId = 0
          end
          object DepTit: Label8
            Left = 57
            Top = 1
            Width = 22
            Height = 14
            Caption = 'Dep:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextId = 0
          end
          object CCLab: Label8
            Left = 23
            Top = 1
            Width = 30
            Height = 14
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextId = 0
          end
          object DepLab: Label8
            Left = 81
            Top = 1
            Width = 30
            Height = 14
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextId = 0
          end
          object Label810: Label8
            Left = 114
            Top = 1
            Width = 21
            Height = 14
            Caption = 'Loc:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextId = 0
          end
          object LocLab: Label8
            Left = 138
            Top = 1
            Width = 30
            Height = 14
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextId = 0
          end
        end
        object CostPanel: TSBSPanel
          Left = 175
          Top = 3
          Width = 147
          Height = 17
          HelpContext = 442
          BevelOuter = bvLowered
          ParentColor = True
          TabOrder = 1
          AllowReSize = False
          IsGroupBox = False
          TextId = 0
          Purpose = puFrame
        end
        object IssuePanel: TSBSPanel
          Left = 324
          Top = 3
          Width = 161
          Height = 17
          HelpContext = 443
          BevelOuter = bvLowered
          ParentColor = True
          TabOrder = 2
          AllowReSize = False
          IsGroupBox = False
          TextId = 0
          Purpose = puFrame
        end
        object FinPanel: TSBSPanel
          Left = 486
          Top = 3
          Width = 133
          Height = 17
          HelpContext = 443
          BevelOuter = bvLowered
          ParentColor = True
          TabOrder = 3
          AllowReSize = False
          IsGroupBox = False
          TextId = 0
          Purpose = puFrame
          object Label812: Label8
            Left = 1
            Top = 1
            Width = 30
            Height = 14
            Caption = '% Iss:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextId = 0
          end
          object IssLab: Label8
            Left = 33
            Top = 2
            Width = 34
            Height = 14
            Alignment = taRightJustify
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TextId = 0
          end
          object Label813: Label8
            Left = 70
            Top = 1
            Width = 23
            Height = 14
            Caption = 'Built:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            TextId = 0
          end
          object Gauge1: TGauge
            Left = 31
            Top = 1
            Width = 38
            Height = 14
            Hint = '|Shows what percentage of the Works Order has been issued'
            HelpContext = 1313
            BackColor = clBlack
            BorderStyle = bsNone
            Color = clBlack
            ForeColor = clYellow
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            Progress = 0
            ShowHint = True
          end
          object Gauge2: TGauge
            Left = 93
            Top = 1
            Width = 38
            Height = 14
            Hint = '|Shows what percentage of the Works Order has been built'
            HelpContext = 1314
            BackColor = clBlack
            BorderStyle = bsNone
            Color = clBlack
            ForeColor = clLime
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            ParentShowHint = False
            Progress = 0
            ShowHint = True
          end
        end
      end
      object A1ListBtnPanel: TSBSPanel
        Left = 501
        Top = 122
        Width = 18
        Height = 180
        BevelOuter = bvLowered
        TabOrder = 2
        AllowReSize = False
        IsGroupBox = False
        TextId = 0
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Analysis'
      ImageIndex = 2
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 3
      TabVisible = False
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 4
      TabVisible = False
    end
    object NotesPage: TTabSheet
      HelpContext = 438
      Caption = 'Notes'
      object Label81: Label8
        Left = 17
        Top = 36
        Width = 22
        Height = 14
        Caption = 'Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object Label82: Label8
        Left = 14
        Top = 9
        Width = 25
        Height = 14
        Caption = 'Desc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object Label83: Label8
        Left = 204
        Top = 9
        Width = 38
        Height = 14
        Caption = 'Our Ref'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object Label85: Label8
        Left = 211
        Top = 37
        Width = 31
        Height = 14
        Caption = 'Per/Yr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object Label86: Label8
        Left = 338
        Top = 9
        Width = 68
        Height = 14
        Caption = 'Last edited by'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object TCNScrollBox: TScrollBox
        Left = 0
        Top = 97
        Width = 497
        Height = 234
        VertScrollBar.Visible = False
        TabOrder = 0
        object TNHedPanel: TSBSPanel
          Left = 3
          Top = 2
          Width = 487
          Height = 17
          BevelInner = bvLowered
          BevelOuter = bvNone
          Color = clWhite
          TabOrder = 0
          AllowReSize = False
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumnHeader
          object NDateLab: TSBSPanel
            Left = 2
            Top = 2
            Width = 65
            Height = 13
            BevelOuter = bvNone
            Caption = 'Date'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 0
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object NDescLab: TSBSPanel
            Left = 67
            Top = 1
            Width = 345
            Height = 13
            BevelOuter = bvNone
            Caption = 'Notes'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 1
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
          object NUserLab: TSBSPanel
            Left = 417
            Top = 1
            Width = 65
            Height = 13
            BevelOuter = bvNone
            Caption = 'User'
            Color = clWhite
            Ctl3D = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 2
            AllowReSize = False
            IsGroupBox = False
            TextId = 0
            Purpose = puBtrListColumnHeader
          end
        end
        object NDatePanel: TSBSPanel
          Left = 5
          Top = 22
          Width = 67
          Height = 195
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object NDescPanel: TSBSPanel
          Left = 74
          Top = 22
          Width = 344
          Height = 195
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
        object NUserPanel: TSBSPanel
          Left = 420
          Top = 22
          Width = 70
          Height = 195
          BevelInner = bvLowered
          BevelOuter = bvLowered
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          AllowReSize = True
          IsGroupBox = False
          TextId = 0
          Purpose = puBtrListColumn
        end
      end
      object TCNListBtnPanel: TSBSPanel
        Left = 502
        Top = 123
        Width = 18
        Height = 192
        BevelOuter = bvLowered
        TabOrder = 1
        AllowReSize = False
        IsGroupBox = False
        TextId = 0
      end
    end
  end
  object A1BtnPanel: TSBSPanel
    Left = 524
    Top = 28
    Width = 100
    Height = 298
    BevelOuter = bvNone
    TabOrder = 1
    AllowReSize = False
    IsGroupBox = False
    TextId = 0
    object Shape1: TShape
      Left = 0
      Top = 0
      Width = 65
      Height = 65
      Pen.Style = psClear
      Visible = False
    end
    object A1StatLab: Label8
      Left = 7
      Top = 7
      Width = 84
      Height = 17
      Alignment = taCenter
      AutoSize = False
      Caption = 'A1StatLab'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object OkN1Btn: TButton
      Tag = 1
      Left = 2
      Top = 2
      Width = 80
      Height = 21
      HelpContext = 257
      Caption = '&OK'
      Enabled = False
      ModalResult = 1
      TabOrder = 0
      OnClick = OkN1BtnClick
    end
    object CanN1Btn: TButton
      Tag = 1
      Left = 2
      Top = 25
      Width = 80
      Height = 21
      HelpContext = 258
      Cancel = True
      Caption = '&Cancel'
      Enabled = False
      ModalResult = 2
      TabOrder = 1
      OnClick = ClsN1BtnClick
    end
    object ClsN1Btn: TButton
      Left = 2
      Top = 49
      Width = 80
      Height = 21
      HelpContext = 259
      Cancel = True
      Caption = 'C&lose'
      ModalResult = 2
      TabOrder = 2
      OnClick = ClsN1BtnClick
    end
    object A1BSBox: TScrollBox
      Left = 1
      Top = 99
      Width = 97
      Height = 190
      HorzScrollBar.Tracking = True
      HorzScrollBar.Visible = False
      VertScrollBar.Tracking = True
      BorderStyle = bsNone
      Color = clBtnFace
      ParentColor = False
      TabOrder = 3
      object AddN1Btn: TButton
        Left = 2
        Top = 1
        Width = 80
        Height = 21
        Hint = 
          'Add new line|Choosing this option allows you to Add a new line w' +
          'hich will be placed at the end of the adjustment.'
        HelpContext = 1303
        Caption = '&Add'
        Enabled = False
        TabOrder = 0
        OnClick = AddN1BtnClick
      end
      object EditN1Btn: TButton
        Left = 2
        Top = 25
        Width = 80
        Height = 21
        Hint = 
          'Edit current line|Choosing this option allows you to edit the cu' +
          'rrently highlighted line.'
        HelpContext = 1303
        Caption = '&Edit'
        Enabled = False
        TabOrder = 1
        OnClick = AddN1BtnClick
      end
      object DelN1Btn: TButton
        Left = 2
        Top = 49
        Width = 80
        Height = 21
        Hint = 
          'Delete current line|Choosing this option allows you to delete th' +
          'e currently highlighted line.'
        HelpContext = 1304
        Caption = '&Delete'
        Enabled = False
        TabOrder = 2
        OnClick = DelN1BtnClick
      end
      object InsN1Btn: TButton
        Left = 2
        Top = 73
        Width = 80
        Height = 21
        Hint = 
          'Insert new line|Choosing this option allows you to Insert a new ' +
          'line before the currently highlighted line.'
        HelpContext = 1305
        Caption = '&Insert'
        TabOrder = 3
        OnClick = AddN1BtnClick
      end
      object SwiN1Btn: TButton
        Left = 2
        Top = 121
        Width = 80
        Height = 21
        Hint = 
          'Switch between alternative notepads|Switches the display of the ' +
          'notepad between dated notepad, & general notepad.'
        HelpContext = 90
        Caption = '&Switch To'
        TabOrder = 5
        OnClick = SwiN1BtnClick
      end
      object LnkN1Btn: TButton
        Left = 2
        Top = 266
        Width = 80
        Height = 21
        Hint = 
          'Link to additional information|Displays a list of any additional' +
          ' information attached to this transaction.'
        HelpContext = 81
        Caption = 'Lin&ks'
        TabOrder = 11
        OnClick = LnkN1BtnClick
      end
      object ChkBtn: TButton
        Left = 2
        Top = 241
        Width = 80
        Height = 21
        Hint = 
          'Recalculate total|Choosing this option will recalculate the tota' +
          'l in cases where the total does not agree with the sum of the in' +
          'dividual entries.'
        HelpContext = 1309
        Caption = 'Chec&k'
        TabOrder = 10
        OnClick = ChkBtnClick
      end
      object APickI1Btn: TButton
        Left = 2
        Top = 145
        Width = 80
        Height = 21
        HelpContext = 1306
        Caption = 'A&uto'
        TabOrder = 6
        OnClick = APickI1BtnClick
      end
      object WORI1Btn: TButton
        Left = 2
        Top = 169
        Width = 80
        Height = 21
        Hint = 
          'Generate a Works Order|Generate a Works Order from the currently' +
          ' highlighted line.'
        HelpContext = 1307
        Caption = '&Works Order'
        TabOrder = 7
        OnClick = WORI1BtnClick
      end
      object MatI1Btn: TButton
        Left = 2
        Top = 217
        Width = 80
        Height = 21
        Hint = 
          'Match order details|Displays any matching information for the cu' +
          'rrently highlighted line.'
        HelpContext = 1308
        Caption = '&Match'
        Enabled = False
        TabOrder = 9
        OnClick = MatI1BtnClick
      end
      object FindN1Btn: TButton
        Left = 2
        Top = 97
        Width = 80
        Height = 21
        Hint = 
          'Find Stock Item|Choosing this option allows you to find the next' +
          ' line containing the specified stock code.'
        HelpContext = 165
        Caption = '&Find'
        Enabled = False
        TabOrder = 4
        OnClick = FindN1BtnClick
      end
      object CustTxBtn2: TSBSButton
        Tag = 2
        Left = 2
        Top = 315
        Width = 80
        Height = 21
        Caption = 'Custom 2'
        TabOrder = 13
        OnClick = CustTxBtn1Click
        TextId = 31
      end
      object CustTxBtn1: TSBSButton
        Tag = 1
        Left = 2
        Top = 291
        Width = 80
        Height = 21
        Caption = 'Custom 1'
        TabOrder = 12
        OnClick = CustTxBtn1Click
        TextId = 30
      end
      object RetI1Btn: TButton
        Left = 2
        Top = 193
        Width = 80
        Height = 21
        Hint = 
          'Generate a Works Order|Generate a Works Order from the currently' +
          ' highlighted line.'
        HelpContext = 1593
        Caption = '&Return'
        TabOrder = 8
        OnClick = RetI1BtnClick
      end
      object CustTxBtn3: TSBSButton
        Tag = 3
        Left = 2
        Top = 339
        Width = 80
        Height = 21
        Caption = 'Custom 3'
        TabOrder = 14
        OnClick = CustTxBtn1Click
        TextId = 0
      end
      object CustTxBtn4: TSBSButton
        Tag = 4
        Left = 2
        Top = 363
        Width = 80
        Height = 21
        Caption = 'Custom 4'
        TabOrder = 15
        OnClick = CustTxBtn1Click
        TextId = 0
      end
      object CustTxBtn5: TSBSButton
        Tag = 5
        Left = 2
        Top = 387
        Width = 80
        Height = 21
        Caption = 'Custom 5'
        TabOrder = 16
        OnClick = CustTxBtn1Click
        TextId = 0
      end
      object CustTxBtn6: TSBSButton
        Tag = 6
        Left = 2
        Top = 411
        Width = 80
        Height = 21
        Caption = 'Custom 6'
        TabOrder = 17
        OnClick = CustTxBtn1Click
        TextId = 0
      end
    end
  end
  object A1FPanel: TSBSPanel
    Left = 4
    Top = 22
    Width = 517
    Height = 95
    BevelOuter = bvNone
    TabOrder = 2
    AllowReSize = False
    IsGroupBox = False
    TextId = 0
    object Label817: Label8
      Left = 333
      Top = 12
      Width = 38
      Height = 14
      Caption = 'Our Ref'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label84: Label8
      Left = 48
      Top = 12
      Width = 18
      Height = 14
      Caption = 'A/C'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label88: Label8
      Left = 337
      Top = 41
      Width = 31
      Height = 14
      Caption = 'Per/Yr'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object LTxfrLab: Label8
      Left = 420
      Top = 34
      Width = 52
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Iss. from'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label89: Label8
      Left = 16
      Top = 41
      Width = 48
      Height = 14
      Caption = 'Start Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label811: Label8
      Left = 162
      Top = 40
      Width = 44
      Height = 14
      Caption = 'Complete'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Bevel1: TBevel
      Left = 316
      Top = 5
      Width = 2
      Height = 111
    end
    object Label87: Label8
      Left = 427
      Top = 45
      Width = 44
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'location'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label814: Label8
      Left = 434
      Top = 62
      Width = 27
      Height = 19
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Could'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label815: Label8
      Left = 435
      Top = 73
      Width = 26
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'build'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label816: Label8
      Left = 341
      Top = 62
      Width = 27
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Could'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object Label818: Label8
      Left = 342
      Top = 73
      Width = 26
      Height = 14
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Issue'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TextId = 0
    end
    object A1OrefF: Text8Pt
      Left = 374
      Top = 8
      Width = 81
      Height = 22
      HelpContext = 142
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      Text = 'SRC000080'
      TextId = 0
      ViaSBtn = False
    end
    object A1OpoF: Text8Pt
      Left = 461
      Top = 8
      Width = 56
      Height = 22
      HelpContext = 241
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      Text = 'Sally'
      TextId = 0
      ViaSBtn = False
    end
    object A1TDateF: TEditDate
      Tag = 1
      Left = 71
      Top = 36
      Width = 80
      Height = 22
      HelpContext = 1277
      AutoSelect = False
      EditMask = '00/00/0000;0;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
      OnExit = A1TDateFExit
      Placement = cpAbove
    end
    object A1TPerF: TEditPeriod
      Tag = 1
      Left = 374
      Top = 36
      Width = 51
      Height = 22
      HelpContext = 239
      AutoSelect = False
      EditMask = '00/0000;0;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Text = 'mmyyyy'
      Placement = cpAbove
      EPeriod = 1
      EYear = 1996
      ViewMask = '000/0000;0;'
      OnConvDate = A1TPerFConvDate
      OnShowPeriod = A1TPerFShowPeriod
    end
    object A1CompF: Text8Pt
      Left = 156
      Top = 8
      Width = 143
      Height = 22
      HelpContext = 1276
      TabStop = False
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      TextId = 0
      ViaSBtn = False
    end
    object A1LocTxF: Text8Pt
      Tag = 1
      Left = 473
      Top = 36
      Width = 42
      Height = 22
      Hint = 
        'Issue from Location|Use this box to specify the In (issuing) loc' +
        'ation for all the component lines'
      HelpContext = 1275
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 8
      OnExit = A1LocTxFExit
      TextId = 0
      ViaSBtn = False
    end
    object I1AccF: Text8Pt
      Tag = 1
      Left = 71
      Top = 8
      Width = 80
      Height = 22
      Hint = 
        'Double click to drill down|Double clicking or using the down but' +
        'ton will drill down to the record for this field. The up button ' +
        'will search for the nearest match.'
      HelpContext = 1276
      CharCase = ecUpperCase
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      OnExit = I1AccFExit
      TextId = 0
      ViaSBtn = False
      Link_to_Cust = True
      ShowHilight = True
    end
    object A1CDateF: TEditDate
      Tag = 1
      Left = 210
      Top = 36
      Width = 89
      Height = 22
      HelpContext = 1278
      AutoSelect = False
      EditMask = '00/00/0000;0;'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      OnExit = A1TDateFExit
      Placement = cpAbove
    end
    object A1BldF: TCurrencyEdit
      Left = 464
      Top = 63
      Width = 51
      Height = 22
      HelpContext = 1316
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
      TabOrder = 9
      WantReturns = False
      WordWrap = False
      AutoSize = False
      BlockNegative = False
      BlankOnZero = False
      DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
      ShowCurrency = False
      TextId = 0
      Value = 1E-10
    end
    object A1IssF: TCurrencyEdit
      Left = 374
      Top = 63
      Width = 51
      Height = 22
      HelpContext = 1315
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
      TabOrder = 10
      WantReturns = False
      WordWrap = False
      AutoSize = False
      BlockNegative = False
      BlankOnZero = False
      DisplayFormat = '###,###,##0.00 ;###,###,##0.00-'
      ShowCurrency = False
      TextId = 0
      Value = 1E-10
    end
    object TransExtForm1: TSBSExtendedForm
      Left = 10
      Top = 62
      Width = 302
      Height = 30
      HelpContext = 1169
      HorzScrollBar.Visible = False
      VertScrollBar.Visible = False
      AutoScroll = False
      BorderStyle = bsNone
      TabOrder = 6
      ArrowPos = alTop
      ArrowX = 146
      ArrowY = 1
      OrigHeight = 30
      OrigWidth = 302
      ExpandedWidth = 307
      ExpandedHeight = 189
      OrigTabOrder = 6
      ShowHorzSB = True
      ShowVertSB = True
      OrigParent = A1FPanel
      NewParent = Owner
      FocusFirst = A1YRefF
      FocusLast = THUD4F
      TabPrev = A1CDateF
      TabNext = A1TPerF
      object I1YrRefL: Label8
        Left = 13
        Top = 6
        Width = 43
        Height = 14
        Caption = 'Your Ref'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object I1YrRef2L: Label8
        Left = 160
        Top = 5
        Width = 36
        Height = 14
        Caption = 'Alt. Ref'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF1L: Label8
        Left = 3
        Top = 41
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF3L: Label8
        Left = 3
        Top = 65
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF2L: Label8
        Left = 151
        Top = 41
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF4L: Label8
        Left = 151
        Top = 65
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF5L: Label8
        Left = 3
        Top = 89
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 5'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF7L: Label8
        Left = 3
        Top = 113
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 7'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF9L: Label8
        Left = 3
        Top = 137
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 9'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF6L: Label8
        Left = 151
        Top = 89
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 6'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF8L: Label8
        Left = 151
        Top = 113
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 8'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF10L: Label8
        Left = 151
        Top = 137
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF11L: Label8
        Left = 3
        Top = 161
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 11'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object UDF12L: Label8
        Left = 151
        Top = 161
        Width = 59
        Height = 14
        AutoSize = False
        Caption = 'UD Field 12'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TextId = 0
      end
      object THUD1F: Text8Pt
        Tag = 1
        Left = 62
        Top = 37
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD3F: Text8Pt
        Tag = 1
        Left = 62
        Top = 61
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD4F: Text8Pt
        Tag = 1
        Left = 211
        Top = 61
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD2F: Text8Pt
        Tag = 1
        Left = 211
        Top = 37
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object A1YRefF: Text8Pt
        Tag = 1
        Left = 61
        Top = 1
        Width = 80
        Height = 22
        HelpContext = 148
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 10
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = A1YRefFChange
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object I1YrRef2F: Text8Pt
        Tag = 1
        Left = 200
        Top = 2
        Width = 90
        Height = 22
        HelpContext = 240
        CharCase = ecUpperCase
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 20
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = I1YrRef2FChange
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD5F: Text8Pt
        Tag = 1
        Left = 62
        Top = 85
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD7F: Text8Pt
        Tag = 1
        Left = 62
        Top = 109
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD9F: Text8Pt
        Tag = 1
        Left = 62
        Top = 133
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD6F: Text8Pt
        Tag = 1
        Left = 211
        Top = 85
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD8F: Text8Pt
        Tag = 1
        Left = 211
        Top = 109
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD10F: Text8Pt
        Tag = 1
        Left = 211
        Top = 133
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD11F: Text8Pt
        Tag = 1
        Left = 62
        Top = 157
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
      object THUD12F: Text8Pt
        Tag = 1
        Left = 211
        Top = 157
        Width = 88
        Height = 22
        HelpContext = 283
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        MaxLength = 30
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
        OnExit = THUD1FExit
        TextId = 0
        ViaSBtn = False
        OnEntHookEvent = THUD1FEntHookEvent
      end
    end
  end
  object PopupMenu1: TPopupMenu
    OnPopup = PopupMenu1Popup
    Left = 168
    Top = 156
    object Add1: TMenuItem
      Caption = '&Add'
      Hint = 
        'Choosing this option allows you to Add a new line which will be ' +
        'placed at the end of the adjustment.'
      OnClick = AddN1BtnClick
    end
    object Edit1: TMenuItem
      Tag = 1
      Caption = '&Edit'
      Hint = 
        'Choosing this option allows you to edit the currently highlighte' +
        'd line.'
      Visible = False
      OnClick = AddN1BtnClick
    end
    object Delete1: TMenuItem
      Caption = '&Delete'
      Hint = 
        'Choosing this option allows you to delete the currently highligh' +
        'ted line.'
      OnClick = DelN1BtnClick
    end
    object Insert1: TMenuItem
      Caption = '&Insert'
      Hint = 
        'Choosing this option allows you to Insert a new line before the ' +
        'currently highlighted line.'
      OnClick = AddN1BtnClick
    end
    object Find1: TMenuItem
      Caption = '&Find'
      OnClick = FindN1BtnClick
    end
    object Switch1: TMenuItem
      Caption = '&Switch'
      Hint = 
        'Switches the display of the notepad between dated notepad, & gen' +
        'eral notepad.'
      OnClick = SwiN1BtnClick
    end
    object AutoPick1: TMenuItem
      Caption = 'A&uto'
    end
    object WorksOrder1: TMenuItem
      Caption = '&Works Order'
      OnClick = WORI1BtnClick
    end
    object Return1: TMenuItem
      Caption = '&Return'
      OnClick = RetI1BtnClick
    end
    object Match1: TMenuItem
      Caption = '&Match'
      OnClick = MatI1BtnClick
    end
    object Check1: TMenuItem
      Caption = 'Chec&k'
      OnClick = ChkBtnClick
    end
    object Links1: TMenuItem
      Caption = 'Lin&ks'
      Hint = 
        'Displays a list of any additional information attached to this t' +
        'ransaction.'
    end
    object Custom1: TMenuItem
      Tag = 1
      Caption = 'Custom 1'
      Visible = False
      OnClick = CustTxBtn1Click
    end
    object Custom2: TMenuItem
      Tag = 2
      Caption = 'Custom 2'
      Visible = False
      OnClick = CustTxBtn1Click
    end
    object Custom3: TMenuItem
      Tag = 3
      Caption = 'Custom 3'
      OnClick = CustTxBtn1Click
    end
    object Custom4: TMenuItem
      Tag = 4
      Caption = 'Custom 4'
      OnClick = CustTxBtn1Click
    end
    object Custom5: TMenuItem
      Tag = 5
      Caption = 'Custom 5'
      OnClick = CustTxBtn1Click
    end
    object Custom6: TMenuItem
      Tag = 6
      Caption = 'Custom 6'
      OnClick = CustTxBtn1Click
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
  object PopupMenu2: TPopupMenu
    Left = 238
    Top = 156
    object AP1: TMenuItem
      Tag = 1
      Caption = '&Pick'
      HelpContext = 52
      Hint = 
        'Automaticaly picks any outstanding lines with available stock, e' +
        'xcluding any serial items'
      OnClick = AP1Click
    end
    object Ap2: TMenuItem
      Tag = 2
      Caption = 'Pick with &Serial Nos'
      Hint = 
        'Automaticaly picks any outstanding lines with available stock, i' +
        'ncluding any serial items'
      OnClick = AP1Click
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object AW1: TMenuItem
      Tag = 3
      Caption = '&Unpick'
      HelpContext = 52
      Hint = 'Automaticaly resets any currently picked lines.'
      OnClick = AP1Click
    end
    object AW2: TMenuItem
      Tag = 4
      Caption = 'U&npick with Serial Nos'
      OnClick = AP1Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object AW3: TMenuItem
      Caption = '&Write Off to Unders/Overs'
      OnClick = AW3Click
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object Build1: TMenuItem
      Caption = 'Set &Build Quantity'
      Hint = 
        'Automaticaly attempts to build the main sub assembly line based ' +
        'on the could build figure.'
      OnClick = Build1Click
    end
  end
  object EntCustom3: TCustomisation
    DLLId = SysDll_Ent
    Enabled = True
    ExportPath = 'X:\ENTRPRSE\CUSTOM\DEMOHOOK\WOR1.RC'
    WindowId = 102000
    Left = 298
    Top = 157
  end
  object PMenu_Notes: TPopupMenu
    Left = 82
    Top = 147
    object MenItem_General: TMenuItem
      Caption = '&General Notes'
      OnClick = MenItem_GeneralClick
    end
    object MenItem_Dated: TMenuItem
      Caption = '&Dated Notes'
      OnClick = MenItem_DatedClick
    end
    object MenItem_Audit: TMenuItem
      Caption = '&Audit History Notes'
      OnClick = MenItem_AuditClick
    end
  end
end
