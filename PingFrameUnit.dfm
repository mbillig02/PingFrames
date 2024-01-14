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
        BevelEdges = []
        BevelOuter = bvNone
        Caption = '#'
        ParentBackground = False
        TabOrder = 0
        OnClick = ToggleBRPnlClick
      end
      object ClearChartPnl: TPanel
        Left = 0
        Top = 72
        Width = 10
        Height = 11
        Anchors = [akLeft, akBottom]
        BevelEdges = []
        BevelOuter = bvNone
        Caption = 'C'
        ParentBackground = False
        TabOrder = 1
        OnClick = ClearChartPnlClick
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
        Alignment = taCenter
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Timeouts: 0'
        OnMouseDown = TimeoutsLblMouseDown
        ExplicitWidth = 117
      end
      object PointsLbl: TLabel
        Left = 0
        Top = 68
        Width = 85
        Height = 15
        Alignment = taCenter
        Anchors = [akLeft, akBottom]
        AutoSize = False
        Caption = 'Points: 0'
        ExplicitTop = 64
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
    object IPAddressLbl: TLabel
      Left = 116
      Top = 1
      Width = 82
      Height = 19
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      Caption = '0.0.0.0'
      Layout = tlCenter
      ExplicitLeft = 100
      ExplicitTop = 5
      ExplicitHeight = 15
    end
    object StatusLbl: TLabel
      Left = 208
      Top = 1
      Width = 175
      Height = 19
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      Caption = 'Low: -  Avg: -  High: -'
      Layout = tlCenter
      ExplicitLeft = 175
      ExplicitTop = 5
      ExplicitHeight = 15
    end
    object SpinEdit: TSpinEdit
      Left = 241
      Top = -2
      Width = 50
      Height = 24
      MaxValue = 0
      MinValue = 0
      TabOrder = 7
      Value = 0
      Visible = False
    end
    object HostEdit: TEdit
      Left = 36
      Top = 1
      Width = 75
      Height = 19
      Align = alClient
      Alignment = taCenter
      TabOrder = 0
      Text = 'LocalHost'
      ExplicitHeight = 23
    end
    object SpacerPnl4: TPanel
      Left = 398
      Top = 1
      Width = 10
      Height = 19
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
    end
    object SpacerPnl3: TPanel
      Left = 383
      Top = 1
      Width = 5
      Height = 19
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
    end
    object SpacerPnl2: TPanel
      Left = 198
      Top = 1
      Width = 10
      Height = 19
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 3
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
      TabOrder = 5
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
      TabOrder = 6
      Text = '180'
      ExplicitHeight = 23
    end
    object SpacerPnl1: TPanel
      Left = 111
      Top = 1
      Width = 5
      Height = 19
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 4
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
