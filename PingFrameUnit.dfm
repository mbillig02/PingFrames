object PingFrame: TPingFrame
  Left = 0
  Top = 0
  Width = 454
  Height = 109
  TabOrder = 0
  object BottomPanel: TPanel
    Left = 0
    Top = 21
    Width = 454
    Height = 88
    Align = alClient
    Caption = 'BottomPanel'
    TabOrder = 1
    object Splitter: TSplitter
      Left = 365
      Top = 1
      Height = 86
      Align = alRight
      Visible = False
      ExplicitLeft = 16
      ExplicitTop = 32
      ExplicitHeight = 100
    end
    object PingChart: TChart
      Left = 1
      Top = 1
      Width = 364
      Height = 86
      Legend.Visible = False
      Title.Text.Strings = (
        'TChart')
      Title.Visible = False
      BottomAxis.DateTimeFormat = 'h:mm:ss'
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMinimum = False
      View3D = False
      Align = alClient
      TabOrder = 0
      DesignSize = (
        364
        86)
      DefaultCanvas = 'TGDIPlusCanvas'
      ColorPaletteIndex = 13
      object ToggleBRPnl: TPanel
        Left = 0
        Top = 0
        Width = 8
        Height = 11
        Hint = 'Toggle displaying right panel'
        BevelEdges = []
        BevelOuter = bvNone
        Caption = '#'
        ParentBackground = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = ToggleBRPnlClick
      end
      object ClearChartPnl: TPanel
        Left = 0
        Top = 72
        Width = 10
        Height = 11
        Hint = 'Clear chart'
        Anchors = [akLeft, akBottom]
        BevelEdges = []
        BevelOuter = bvNone
        Caption = 'C'
        ParentBackground = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = ClearChartPnlClick
      end
      object TestPnl: TPanel
        Left = 0
        Top = 12
        Width = 10
        Height = 11
        Alignment = taLeftJustify
        BevelEdges = []
        BevelOuter = bvNone
        Caption = 'T'
        ParentBackground = False
        TabOrder = 2
        Visible = False
        OnClick = TestPnlClick
      end
      object LineSeries: TLineSeries
        HoverElement = [heCurrent]
        Brush.BackColor = clDefault
        Pointer.InflateMargins = True
        Pointer.Style = psRectangle
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
    object BottomRightPanel: TPanel
      Left = 368
      Top = 1
      Width = 85
      Height = 86
      Align = alRight
      TabOrder = 1
      Visible = False
      DesignSize = (
        85
        86)
      object TimeoutsLbl: TLabel
        Left = 0
        Top = 2
        Width = 85
        Height = 15
        Hint = 'Shift-Left-Click to reset counters'
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Timeouts: 0'
        ParentShowHint = False
        ShowHint = True
        OnMouseDown = TimeoutsLblMouseDown
        ExplicitWidth = 117
      end
      object PointsLbl: TLabel
        Left = 3
        Top = 67
        Width = 85
        Height = 15
        Alignment = taCenter
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = 'Points: 0'
      end
      object TimeSinceLastTimeoutLbl: TLabel
        Left = 8
        Top = 43
        Width = 70
        Height = 15
        Hint = 'Time Since Last Timeout'
        Alignment = taCenter
        AutoSize = False
        ParentShowHint = False
        ShowHint = True
      end
      object IPAddressStatusPnlWidthSpinEdit: TSpinEdit
        Left = 28
        Top = 43
        Width = 50
        Height = 24
        Anchors = [akLeft, akBottom]
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 999
        Visible = False
        OnChange = IPAddressStatusPnlWidthSpinEditChange
      end
      object LastTimeoutComboBox: TComboBox
        Left = 8
        Top = 18
        Width = 70
        Height = 23
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        Text = '00:00:00'
      end
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 454
    Height = 21
    Align = alTop
    TabOrder = 0
    object ContinuousPingSpdBtn: TSpeedButton
      Tag = 1
      Left = 1
      Top = 1
      Width = 35
      Height = 19
      Align = alLeft
      AllowAllUp = True
      GroupIndex = 1
      Caption = 'Start'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGreen
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      OnClick = ContinuousPingSpdBtnClick
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitHeight = 23
    end
    object ThreadInProgressLbl: TLabel
      Left = 388
      Top = 1
      Width = 10
      Height = 19
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      Caption = '-'
      Layout = tlCenter
      OnClick = ThreadInProgressLblClick
      ExplicitLeft = 387
    end
    object SpacerPnl4: TPanel
      Left = 398
      Top = 1
      Width = 10
      Height = 19
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 0
    end
    object SpacerPnl3: TPanel
      Left = 383
      Top = 1
      Width = 5
      Height = 19
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
    end
    object PointsSpinBtn: TSpinButton
      Left = 438
      Top = 1
      Width = 15
      Height = 19
      Align = alRight
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      TabOrder = 2
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = PointsSpinBtnDownClick
      OnUpClick = PointsSpinBtnUpClick
    end
    object PointsEdit: TEdit
      Left = 408
      Top = 1
      Width = 30
      Height = 19
      Align = alRight
      NumbersOnly = True
      TabOrder = 3
      Text = '180'
      ExplicitHeight = 23
    end
    object HostIPStatusPnl: TPanel
      Left = 36
      Top = 1
      Width = 347
      Height = 19
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      BevelEdges = []
      BevelOuter = bvNone
      TabOrder = 4
      object TopPnlSplitter: TSplitter
        Left = 97
        Top = 0
        Height = 19
        Align = alRight
        Color = clBtnShadow
        ParentColor = False
        ExplicitLeft = 120
        ExplicitTop = 8
        ExplicitHeight = 100
      end
      object EditBtnPnl: TPanel
        Left = 0
        Top = 0
        Width = 97
        Height = 19
        Align = alClient
        TabOrder = 0
        object HostEdit: TEdit
          Left = 1
          Top = 1
          Width = 85
          Height = 17
          Align = alClient
          Alignment = taCenter
          TabOrder = 0
          Text = 'LocalHost'
          OnDblClick = HostEditDblClick
          ExplicitHeight = 23
        end
        object SpacerPnl1: TPanel
          Left = 86
          Top = 1
          Width = 10
          Height = 17
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object CopyBtn: TButton
            Left = 0
            Top = 0
            Width = 10
            Height = 9
            Hint = 'Copy Host Edit to ClipBoard'
            Align = alTop
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = CopyBtnClick
          end
          object PasteBtn: TButton
            Left = 0
            Top = 8
            Width = 10
            Height = 9
            Hint = 'Paste ClipBoard to Host Edit'
            Align = alBottom
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = PasteBtnClick
          end
        end
      end
      object IPAddressStatusPnl: TPanel
        Left = 100
        Top = 0
        Width = 247
        Height = 19
        Align = alRight
        TabOrder = 1
        OnResize = IPAddressStatusPnlResize
        object StatusLbl: TLabel
          Left = 86
          Top = 1
          Width = 160
          Height = 17
          Align = alRight
          Alignment = taCenter
          AutoSize = False
          Caption = 'Low: -  Avg: -  High: -'
          Layout = tlCenter
          ExplicitLeft = 71
        end
        object IPAddressLbl: TLabel
          Left = 1
          Top = 1
          Width = 82
          Height = 17
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Caption = '0.0.0.0'
          Layout = tlCenter
          ExplicitLeft = -26
          ExplicitTop = -2
        end
        object IPAddressStatusSplitter: TSplitter
          Left = 83
          Top = 1
          Height = 17
          Align = alRight
          Color = clBtnShadow
          ParentColor = False
          ExplicitLeft = 120
          ExplicitTop = 8
          ExplicitHeight = 100
        end
      end
    end
  end
  object PingTimer: TTimer
    Tag = 1
    Enabled = False
    OnTimer = PingTimerTimer
    Left = 72
    Top = 42
  end
  object WSocket: TWSocket
    LineEnd = #13#10
    Proto = 'tcp'
    LocalAddr = '0.0.0.0'
    LocalAddr6 = '::'
    LocalPort = '0'
    SocksLevel = '5'
    ExclusiveAddr = False
    ComponentOptions = []
    ListenBacklog = 15
    OnDnsLookupDone = WSocketDnsLookupDone
    SocketErrs = wsErrTech
    Left = 169
    Top = 42
  end
end
