object PingFrame: TPingFrame
  Left = 0
  Top = 0
  Width = 454
  Height = 109
  TabOrder = 0
  object BottomPanel: TPanel
    Left = 0
    Top = 25
    Width = 454
    Height = 84
    Align = alClient
    Caption = 'BottomPanel'
    TabOrder = 1
    object Splitter: TSplitter
      Left = 365
      Top = 1
      Height = 82
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
      Height = 82
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
        82)
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
        Top = 68
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
      Height = 82
      Align = alRight
      TabOrder = 1
      Visible = False
      DesignSize = (
        85
        82)
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
        Top = 64
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
    Height = 25
    Align = alTop
    TabOrder = 0
    DesignSize = (
      454
      25)
    object ContinuousPingSpdBtn: TSpeedButton
      Tag = 1
      Left = 0
      Top = 0
      Width = 35
      Height = 23
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
    end
    object StatusLbl: TLabel
      Left = 207
      Top = 5
      Width = 175
      Height = 15
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = 'Low: -  Avg: -  High: -'
    end
    object ThreadInProgressLbl: TLabel
      Left = 390
      Top = 5
      Width = 5
      Height = 15
      Anchors = [akTop, akRight]
      Caption = '-'
      OnClick = ThreadInProgressLblClick
    end
    object IPAddressLbl: TLabel
      Left = 120
      Top = 5
      Width = 82
      Height = 15
      Alignment = taCenter
      Anchors = [akTop, akRight]
      AutoSize = False
      Caption = '0.0.0.0'
    end
    object SpinEdit: TSpinEdit
      Left = 400
      Top = 2
      Width = 51
      Height = 24
      Anchors = [akTop, akRight]
      Increment = 5
      MaxValue = 300
      MinValue = 5
      TabOrder = 0
      Value = 180
    end
    object HostEdit: TEdit
      Left = 40
      Top = 2
      Width = 75
      Height = 23
      Alignment = taCenter
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 1
      Text = 'LocalHost'
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
