object MainForm: TMainForm
  Left = 0
  Top = 0
  Caption = 'PingFrames'
  ClientHeight = 222
  ClientWidth = 588
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  TextHeight = 13
  object Splitter: TSplitter
    Left = 105
    Top = 0
    Height = 222
    ExplicitLeft = 264
    ExplicitTop = 128
    ExplicitHeight = 100
  end
  object LeftPanel: TPanel
    Left = 0
    Top = 0
    Width = 105
    Height = 222
    Align = alLeft
    TabOrder = 0
    ExplicitHeight = 221
    object HostListBox: TListBox
      Left = 1
      Top = 23
      Width = 103
      Height = 198
      Align = alClient
      ItemHeight = 13
      MultiSelect = True
      PopupMenu = HostListBoxPopupMenu
      TabOrder = 0
      OnDblClick = HostListBoxDblClick
      OnKeyDown = HostListBoxKeyDown
      OnKeyPress = HostListBoxKeyPress
      OnMouseDown = HostListBoxMouseDown
    end
    object LeftTopPanel: TPanel
      Left = 1
      Top = 1
      Width = 103
      Height = 22
      Align = alTop
      TabOrder = 1
      object AddNewHostSpeedButton: TSpeedButton
        Left = 82
        Top = 1
        Width = 20
        Height = 20
        Action = aAddNewHost
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -10
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 80
      end
      object NewHostEdit: TEdit
        Left = 1
        Top = 1
        Width = 81
        Height = 20
        Align = alClient
        TabOrder = 0
        ExplicitHeight = 21
      end
    end
  end
  object RightPanel: TPanel
    Left = 108
    Top = 0
    Width = 480
    Height = 222
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 476
    ExplicitHeight = 221
    object Splitter23: TSplitter
      Left = 431
      Top = 1
      Height = 220
      Align = alRight
      Visible = False
      ExplicitLeft = 384
      ExplicitTop = 128
      ExplicitHeight = 100
    end
    object Splitter12: TSplitter
      Left = 383
      Top = 1
      Height = 220
      Align = alRight
      Visible = False
      ExplicitLeft = 240
      ExplicitTop = 64
      ExplicitHeight = 100
    end
    object ColumnPanel1: TPanel
      Left = 1
      Top = 1
      Width = 382
      Height = 220
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 378
      ExplicitHeight = 219
    end
    object ColumnPanel3: TPanel
      Left = 434
      Top = 1
      Width = 45
      Height = 220
      Align = alRight
      Caption = '3'
      TabOrder = 1
      Visible = False
      ExplicitLeft = 430
      ExplicitHeight = 219
    end
    object ColumnPanel2: TPanel
      Left = 386
      Top = 1
      Width = 45
      Height = 220
      Align = alRight
      Caption = '2'
      TabOrder = 2
      Visible = False
      ExplicitLeft = 382
      ExplicitHeight = 219
    end
  end
  object MainMenu: TMainMenu
    Left = 24
    Top = 16
    object mmiFile: TMenuItem
      Caption = 'File'
      object mmiSelectListFile: TMenuItem
        Action = aSelectListFile
      end
      object mmiLoadListFile: TMenuItem
        Action = aLoadListFile
      end
      object mmiSaveListFile: TMenuItem
        Action = aSaveListFile
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mmiDirectories: TMenuItem
        Caption = 'Directories'
        object mmiOpenDtaDirInExplorer: TMenuItem
          Action = aOpenDtaDirInExplorer
        end
        object mmiCopyDtaDirPathToClipboard: TMenuItem
          Action = aCopyDtaDirPathToClipboard
        end
        object N2: TMenuItem
          Caption = '-'
        end
        object mmiOpenLstDirInExplorer: TMenuItem
          Action = aOpenLstDirInExplorer
        end
        object mmiCopyLstDirPathToClipboard: TMenuItem
          Action = aCopyLstDirPathToClipboard
        end
        object N4: TMenuItem
          Caption = '-'
        end
        object mmiOpenSsnDirInExplorer: TMenuItem
          Action = aOpenSsnDirInExplorer
        end
        object mmiCopySsnDirPathToClipboard: TMenuItem
          Action = aCopySsnDirPathToClipboard
        end
        object N11: TMenuItem
          Caption = '-'
        end
        object mmiOpenTmpDirInExplorer: TMenuItem
          Action = aOpenTmpDirInExplorer
        end
        object mmiCopyTmpDirPathToClipboard: TMenuItem
          Action = aCopyTmpDirPathToClipboard
        end
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mmiExit: TMenuItem
        Action = aExit
      end
    end
    object mmiPing: TMenuItem
      Caption = 'Ping'
      object mmiAddPingFrame: TMenuItem
        Action = aAddPingFrame
      end
      object mmiClearPingFrames: TMenuItem
        Action = aClearPingFrames
      end
      object mmiClearPingFrames2: TMenuItem
        Action = aClearPingFrames2
        Caption = 'Clear Frames Column 2'
      end
      object mmiClearAllFrames: TMenuItem
        Action = aClearAllFrames
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mmiStartAllPinging: TMenuItem
        Action = aStartAllPinging
      end
      object mmiStopAllPinging: TMenuItem
        Action = aStopAllPinging
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object mmiSelectSessionFile: TMenuItem
        Action = aSelectSessionFile
      end
      object mmiSaveFrameConfig: TMenuItem
        Action = aSaveFrameSession
      end
      object mmiLoadFrameConfig: TMenuItem
        Action = aLoadFrameSession
      end
      object mmiAddPingForm: TMenuItem
        Action = aAddPingForm
        Visible = False
      end
      object mmiClearPingForms: TMenuItem
        Action = aClearPingForms
        Visible = False
      end
    end
    object mmiScreenPresets: TMenuItem
      Caption = 'Screen Presets'
      Visible = False
    end
    object mmiStyles: TMenuItem
      Caption = 'Styles'
    end
    object mmiMisc: TMenuItem
      Caption = 'Misc'
      object mmiShow2: TMenuItem
        Action = aShow2
        AutoCheck = True
      end
      object mmiShowColumn2Resize: TMenuItem
        Caption = 'Show Column 2 Resize'
        OnClick = mmiShowColumn2ResizeClick
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Debug1: TMenuItem
        Caption = 'Debug'
        object mmiInfoMemo: TMenuItem
          Action = aInfoMemo
        end
        object mmiOIForm: TMenuItem
          Action = aOIForm
        end
        object mmiRemoveOrphanFrames: TMenuItem
          Action = aRemoveOrphanFrames
        end
        object mmiShowReload: TMenuItem
          AutoCheck = True
          Caption = 'Show Reload'
          OnClick = mmiShowReloadClick
        end
        object N9: TMenuItem
          Caption = '-'
        end
        object mmiSizeFrames: TMenuItem
          Action = aSizeFrames
        end
        object mmiSizeFrames2: TMenuItem
          Action = aSizeFrames2
        end
      end
      object mmiShow3: TMenuItem
        Action = aShow3
      end
    end
    object mmiReloadAutosaveSession: TMenuItem
      Action = aReloadAutosaveSession
    end
    object mmiSettings: TMenuItem
      Action = aSettings
    end
    object mmiHelp: TMenuItem
      Action = aHelp
    end
    object mmiVersionAbout: TMenuItem
      Caption = 'About'
      OnClick = mmiVersionAboutClick
    end
  end
  object ActionList: TActionList
    Left = 92
    Top = 16
    object aOpenTmpDirInExplorer: TAction
      Category = 'File'
      Caption = 'Open TmpDir in Explorer'
      OnExecute = aOpenTmpDirInExplorerExecute
    end
    object aCopyTmpDirPathToClipboard: TAction
      Category = 'File'
      Caption = 'Copy TmpDir Path To Clipboard'
      OnExecute = aCopyTmpDirPathToClipboardExecute
    end
    object aOpenDtaDirInExplorer: TAction
      Category = 'File'
      Caption = 'Open DtaDir in Explorer'
      OnExecute = aOpenDtaDirInExplorerExecute
    end
    object aCopyDtaDirPathToClipboard: TAction
      Category = 'File'
      Caption = 'Copy DtaDir Path To Clipboard'
      OnExecute = aCopyDtaDirPathToClipboardExecute
    end
    object aExit: TAction
      Category = 'File'
      Caption = 'Exit'
      OnExecute = aExitExecute
    end
    object aSettings: TAction
      Category = 'Misc'
      Caption = 'Settings'
      OnExecute = aSettingsExecute
    end
    object aLoadListFile: TAction
      Category = 'File'
      Caption = 'Load List File'
      OnExecute = aLoadListFileExecute
    end
    object aSaveListFile: TAction
      Category = 'File'
      Caption = 'Save List File'
      OnExecute = aSaveListFileExecute
    end
    object aSelectListFile: TAction
      Category = 'File'
      Caption = 'Select List File'
      OnExecute = aSelectListFileExecute
    end
    object aOpenLstDirInExplorer: TAction
      Category = 'File'
      Caption = 'Open LstDir In Explorer'
      OnExecute = aOpenLstDirInExplorerExecute
    end
    object aCopyLstDirPathToClipboard: TAction
      Category = 'File'
      Caption = 'Copy LstDir Path To Clipboard'
      OnExecute = aCopyLstDirPathToClipboardExecute
    end
    object aAddPingFrame: TAction
      Category = 'Ping'
      Caption = 'Add Frame'
      OnExecute = aAddPingFrameExecute
    end
    object aClearPingFrames: TAction
      Category = 'Ping'
      Caption = 'Clear Frames'
      OnExecute = aClearPingFramesExecute
    end
    object aOIForm: TAction
      Category = 'Misc'
      Caption = 'Object Inspector'
      OnExecute = aOIFormExecute
    end
    object aAddPingForm: TAction
      Category = 'Ping'
      Caption = 'Add Form'
      OnExecute = aAddPingFormExecute
    end
    object aClearPingForms: TAction
      Category = 'Ping'
      Caption = 'Clear Forms'
      OnExecute = aClearPingFormsExecute
    end
    object aAddNewHost: TAction
      Category = 'HostListbox'
      Caption = 'Add'
      OnExecute = aAddNewHostExecute
    end
    object aSizeFrames: TAction
      Category = 'Misc'
      Caption = 'Size Frames'
      OnExecute = aSizeFramesExecute
    end
    object aPingSelected: TAction
      Category = 'HostListbox'
      Caption = 'Ping Selected'
      OnExecute = aPingSelectedExecute
    end
    object aHLBEditMemo: TAction
      Category = 'HostListbox'
      Caption = 'Edit'
      OnExecute = aHLBEditMemoExecute
    end
    object aSelectAll: TAction
      Category = 'HostListbox'
      Caption = 'Select All'
      OnExecute = aSelectAllExecute
    end
    object aDeleteSelectedHost: TAction
      Category = 'HostListbox'
      Caption = 'Delete'
      OnExecute = aDeleteSelectedHostExecute
    end
    object aPasteFromClipboard: TAction
      Category = 'HostListbox'
      Caption = 'Paste'
      OnExecute = aPasteFromClipboardExecute
    end
    object aCopyToClipboard: TAction
      Category = 'HostListbox'
      Caption = 'Copy'
      OnExecute = aCopyToClipboardExecute
    end
    object aLowerCase: TAction
      Category = 'HostListbox'
      Caption = 'LowerCase'
      OnExecute = aLowerCaseExecute
    end
    object aUpperCase: TAction
      Category = 'HostListbox'
      Caption = 'UpperCase'
      OnExecute = aUpperCaseExecute
    end
    object aSaveFrameSession: TAction
      Category = 'Ping'
      Caption = 'Save Frame Session'
      OnExecute = aSaveFrameSessionExecute
    end
    object aLoadFrameSession: TAction
      Category = 'Ping'
      Caption = 'Load Frame Session'
      OnExecute = aLoadFrameSessionExecute
    end
    object aShow2: TAction
      Category = 'Misc'
      Caption = 'Show Column 2'
      OnExecute = aShow2Execute
    end
    object aShow3: TAction
      Category = 'Misc'
      Caption = 'Show Column 3'
      Visible = False
      OnExecute = aShow3Execute
    end
    object aClearPingFrames2: TAction
      Category = 'Misc'
      Caption = 'Clear Ping Frames Column 2'
      Visible = False
      OnExecute = aClearPingFrames2Execute
    end
    object aPingSelected2: TAction
      Category = 'HostListbox'
      Caption = 'Ping Selected Column 2'
      Visible = False
      OnExecute = aPingSelected2Execute
    end
    object aSizeFrames2: TAction
      Category = 'Misc'
      Caption = 'Size Frames 2'
      Visible = False
      OnExecute = aSizeFrames2Execute
    end
    object aRemoveOrphanFrames: TAction
      Category = 'Misc'
      Caption = 'Remove Orphan Frames'
      OnExecute = aRemoveOrphanFramesExecute
    end
    object aInfoMemo: TAction
      Category = 'Misc'
      Caption = 'InfoMemo'
      OnExecute = aInfoMemoExecute
    end
    object aSelectSessionFile: TAction
      Category = 'Ping'
      Caption = 'Select Session File'
      OnExecute = aSelectSessionFileExecute
    end
    object aStopAllPinging: TAction
      Category = 'Ping'
      Caption = 'Stop All Pinging'
      OnExecute = aStopAllPingingExecute
    end
    object aStartAllPinging: TAction
      Category = 'Ping'
      Caption = 'Start All Pinging'
      OnExecute = aStartAllPingingExecute
    end
    object aOpenSsnDirInExplorer: TAction
      Category = 'File'
      Caption = 'Open SsnDir In Explorer'
      OnExecute = aOpenSsnDirInExplorerExecute
    end
    object aCopySsnDirPathToClipboard: TAction
      Category = 'File'
      Caption = 'Copy SsnDir Path To Clipboard'
      OnExecute = aCopySsnDirPathToClipboardExecute
    end
    object aClearAllFrames: TAction
      Category = 'Ping'
      Caption = 'Clear All Frames'
      OnExecute = aClearAllFramesExecute
    end
    object aReloadAutosaveSession: TAction
      Category = 'Ping'
      Caption = 'Reload'
      Visible = False
      OnExecute = aReloadAutosaveSessionExecute
    end
    object aPingSelectedWithExpand: TAction
      Category = 'HostListbox'
      Caption = 'Ping Selected With Expand'
      OnExecute = aPingSelectedWithExpandExecute
    end
    object aHelp: TAction
      Caption = 'Help'
      Visible = False
      OnExecute = aHelpExecute
    end
  end
  object MostRecentFiles: TMostRecentFiles
    MaxFiles = 8
    ShowFullPath = True
    OwnerMenuItem = mmiFile
    MenuPosition = 3
    OnMenuClick = MostRecentFilesMenuClick
    Left = 292
    Top = 16
  end
  object OpenDialog: TOpenDialog
    Left = 156
    Top = 16
  end
  object SaveDialog: TSaveDialog
    Left = 220
    Top = 16
  end
  object HostListBoxPopupMenu: TPopupMenu
    Left = 220
    Top = 84
    object pmiPingSelected: TMenuItem
      Action = aPingSelected
    end
    object pmiPingSelectedWithExpand: TMenuItem
      Action = aPingSelectedWithExpand
    end
    object pmiClearFrames: TMenuItem
      Action = aClearPingFrames
    end
    object pmiPingSelected2: TMenuItem
      Action = aPingSelected2
    end
    object pmiClearFrames2: TMenuItem
      Action = aClearPingFrames2
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object pmiSelectListFile: TMenuItem
      Action = aSelectListFile
    end
    object pmiLoadListFile: TMenuItem
      Action = aLoadListFile
    end
    object pmiSaveListFile: TMenuItem
      Action = aSaveListFile
    end
    object N7: TMenuItem
      Caption = '-'
    end
    object pmiCopyToClipboard: TMenuItem
      Action = aCopyToClipboard
    end
    object pmiDeleteSelectedHost: TMenuItem
      Action = aDeleteSelectedHost
    end
    object pmiHLBEditMemo: TMenuItem
      Action = aHLBEditMemo
    end
    object pmiAddToHostListboxFromClipboard: TMenuItem
      Action = aPasteFromClipboard
    end
    object pmiSelectAll: TMenuItem
      Action = aSelectAll
    end
    object pmiLowerCase: TMenuItem
      Action = aLowerCase
    end
    object pmiUpperCase: TMenuItem
      Action = aUpperCase
    end
  end
  object FramePM1: TPopupMenu
    OnPopup = FramePM1Popup
    Left = 344
    Top = 84
    object pmiRemoveFrameObject: TMenuItem
      Caption = 'Remove Frame'
      OnClick = pmiRemoveFrameObjectClick
    end
    object pmiClearPingFrames: TMenuItem
      Action = aClearPingFrames
    end
    object pmiClearAllFrames: TMenuItem
      Action = aClearAllFrames
    end
    object pmiMoveUp: TMenuItem
      Caption = 'Move Up'
      OnClick = pmiMoveUpClick
    end
    object pmiMoveDown: TMenuItem
      Caption = 'Move Down'
      OnClick = pmiMoveDownClick
    end
    object pmiMovetoColumn2: TMenuItem
      Caption = 'Move to Column 2'
      Visible = False
      OnClick = pmiMovetoColumn2Click
    end
  end
  object FramePM2: TPopupMenu
    OnPopup = FramePM2Popup
    Left = 429
    Top = 84
    object pmiRemoveFrameObject2: TMenuItem
      Caption = 'Remove Frame'
      OnClick = pmiRemoveFrameObject2Click
    end
    object pmiClearFramesColumn2: TMenuItem
      Action = aClearPingFrames2
      Caption = 'Clear Frames'
    end
    object pmiClearAllFrames2: TMenuItem
      Action = aClearAllFrames
    end
    object pmiMoveUp2: TMenuItem
      Caption = 'Move Up'
      OnClick = pmiMoveUp2Click
    end
    object pmiMoveDown2: TMenuItem
      Caption = 'Move Down'
      OnClick = pmiMoveDown2Click
    end
    object pmiMovetoColumn1: TMenuItem
      Caption = 'Move to Column 1'
      OnClick = pmiMovetoColumn1Click
    end
  end
end
