object PingForm: TPingForm
  Left = 0
  Top = 0
  Caption = 'PingForm'
  ClientHeight = 109
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  inline PingFrame: TPingFrame
    Left = 0
    Top = 0
    Width = 430
    Height = 109
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 430
    inherited BottomPanel: TPanel
      Width = 430
      ExplicitWidth = 426
      ExplicitHeight = 83
      inherited Splitter: TSplitter
        Left = 341
      end
      inherited PingChart: TChart
        Width = 340
        ExplicitWidth = 336
        ExplicitHeight = 81
        inherited ClearChartPnl: TPanel
          ExplicitTop = 67
        end
      end
      inherited BottomRightPanel: TPanel
        Left = 344
        ExplicitLeft = 340
        ExplicitHeight = 81
      end
    end
    inherited TopPanel: TPanel
      Width = 430
      ExplicitWidth = 430
      inherited StatusLbl: TLabel
        Width = 146
        ExplicitWidth = 146
      end
      inherited ThreadInProgressLbl: TLabel
        Left = 299
        ExplicitLeft = 303
      end
      inherited SpinEdit: TSpinEdit
        Left = 378
        Top = 1
        ExplicitLeft = 378
        ExplicitTop = 1
      end
      inherited HostEdit: TEdit
        ExplicitWidth = 71
      end
    end
  end
  object JvFormMagnet: TJvFormMagnet
    Active = True
    FormGlue = False
    FormMagnet = True
    Left = 104
    Top = 40
  end
end
