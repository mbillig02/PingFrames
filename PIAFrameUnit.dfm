object PingIntervalAdjustFrame: TPingIntervalAdjustFrame
  Left = 0
  Top = 0
  Width = 197
  Height = 30
  TabOrder = 0
  DesignSize = (
    197
    30)
  object FrameLbl: TLabel
    Left = 5
    Top = 6
    Width = 64
    Height = 15
    Caption = 'Frame Label'
  end
  object IntervalSpinEdit: TSpinEdit
    Left = 120
    Top = 3
    Width = 45
    Height = 24
    Anchors = [akTop, akRight]
    MaxValue = 300
    MinValue = 1
    TabOrder = 0
    Value = 1
  end
  object SetIntervalBtn: TButton
    Left = 169
    Top = 1
    Width = 25
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'S'
    TabOrder = 1
    OnClick = SetIntervalBtnClick
  end
end
