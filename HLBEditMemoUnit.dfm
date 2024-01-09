object HLBEditMemoDlg: THLBEditMemoDlg
  Left = 227
  Top = 108
  BorderStyle = bsSizeToolWin
  Caption = 'Host Listbox Edit Memo'
  ClientHeight = 190
  ClientWidth = 388
  Color = clBtnFace
  ParentFont = True
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  TextHeight = 15
  object ListBoxEditMemo: TMemo
    Left = 0
    Top = 0
    Width = 300
    Height = 190
    Align = alClient
    ScrollBars = ssBoth
    TabOrder = 0
    OnKeyPress = ListBoxEditMemoKeyPress
    ExplicitWidth = 292
    ExplicitHeight = 178
  end
  object RightPanel: TPanel
    Left = 300
    Top = 0
    Width = 88
    Height = 190
    Align = alRight
    TabOrder = 1
    ExplicitLeft = 292
    ExplicitHeight = 178
    DesignSize = (
      88
      190)
    object OKBtn: TButton
      Left = 6
      Top = 7
      Width = 75
      Height = 25
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
    object CancelBtn: TButton
      Left = 6
      Top = 38
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object SortBtn: TButton
      Left = 6
      Top = 158
      Width = 75
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = 'Sort'
      TabOrder = 0
      OnClick = SortBtnClick
      ExplicitTop = 146
    end
  end
end
