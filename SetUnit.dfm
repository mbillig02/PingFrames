object SettingsForm: TSettingsForm
  Left = 0
  Top = 0
  Caption = 'Settings'
  ClientHeight = 326
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  OnActivate = FormActivate
  TextHeight = 13
  object JvPageList: TJvPageList
    Left = 75
    Top = 0
    Width = 359
    Height = 326
    ActivePage = JvStandardPageMisc
    PropagateEnable = False
    Align = alClient
    ExplicitWidth = 355
    ExplicitHeight = 325
    object JvStandardPageStyles: TJvStandardPage
      Left = 0
      Top = 0
      Width = 359
      Height = 326
      Caption = ' '
      object StylesListBox: TListBox
        Left = 24
        Top = 24
        Width = 121
        Height = 193
        ItemHeight = 13
        TabOrder = 0
        OnClick = StylesListBoxClick
      end
      object StylesMMCheckBox: TCheckBox
        Left = 24
        Top = 232
        Width = 121
        Height = 17
        Caption = 'Styles on MainMenu'
        TabOrder = 1
        OnClick = StylesMMCheckBoxClick
      end
      object EnableStylesSettingsCheckBox: TCheckBox
        Left = 24
        Top = 255
        Width = 145
        Height = 17
        Hint = 'Causes access violation'
        Caption = 'Enable Styles on Settings'
        TabOrder = 2
        OnClick = EnableStylesSettingsCheckBoxClick
      end
    end
    object JvStandardPageForm: TJvStandardPage
      Left = 0
      Top = 0
      Width = 359
      Height = 326
      Caption = ' '
      object SetDefaultScreenBtn: TButton
        Left = 17
        Top = 24
        Width = 121
        Height = 25
        Caption = 'Set Default Scrren'
        TabOrder = 0
        OnClick = SetDefaultScreenBtnClick
      end
      object SetAlomstFullScreenBtn: TButton
        Left = 17
        Top = 64
        Width = 121
        Height = 25
        Caption = 'Set Alomst Full Screen'
        TabOrder = 1
        OnClick = SetAlomstFullScreenBtnClick
      end
      object SavFrmSizChkBox: TCheckBox
        Left = 17
        Top = 104
        Width = 97
        Height = 17
        Caption = 'Save form size'
        TabOrder = 2
        OnClick = SavFrmSizChkBoxClick
      end
      object SavFrmPosChkBox: TCheckBox
        Left = 17
        Top = 126
        Width = 113
        Height = 17
        Caption = 'Save form position'
        TabOrder = 3
        OnClick = SavFrmPosChkBoxClick
      end
      inline TScrPosFrame: TScrPosFrame
        Left = 9
        Top = 157
        Width = 185
        Height = 65
        TabOrder = 4
        ExplicitLeft = 9
        ExplicitTop = 157
        inherited LeftLbl: TLabel
          Width = 19
          Height = 13
          ExplicitWidth = 19
          ExplicitHeight = 13
        end
        inherited TopLbl: TLabel
          Width = 18
          Height = 13
          ExplicitWidth = 18
          ExplicitHeight = 13
        end
        inherited HeightLbl: TLabel
          Width = 31
          Height = 13
          ExplicitWidth = 31
          ExplicitHeight = 13
        end
        inherited WidthLbl: TLabel
          Width = 28
          Height = 13
          ExplicitWidth = 28
          ExplicitHeight = 13
        end
        inherited SpinEditLeft: TSpinEdit
          OnChange = TScrPosFrameSpinEditLeftChange
        end
        inherited SpinEditTop: TSpinEdit
          OnChange = TScrPosFrameSpinEditTopChange
        end
        inherited SpinEditHeight: TSpinEdit
          OnChange = TScrPosFrameSpinEditHeightChange
        end
        inherited SpinEditWidth: TSpinEdit
          OnChange = TScrPosFrameSpinEditWidthChange
        end
      end
      object MainFormSettingsToListBoxBtn: TButton
        Left = 229
        Top = 165
        Width = 96
        Height = 25
        Caption = 'Get (To ListBox)'
        TabOrder = 5
        OnClick = MainFormSettingsToListBoxBtnClick
      end
      object DeleteListBoxItemBtn: TButton
        Left = 229
        Top = 280
        Width = 96
        Height = 25
        Caption = 'Delete'
        TabOrder = 6
        OnClick = DeleteListBoxItemBtnClick
      end
      object ListToFormGroupBox: TGroupBox
        Left = 222
        Top = 191
        Width = 113
        Height = 80
        Caption = 'List to Form'
        TabOrder = 7
        object MainFormPosSettingsToFormBtn: TButton
          Left = 8
          Top = 16
          Width = 45
          Height = 25
          Caption = 'Pos'
          TabOrder = 0
          OnClick = MainFormPosSettingsToFormBtnClick
        end
        object MainFormSizeSettingsToFormBtn: TButton
          Left = 59
          Top = 16
          Width = 45
          Height = 25
          Caption = 'Size'
          TabOrder = 1
          OnClick = MainFormSizeSettingsToFormBtnClick
        end
        object MainFormSettingsToFormBtn: TButton
          Left = 8
          Top = 47
          Width = 96
          Height = 25
          Caption = 'Set (To Form)'
          TabOrder = 2
          OnClick = MainFormSettingsToFormBtnClick
        end
      end
      object MainFormSettingsListBox: TCheckListBox
        Left = 144
        Top = 26
        Width = 191
        Height = 117
        ItemHeight = 17
        TabOrder = 8
        OnClickCheck = MainFormSettingsListBoxClickCheck
      end
    end
    object JvStandardPageDirectories: TJvStandardPage
      Left = 0
      Top = 0
      Width = 359
      Height = 326
      Caption = 'JvStandardPageDirectories'
      object DtaDirGrpBox: TGroupBox
        Left = 0
        Top = 0
        Width = 359
        Height = 65
        Align = alTop
        Caption = 'DtaDir'
        TabOrder = 0
        object DtaDirLbl: TLabel
          Left = 8
          Top = 16
          Width = 43
          Height = 13
          Caption = 'DtaDirLbl'
        end
        object DtaDirCopyToClpBrdBtn: TButton
          Left = 7
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Copy to Clipboard'
          TabOrder = 0
          OnClick = DtaDirCopyToClpBrdBtnClick
        end
        object DtaDirOpenInExplorerBtn: TButton
          Left = 117
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Open in Explorer'
          TabOrder = 1
          OnClick = DtaDirOpenInExplorerBtnClick
        end
      end
      object TmpDirGrpBox: TGroupBox
        Left = 0
        Top = 195
        Width = 359
        Height = 65
        Align = alTop
        Caption = 'TmpDir'
        TabOrder = 1
        object TmpDirLbl: TLabel
          Left = 8
          Top = 16
          Width = 46
          Height = 13
          Caption = 'TmpDirLbl'
        end
        object TmpDirCopyToClpBrdBtn: TButton
          Left = 7
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Copy to Clipboard'
          TabOrder = 0
          OnClick = TmpDirCopyToClpBrdBtnClick
        end
        object TmpDirOpenInExplorerBtn: TButton
          Left = 117
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Open in Explorer'
          TabOrder = 1
          OnClick = TmpDirOpenInExplorerBtnClick
        end
      end
      object LstDirGrpBox: TGroupBox
        Left = 0
        Top = 65
        Width = 359
        Height = 65
        Align = alTop
        Caption = 'LstDir'
        TabOrder = 2
        object LstDirLbl: TLabel
          Left = 8
          Top = 16
          Width = 40
          Height = 13
          Caption = 'LstDirLbl'
        end
        object LstDirCopyToClpBrdBtn: TButton
          Left = 7
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Copy to Clipboard'
          TabOrder = 0
          OnContextPopup = LstDirCopyToClpBrdBtnContextPopup
        end
        object LstDirOpenInExplorerBtn: TButton
          Left = 117
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Open in Explorer'
          TabOrder = 1
          OnClick = LstDirOpenInExplorerBtnClick
        end
      end
      object SsnDirGrpBox: TGroupBox
        Left = 0
        Top = 130
        Width = 359
        Height = 65
        Align = alTop
        Caption = 'SsnDir'
        TabOrder = 3
        object SsnDirLbl: TLabel
          Left = 8
          Top = 16
          Width = 43
          Height = 13
          Caption = 'SsnDirLbl'
        end
        object SsnDirCopyToClpBrdBtn: TButton
          Left = 7
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Copy to Clipboard'
          TabOrder = 0
          OnClick = SsnDirCopyToClpBrdBtnClick
        end
        object SsnDirOpenInExplorerBtn: TButton
          Left = 117
          Top = 34
          Width = 104
          Height = 25
          Caption = 'Open in Explorer'
          TabOrder = 1
          OnClick = SsnDirOpenInExplorerBtnClick
        end
      end
    end
    object JvStandardPageMisc: TJvStandardPage
      Left = 0
      Top = 0
      Width = 359
      Height = 326
      Caption = 'JvStandardPageMisc'
      ExplicitWidth = 355
      ExplicitHeight = 325
      object AutoStartPingingCheckBox: TCheckBox
        Left = 24
        Top = 26
        Width = 121
        Height = 17
        Caption = 'AutoStart Pinging'
        TabOrder = 0
        OnClick = AutoStartPingingCheckBoxClick
      end
      object StartTimeoutPnlVisibleCheckBox: TCheckBox
        Left = 24
        Top = 49
        Width = 153
        Height = 17
        Caption = 'Start Timeout Panel Visible'
        TabOrder = 1
        OnClick = StartTimeoutPnlVisibleCheckBoxClick
      end
      object PasteToHostListGroupBox: TGroupBox
        Left = 24
        Top = 76
        Width = 153
        Height = 61
        Caption = 'Paste to Host List'
        TabOrder = 2
        object ConvertToLCCheckBox: TCheckBox
          Left = 5
          Top = 16
          Width = 129
          Height = 17
          Caption = 'Convert to lowercase'
          TabOrder = 0
          OnClick = ConvertToLCCheckBoxClick
        end
        object ConvertToUCCheckBox: TCheckBox
          Left = 5
          Top = 39
          Width = 137
          Height = 17
          Caption = 'Convert to UPPERCASE'
          TabOrder = 1
          OnClick = ConvertToUCCheckBoxClick
        end
      end
      object PauseForRemoveFrameCheckBox: TCheckBox
        Left = 24
        Top = 155
        Width = 153
        Height = 17
        Caption = 'Pause For Remove Frame'
        TabOrder = 3
        OnClick = PauseForRemoveFrameCheckBoxClick
      end
    end
  end
  object SetLeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 75
    Height = 326
    Align = alLeft
    TabOrder = 1
    ExplicitHeight = 325
    object DirBtn: TButton
      Left = 1
      Top = 1
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Directories'
      TabOrder = 0
      OnClick = DirBtnClick
    end
    object FormBtn: TButton
      Left = 1
      Top = 26
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Form'
      TabOrder = 1
      OnClick = FormBtnClick
    end
    object StylesBtn: TButton
      Left = 1
      Top = 76
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Styles'
      TabOrder = 2
      Visible = False
      OnClick = StylesBtnClick
    end
    object MiscBtn: TButton
      Left = 1
      Top = 51
      Width = 73
      Height = 25
      Align = alTop
      Caption = 'Misc'
      TabOrder = 3
      OnClick = MiscBtnClick
    end
  end
  object DtaDirJvBalloonHint: TJvBalloonHint
    Left = 360
    Top = 80
  end
  object TmpDirJvBalloonHint: TJvBalloonHint
    Left = 360
    Top = 272
  end
  object LstDirJvBalloonHint: TJvBalloonHint
    Left = 360
    Top = 176
  end
  object SsnDirJvBalloonHint: TJvBalloonHint
    Left = 184
    Top = 272
  end
end
