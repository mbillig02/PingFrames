object ScanPortsForm: TScanPortsForm
  Left = 0
  Top = 0
  Caption = 'Scan Ports'
  ClientHeight = 141
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  TextHeight = 15
  object DNSResultLbl: TLabel
    Left = 96
    Top = 84
    Width = 121
    Height = 15
    Alignment = taCenter
    AutoSize = False
  end
  object ScanPortsBtn: TButton
    Left = 8
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Scan Ports'
    TabOrder = 0
    OnClick = ScanPortsBtnClick
  end
  object HostNameLabeledEdit: TLabeledEdit
    Left = 96
    Top = 25
    Width = 121
    Height = 23
    Alignment = taCenter
    EditLabel.Width = 57
    EditLabel.Height = 15
    EditLabel.Caption = 'HostName'
    TabOrder = 1
    Text = 'hs4w10'
  end
  object ButtonPanel: TPanel
    Left = 226
    Top = 0
    Width = 136
    Height = 141
    Align = alRight
    TabOrder = 2
    ExplicitLeft = 222
    ExplicitHeight = 140
  end
  object DNSLookupBtn: TButton
    Left = 8
    Top = 80
    Width = 75
    Height = 25
    Caption = 'DNS Lookup'
    TabOrder = 3
    OnClick = DNSLookupBtnClick
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
    Left = 176
    Top = 80
  end
end
