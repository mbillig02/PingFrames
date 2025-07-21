unit MFUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, VirtualTrees, VCLTee.TeCanvas,
  JvComponentBase, JvBalloonHint, UtlUnit, Menus, About, ActnList,
  System.Actions, System.UITypes, Themes, MruUnit, Vcl.Buttons, ScanPortsUnit;

const
  PgmName = 'PingFrames';
  PgmIni = PgmName + '.INI';
  DtaDirLoc = 'PublicDocs'; // ['MyDocs', 'PublicDocs', 'AppDataRoaming', 'AppDataLocal', 'AppDataCommon']

type
  TTopLeftHeightWidth = record
    Top: Integer;
    Left: Integer;
    Height: Integer;
    Width: Integer;
  end;
  TMainForm = class(TForm)
    aCopyDtaDirPathToClipboard: TAction;
    aCopyTmpDirPathToClipboard: TAction;
    ActionList: TActionList;
    aExit: TAction;
    aOpenDtaDirInExplorer: TAction;
    aOpenTmpDirInExplorer: TAction;
    aSettings: TAction;
    mmiExit: TMenuItem;
    MainMenu: TMainMenu;
    mmiCopyDtaDirPathToClipboard: TMenuItem;
    mmiCopyTmpDirPathToClipboard: TMenuItem;
    mmiFile: TMenuItem;
    mmiOpenDtaDirInExplorer: TMenuItem;
    mmiOpenTmpDirInExplorer: TMenuItem;
    mmiSettings: TMenuItem;
    mmiStyles: TMenuItem;
    mmiVersionAbout: TMenuItem;
    MostRecentFiles: TMostRecentFiles;
    N1: TMenuItem;
    N2: TMenuItem;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    aLoadListFile: TAction;
    aSaveListFile: TAction;
    aSelectListFile: TAction;
    mmiSelectListFile: TMenuItem;
    mmiLoadListFile: TMenuItem;
    mmiSaveListFile: TMenuItem;
    aOpenLstDirInExplorer: TAction;
    aCopyLstDirPathToClipboard: TAction;
    mmiOpenLstDirInExplorer: TMenuItem;
    mmiCopyLstDirPathToClipboard: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    LeftPanel: TPanel;
    Splitter: TSplitter;
    RightPanel: TPanel;
    aAddPingFrame: TAction;
    aClearPingFrames: TAction;
    aOIForm: TAction;
    mmiMisc: TMenuItem;
    mmiAddPingFrame: TMenuItem;
    mmiClearPingFrames: TMenuItem;
    mmiPing: TMenuItem;
    mmiOIForm: TMenuItem;
    N5: TMenuItem;
    mmiAddPingForm: TMenuItem;
    mmiClearPingForms: TMenuItem;
    HostListBox: TListBox;
    HostListBoxPopupMenu: TPopupMenu;
    LeftTopPanel: TPanel;
    NewHostEdit: TEdit;
    AddNewHostSpeedButton: TSpeedButton;
    aAddNewHost: TAction;
    pmiLoadListFile: TMenuItem;
    pmiSelectListFile: TMenuItem;
    pmiSaveListFile: TMenuItem;
    N6: TMenuItem;
    aHLBEditMemo: TAction;
    pmiHLBEditMemo: TMenuItem;
    N7: TMenuItem;
    aSizeFrames: TAction;
    mmiSizeFrames: TMenuItem;
    aPingSelected: TAction;
    pmiPingSelected: TMenuItem;
    pmiClearFrames: TMenuItem;
    FramePM1: TPopupMenu;
    pmiRemoveFrameObject: TMenuItem;
    pmiSelectAll: TMenuItem;
    aSelectAll: TAction;
    mmiScreenPresets: TMenuItem;
    aDeleteSelectedHost: TAction;
    pmiDeleteSelectedHost: TMenuItem;
    aPasteFromClipboard: TAction;
    pmiAddToHostListboxFromClipboard: TMenuItem;
    aCopyToClipboard: TAction;
    pmiCopyToClipboard: TMenuItem;
    aLowerCase: TAction;
    aUpperCase: TAction;
    pmiLowerCase: TMenuItem;
    pmiUpperCase: TMenuItem;
    aSaveFrameSession: TAction;
    mmiSaveFrameConfig: TMenuItem;
    aLoadFrameSession: TAction;
    mmiLoadFrameConfig: TMenuItem;
    ColumnPanel1: TPanel;
    ColumnPanel3: TPanel;
    Splitter23: TSplitter;
    ColumnPanel2: TPanel;
    Splitter12: TSplitter;
    aShow2: TAction;
    mmiShow2: TMenuItem;
    aShow3: TAction;
    mmiShow3: TMenuItem;
    aClearPingFrames2: TAction;
    mmiClearPingFrames2: TMenuItem;
    aPingSelected2: TAction;
    pmiPingSelected2: TMenuItem;
    FramePM2: TPopupMenu;
    pmiRemoveFrameObject2: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    pmiClearFrames2: TMenuItem;
    pmiClearFramesColumn2: TMenuItem;
    pmiClearPingFrames: TMenuItem;
    aSizeFrames2: TAction;
    mmiSizeFrames2: TMenuItem;
    pmiMoveUp: TMenuItem;
    pmiMoveDown: TMenuItem;
    pmiMoveUp2: TMenuItem;
    pmiMoveDown2: TMenuItem;
    pmiMovetoColumn2: TMenuItem;
    pmiMovetoColumn1: TMenuItem;
    aRemoveOrphanFrames: TAction;
    aInfoMemo: TAction;
    mmiInfoMemo: TMenuItem;
    mmiRemoveOrphanFrames: TMenuItem;
    aSelectSessionFile: TAction;
    mmiSelectSessionFile: TMenuItem;
    mmiShowColumn2Resize: TMenuItem;
    aStopAllPinging: TAction;
    mmiStopAllPinging: TMenuItem;
    N10: TMenuItem;
    aStartAllPinging: TAction;
    mmiStartAllPinging: TMenuItem;
    aOpenSsnDirInExplorer: TAction;
    aCopySsnDirPathToClipboard: TAction;
    mmiOpenSsnDirInExplorer: TMenuItem;
    N11: TMenuItem;
    mmiCopySsnDirPathToClipboard: TMenuItem;
    Debug1: TMenuItem;
    aClearAllFrames: TAction;
    mmiClearAllFrames: TMenuItem;
    pmiClearAllFrames: TMenuItem;
    pmiClearAllFrames2: TMenuItem;
    aReloadAutosaveSession: TAction;
    mmiReloadAutosaveSession: TMenuItem;
    mmiShowReload: TMenuItem;
    aPingSelectedWithExpand: TAction;
    pmiPingSelectedWithExpand: TMenuItem;
    mmiDirectories: TMenuItem;
    mmiHelp: TMenuItem;
    aHelp: TAction;
    pmiScanPorts: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    function GetDtaDir: String;
    function GetLstDir: String;
    function GetServiceListFileName: String;
    function GetSsnDir: String;
    function GetTmpDir: String;
    procedure aCopyDtaDirPathToClipboardExecute(Sender: TObject);
    procedure aCopyLstDirPathToClipboardExecute(Sender: TObject);
    procedure aCopyTmpDirPathToClipboardExecute(Sender: TObject);
    procedure aExitExecute(Sender: TObject);
    procedure aLoadListFileExecute(Sender: TObject);
    procedure aOpenDtaDirInExplorerExecute(Sender: TObject);
    procedure aOpenLstDirInExplorerExecute(Sender: TObject);
    procedure aOpenTmpDirInExplorerExecute(Sender: TObject);
    procedure aSaveListFileExecute(Sender: TObject);
    procedure aSelectListFileExecute(Sender: TObject);
    procedure aSettingsExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure InfoMemoKeyPress(Sender: TObject; var Key: Char);
    procedure mmiVersionAboutClick(Sender: TObject);
    procedure MostRecentFilesMenuClick(Sender: TObject; const Filename: string);
    procedure RightMenu(mmiMoveRight: TMenuItem);
    procedure SetServiceListFileName(ServiceListFileName: String);
    procedure UpdateScrPosEdits;
    procedure aAddPingFrameExecute(Sender: TObject);
    procedure aClearPingFramesExecute(Sender: TObject);
    procedure aOIFormExecute(Sender: TObject);
    procedure HostListBoxMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure aAddNewHostExecute(Sender: TObject);
    procedure aHLBEditMemoExecute(Sender: TObject);
    procedure aSizeFramesExecute(Sender: TObject);
    procedure aPingSelectedExecute(Sender: TObject);
    procedure pmiRemoveFrameObjectClick(Sender: TObject);
    procedure aSelectAllExecute(Sender: TObject);
    procedure ScreenPresetsClick(Sender: TObject);
    procedure PopulateScreenPresetsMenu;
    procedure aDeleteSelectedHostExecute(Sender: TObject);
    procedure aPasteFromClipboardExecute(Sender: TObject);
    procedure aCopyToClipboardExecute(Sender: TObject);
    procedure aLowerCaseExecute(Sender: TObject);
    procedure aUpperCaseExecute(Sender: TObject);
    procedure FramePM1Popup(Sender: TObject);
    procedure aSaveFrameSessionExecute(Sender: TObject);
    procedure aLoadFrameSessionExecute(Sender: TObject);
    procedure HostListBoxDblClick(Sender: TObject);
    procedure aShow2Execute(Sender: TObject);
    procedure aShow3Execute(Sender: TObject);
    procedure aClearPingFrames2Execute(Sender: TObject);
    procedure aPingSelected2Execute(Sender: TObject);
    procedure pmiRemoveFrameObject2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure aSizeFrames2Execute(Sender: TObject);
    procedure pmiMoveUpClick(Sender: TObject);
    procedure pmiMoveDownClick(Sender: TObject);
    procedure pmiMoveUp2Click(Sender: TObject);
    procedure FramePM2Popup(Sender: TObject);
    procedure pmiMoveDown2Click(Sender: TObject);
    procedure pmiMovetoColumn2Click(Sender: TObject);
    procedure pmiMovetoColumn1Click(Sender: TObject);
    procedure aRemoveOrphanFramesExecute(Sender: TObject);
    procedure aInfoMemoExecute(Sender: TObject);
    procedure aSelectSessionFileExecute(Sender: TObject);
    procedure mmiShowColumn2ResizeClick(Sender: TObject);
    procedure HostListBoxKeyPress(Sender: TObject; var Key: Char);
    procedure HostListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure aStopAllPingingExecute(Sender: TObject);
    procedure aStartAllPingingExecute(Sender: TObject);
    procedure aOpenSsnDirInExplorerExecute(Sender: TObject);
    procedure aCopySsnDirPathToClipboardExecute(Sender: TObject);
    procedure aClearAllFramesExecute(Sender: TObject);
    procedure aReloadAutosaveSessionExecute(Sender: TObject);
    procedure mmiShowReloadClick(Sender: TObject);
    procedure aPingSelectedWithExpandExecute(Sender: TObject);
    procedure aHelpExecute(Sender: TObject);
    procedure pmiScanPortsClick(Sender: TObject);
  private
    aMsgDlgTm: TForm;
    DlgLbl: TLabel;
    CntDwn: integer;
    procedure MyOnTimer(Sender: TObject);
    function FindMenuItemByHint(AMainMenu: TMainMenu; const Hint: String): TMenuItem;
    function MatchingFileName(ListOfEditsText: String): String;
    procedure AddStylesToListBox;
    procedure AddStylesToMainMenu(StylesCaption: String);
    procedure CheckStyle(Menu: TMenuItem; StyleStr: String);
    procedure LoadListFile(FileName: String);
    procedure LoadSettingsFromFormActivate;
    procedure LoadSettingsFromFormCreate;
    procedure LoadSettingsLateFormActivate;
    procedure LoadStyleSettings;
    procedure mmiStylesClick(Sender: TObject);
    procedure OnMoving(var Msg: TWMMoving); message WM_MOVING;
    procedure OpenDirectory(DirectoryName: String);
    procedure RestoreMainFormPositionAndSize;
    procedure SaveSettings;
    procedure UnCheckStyles(Menu: TMenuItem);
    procedure AddPingFrame1;
    procedure ClearPingFrames1;
    procedure SizeFrames1;
    procedure NewFrameFromSelectedHost1(HostToPing: String; AutoStart: Boolean);
    procedure LoadFrameConfig(FrameConfigFileName: String);
    procedure SaveFrameConfig(FrameConfigFileName: String);
    procedure PingSelected1(AutoStart: Boolean);
    procedure ClearPingFrames2;
    procedure NewFrameFromSelectedHost2(HostToPing: String; AutoStart: Boolean);
    procedure PingSelected2(AutoStart: Boolean);
    procedure SizeFrames2;
    procedure SetColumn2;
    procedure AddPingFrame2;
    procedure SetColumn2Resize;
    procedure HLBCopyToClpBrd;
    procedure HLBDeleteSelected;
    procedure NewFrameFromSelectedHostWithExpand(HostToPing: String;
      AutoStart: Boolean);
    procedure SizeFramesWithExpand;
    procedure PingSelectedWithExpand(AutoStart: Boolean);
    procedure StopPinging1(var ActivePingsB: Boolean);
    procedure ClearFrames1;
    procedure StopPinging2(var ActivePingsB: Boolean);
    procedure ClearFrames2;
    procedure ClearAllFrames;
    function MyMessageDlgTm(const Msg: String; DlgType: TMsgDlgType; Button: TMsgDlgButtons;
      Caption: array of String; DlgCaption: String; DefaultButton: TMsgDlgBtn;
      const AppRect: TRect; CntDwnFrm: Integer): Integer;
    procedure MinusFrames1;
    procedure MinusFrames2;
    { Private declarations }
  protected
    procedure WMEnterSizeMove(var Msg: TMessage); message WM_ENTERSIZEMOVE;
    procedure WMExitSizeMove(var Msg: TMessage); message WM_EXITSIZEMOVE;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  ExeDir, DtaDir, TmpDir, LstDir, StyleStr, SsnDir: String;
  MainFormDefaultRect, MainFormRect: TTopLeftHeightWidth;
  SaveFormSize, SaveFormPosition, StylesMM, StylesEnabled, AutoStartPinging,
  StartTimeoutPnlVisible, ConvertToLC, ConvertToUC, PauseForRemoveFrame, SaveHostListBoxWidth, StartPingingOnFrameCreate, ThrowAwayFirstPing: Boolean;
  CntDwnFrm: Integer;

implementation

uses
  JclSecurity, ShellApi, ClipBrd, JclSysInfo, IniFiles, PerlRegex,
  SelectFileUnit, SetUnit, JclAnsiStrings, System.IOUtils, IMUnit,
  PingFrameUnit, OIUnit, HLBEditMemoUnit;

const
//  standard DPI settings are 100% (96 DPI), 125% (120 DPI), and 150% (144 DPI).
//  DPIValue = 96; // 100%
//  DPIValue = 120; // 125%
  DPIValue = 144; // 150% // I’m designing at 144 DPI
//  DPIValue = 192; // 200%

var
  FInitialized: Boolean;
  FServiceListFileName: String;
  PingFrameA1, PingFrameA2: array of TPingFrame;
  TimeToWait, HeightBeforeResize: Integer;

{$R *.dfm}

function MyMessageDlg(const Msg: String; DlgType: TMsgDlgType; Button: TMsgDlgButtons;
  Caption: array of String; DlgCaption: String; DefaultButton: TMsgDlgBtn;
  const AppRect: TRect): Integer;
var
  aMsgDlg: TForm;
  i: Integer;
  DlgButton: TButton;
  CaptionIndex: Integer;
begin
  aMsgdlg := CreateMessageDialog(Msg, DlgType, Button, DefaultButton);
  aMsgdlg.Caption := DlgCaption;
  aMsgdlg.BorderIcons := aMsgdlg.BorderIcons - [biSystemMenu];
  aMsgdlg.BorderStyle := bsSingle;

  aMsgdlg.Left := AppRect.Left + (AppRect.Width - aMsgdlg.Width) div 2;
  aMsgdlg.Top := AppRect.Top + (AppRect.Height - aMsgdlg.Height) div 2;

  CaptionIndex := 0;
  for i := 0 to aMsgDlg.ComponentCount - 1 Do
  begin
    if (aMsgDlg.Components[i] is TButton) then
    begin
      DlgButton := TButton(aMsgDlg.Components[i]);
      if CaptionIndex <= High(Caption) then
        DlgButton.Caption := Caption[CaptionIndex];
      inc(CaptionIndex);
    end;
  end;
  Result := aMsgdlg.ShowModal;
end;

function TMainForm.MyMessageDlgTm(const Msg: String; DlgType: TMsgDlgType; Button: TMsgDlgButtons;
  Caption: array of String; DlgCaption: String; DefaultButton: TMsgDlgBtn;
  const AppRect: TRect; CntDwnFrm: Integer): Integer;
var
  i: Integer;
  DlgButton: TButton;
  CaptionIndex: Integer;
  CntTmr: TTimer;
begin
  aMsgDlgTm := CreateMessageDialog(Msg, DlgType, Button, DefaultButton);
  aMsgDlgTm.Caption := DlgCaption;
  aMsgDlgTm.BorderIcons := aMsgDlgTm.BorderIcons - [biSystemMenu];
  aMsgDlgTm.BorderStyle := bsSingle;

  aMsgDlgTm.Left := AppRect.Left + (AppRect.Width - aMsgDlgTm.Width) div 2;
  aMsgDlgTm.Top := AppRect.Top + (AppRect.Height - aMsgDlgTm.Height) div 2;

  DlgLbl := TLabel.Create(aMsgDlgTm) ;
  CntTmr := TTimer.Create(aMsgDlgTm);
  CntDwn := CntDwnFrm;

  // Label
  DlgLbl.Parent := aMsgDlgTm;
  DlgLbl.Caption := 'Auto continue in: ' + IntToStr(CntDwn);

  if Screen.PixelsPerInch = DPIValue then
  begin
    DlgLbl.Top := 50;
    DlgLbl.Left := 88;
  end
  else
  begin
    DlgLbl.Top := MulDiv(50, Screen.PixelsPerInch, DPIValue);
    DlgLbl.Left := MulDiv(88, Screen.PixelsPerInch, DPIValue);
  end;

  // Timer
  CntTmr.Interval := 1000;
  CntTmr.OnTimer := myOnTimer;
  CntTmr.Enabled := True;

  CaptionIndex := 0;
  for i := 0 to aMsgDlgTm.ComponentCount - 1 Do
  begin
    if (aMsgDlgTm.Components[i] is TButton) then
    begin
      DlgButton := TButton(aMsgDlgTm.Components[i]);
      if CaptionIndex <= High(Caption) then
        DlgButton.Caption := Caption[CaptionIndex];
      inc(CaptionIndex);
    end;
  end;
  Result := aMsgDlgTm.ShowModal;
end;

procedure TMainForm.MyOnTimer(Sender: TObject);
begin
  Dec(CntDwn);
  DlgLbl.Caption := 'Auto continue in: ' + IntToStr(CntDwn);
  if (CntDwn <= -1) then
  begin
    (Sender as TTimer).Enabled := False;
    aMsgDlgTm.Close;
  end;
end;

procedure TMainForm.WMEnterSizeMove(var Msg: TMessage);
begin
  HeightBeforeResize := MainForm.Height;
end;

procedure TMainForm.WMExitSizeMove(var Msg: TMessage);
begin
  if HeightBeforeResize <> MainForm.Height then
  begin
    SizeFrames1;
    SizeFrames2;
  end;
end;

procedure TMainForm.ClearAllFrames;
var
  ActivePingsB: Boolean;
begin
  ActivePingsB := False;
  StopPinging1(ActivePingsB);
  StopPinging2(ActivePingsB);
  Sleep(TimeToWait);
  if PauseForRemoveFrame and ActivePingsB then
    MyMessageDlgTm('Pausing for pings to finish!', mtConfirmation, [mbYes], ['Continue'], 'Confirmation', mbYes, Rect(MainForm.Left, MainForm.Top, MainForm.Left + MainForm.Width, MainForm.Top + MainForm.Height), CntDwnFrm);
  MinusFrames1; ClearFrames1;
  MinusFrames2; ClearFrames2;
end;

procedure TMainForm.ClearFrames2;
var
  i: Integer;
begin
  for i := 0 to High(PingFrameA2) do
  begin
    repeat
      Application.ProcessMessages;
    until PingFrameA2[i].ThreadInProgressLbl.Caption = '-';
    if Assigned(PingFrameA2[i]) then
    begin
      PingFrameA2[i].Free;
      PingFrameA2[i] := nil;
    end;
  end;
  SetLength(PingFrameA2, 0);
end;

procedure TMainForm.StopPinging2(var ActivePingsB: Boolean);
var
  i: Integer;
begin
  for i := 0 to High(PingFrameA2) do
  begin
    if PingFrameA2[i].ContinuousPingSpdBtn.Down then
    begin
      PingFrameA2[i].ContinuousPingSpdBtn.Down := False;
      PingFrameA2[i].ContinuousPingSpdBtnClick(nil);
      ActivePingsB := True;
    end;
    PingFrameA2[i].PingTimer.Enabled := False;
  end;
end;

procedure TMainForm.ClearFrames1;
var
  i: Integer;
begin
  for i := 0 to High(PingFrameA1) do
  begin
    repeat
      Application.ProcessMessages;
    until PingFrameA1[i].ThreadInProgressLbl.Caption = '-';
    if Assigned(PingFrameA1[i]) then
    begin
      PingFrameA1[i].Free;
      PingFrameA1[i] := nil;
    end;
  end;
  SetLength(PingFrameA1, 0);
end;

procedure TMainForm.MinusFrames1;
var
  i: Integer;
begin
  for i := 0 to High(PingFrameA1) do
    if Assigned(PingFrameA1[i]) then
      PingFrameA1[i].ThreadInProgressLbl.Caption := '-';
end;

procedure TMainForm.MinusFrames2;
var
  i: Integer;
begin
  for i := 0 to High(PingFrameA2) do
    if Assigned(PingFrameA2[i]) then
      PingFrameA2[i].ThreadInProgressLbl.Caption := '-';
end;

procedure TMainForm.StopPinging1(var ActivePingsB: Boolean);
var
  i: Integer;
begin
  for i := 0 to High(PingFrameA1) do
  begin
    if PingFrameA1[i].ContinuousPingSpdBtn.Down then
    begin
      PingFrameA1[i].ContinuousPingSpdBtn.Down := False;
      PingFrameA1[i].ContinuousPingSpdBtnClick(nil);
      ActivePingsB := True;
    end;
    PingFrameA1[i].PingTimer.Enabled := False;
  end;
end;

procedure TMainForm.HLBCopyToClpBrd;
var
  TmpStrLst: TStringList;
  i: Integer;
begin
  TmpStrLst := TStringList.Create;
  for i := 0 to HostListbox.Count - 1 do
    if HostListbox.Selected[i] then
      TmpStrLst.Append(HostListbox.Items[i]);
  if TmpStrLst.Count > 1 then
  begin
    Clipboard.AsText := TmpStrLst.Text;
  end
  else
  begin
    Clipboard.AsText := StringReplace(StringReplace(TmpStrLst.Text, sLineBreak, '', [rfReplaceAll]), ''#10''#13'', '', [rfReplaceAll]);
  end;
  TmpStrLst.Free;
end;

procedure TMainForm.HLBDeleteSelected;
var
  i: Integer;
begin
  for i := HostListbox.Count - 1 downto 0 do
    if HostListbox.Selected[i] then HostListBox.Items.Delete(i);
end;

procedure TMainForm.SetColumn2;
begin
  mmiShowColumn2Resize.Checked := mmiShow2.Checked;
  if mmiShow2.Checked then
  begin
    if mmiShow3.Checked then
    begin
      ColumnPanel2.Width := (RightPanel.Width - (Splitter12.Width + Splitter23.Width)) div 3;
    end
    else
    begin
      ColumnPanel2.Width := (RightPanel.Width - (Splitter12.Width + Splitter23.Width)) div 2;
    end;
    ColumnPanel2.Caption := '';
    ColumnPanel2.Visible := True;
    Splitter12.Visible := True;
    aPingSelected2.Visible := True;
    aClearPingFrames2.Visible := True;
    aSizeFrames2.Visible := True;
    pmiMoveToColumn2.Visible := True;
  end
  else
  begin
    ClearPingFrames2;
    ColumnPanel2.Visible := False;
    Splitter12.Visible := False;
    aShow3.Visible := False;
    aPingSelected2.Visible := False;
    aClearPingFrames2.Visible := False;
    aSizeFrames2.Visible := False;
    pmiMoveToColumn2.Visible := False;
  end;
end;

procedure TMainForm.SetColumn2Resize;
begin
  mmiShow2.Checked := not mmiShow2.Checked;
  mmiShowColumn2Resize.Checked := mmiShow2.Checked;
  if mmiShow2.Checked then
  begin
    MainForm.Width := MainForm.Width + ColumnPanel1.Width + Splitter12.Width;
    if mmiShow3.Checked then
    begin
      ColumnPanel2.Width := (RightPanel.Width - (Splitter12.Width + Splitter23.Width)) div 3;
    end
    else
    begin
      ColumnPanel2.Width := (RightPanel.Width - (Splitter12.Width + Splitter23.Width)) div 2;
    end;
    ColumnPanel2.Caption := '';
    ColumnPanel2.Visible := True;
    Splitter12.Visible := True;
    aPingSelected2.Visible := True;
    aClearPingFrames2.Visible := True;
    aSizeFrames2.Visible := True;
    pmiMoveToColumn2.Visible := True;
  end
  else
  begin
    MainForm.Width := MainForm.Width - (ColumnPanel2.Width + Splitter12.Width) - 1;
    ClearPingFrames2;
    ColumnPanel2.Visible := False;
    Splitter12.Visible := False;
    aShow3.Visible := False;
    aPingSelected2.Visible := False;
    aClearPingFrames2.Visible := False;
    aSizeFrames2.Visible := False;
    pmiMoveToColumn1.Visible := False;
    pmiMoveToColumn2.Visible := False;
  end;
end;

procedure TMainForm.PingSelected1(AutoStart: Boolean);
var
  i: Integer;
begin
  for i := 0 to HostListbox.Count - 1 do
  begin
    if HostListbox.Selected[i] then
    begin
      NewFrameFromSelectedHost1(HostListBox.Items[i], AutoStart);
    end;
  end;
end;

procedure TMainForm.PingSelectedWithExpand(AutoStart: Boolean);
var
  i: Integer;
begin
  for i := 0 to HostListbox.Count - 1 do
  begin
    if HostListbox.Selected[i] then
    begin
      NewFrameFromSelectedHostWithExpand(HostListBox.Items[i], AutoStart);
    end;
  end;
end;

procedure TMainForm.PingSelected2(AutoStart: Boolean);
var
  i: Integer;
begin
  for i := 0 to HostListbox.Count - 1 do
  begin
    if HostListbox.Selected[i] then
    begin
      NewFrameFromSelectedHost2(HostListBox.Items[i], AutoStart);
    end;
  end;
end;

procedure TMainForm.SaveFrameConfig(FrameConfigFileName: String);
var
  RegIniFile: TIniFile;
  TmpStr: String;
  i: Integer;
begin
  RegIniFile := TIniFile.Create(FrameConfigFileName);
  try
    TmpStr := 'T:' + IntToStr(MainForm.Top) + ' | ' + 'L:' + IntToStr(MainForm.Left) + ' | ' + 'H:' + IntToStr(MainForm.Height) + ' | ' + 'W:' + IntToStr(MainForm.Width);
    RegIniFile.WriteString('Screen', 'Preset', TmpStr);
    RegIniFile.WriteInteger('Frame', 'Count', Length(PingFrameA1));
    RegIniFile.WriteBool('FrameColumn2', 'Visible', mmiShow2.Checked);
    RegIniFile.WriteInteger('Frame2', 'Count', Length(PingFrameA2));
    for i := 0 to Length(PingFrameA1) - 1 do
    begin
      RegIniFile.WriteString('Frame_' + IntToStr(i), 'HostEditText', PingFrameA1[i].HostEdit.Text);
      RegIniFile.WriteInteger('Frame_' + IntToStr(i), 'SpinEditValue', StrToIntDef(PingFrameA1[i].PointsEdit.Text, 1));
      RegIniFile.WriteBool('Frame_' + IntToStr(i), 'BottomRightPanelVisible', PingFrameA1[i].BottomRightPanel.Visible);
      RegIniFile.WriteInteger('Frame_' + IntToStr(i), 'IPAddressStatusPnlWidth', PingFrameA1[i].IPAddressStatusPnl.Width);
      RegIniFile.WriteBool('Frame_' + IntToStr(i), 'AutoStart', PingFrameA1[i].ContinuousPingSpdBtn.Down);
    end;
    if mmiShow2.Checked then
    begin
      for i := 0 to Length(PingFrameA2) - 1 do
      begin
        RegIniFile.WriteString('Frame2_' + IntToStr(i), 'HostEditText', PingFrameA2[i].HostEdit.Text);
        RegIniFile.WriteInteger('Frame2_' + IntToStr(i), 'SpinEditValue', StrToIntDef(PingFrameA2[i].PointsEdit.Text, 1));
        RegIniFile.WriteBool('Frame2_' + IntToStr(i), 'BottomRightPanelVisible', PingFrameA2[i].BottomRightPanel.Visible);
        RegIniFile.WriteInteger('Frame_2' + IntToStr(i), 'IPAddressStatusPnlWidth', PingFrameA2[i].IPAddressStatusPnl.Width);
        RegIniFile.WriteBool('Frame2_' + IntToStr(i), 'AutoStart', PingFrameA2[i].ContinuousPingSpdBtn.Down);
      end;
    end;
  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.LoadFrameConfig(FrameConfigFileName: String);
var
  RegIniFile: TIniFile;
  TmpStr: String;
  Regex: TPerlRegEx;
  FrameCount, FrameCount2: Integer;
  i: Integer;
  AutoStart: Boolean;
begin
  ClearAllFrames;
  RegIniFile := TIniFile.Create(FrameConfigFileName);
  try
    TmpStr := RegIniFile.ReadString('Screen', 'Preset', '');
    Regex := TPerlRegEx.Create;
    try
      Regex.RegEx := 'T:(?<Top>[0-9]+) \| L:(?<Left>[0-9]+) \| H:(?<Height>[0-9]+) \| W:(?<Width>[0-9]+)';
      Regex.Options := [];
      Regex.State := [];
      Regex.Subject := TmpStr;
      if Regex.Match then
      begin
        MainForm.Top := StrToInt(Utf8ToAnsi(Regex.Groups[1]));
        MainForm.Left := StrToInt(Utf8ToAnsi(Regex.Groups[2]));
        MainForm.Height := StrToInt(Utf8ToAnsi(Regex.Groups[3]));
        MainForm.Width := StrToInt(Utf8ToAnsi(Regex.Groups[4]));
      end;
    finally
      Regex.Free;
    end;

    mmiShow2.Checked := RegIniFile.ReadBool('FrameColumn2', 'Visible', False);
    SetColumn2;

    FrameCount := RegIniFile.ReadInteger('Frame', 'Count', 0);
    for i := 0 to FrameCount - 1 do
    begin
      AddPingFrame1;
      PingFrameA1[i].HostEdit.Text := RegIniFile.ReadString('Frame_' + IntToStr(i), 'HostEditText', 'LocalHost');
      PingFrameA1[i].PointsEdit.Text := IntToStr(RegIniFile.ReadInteger('Frame_' + IntToStr(i), 'SpinEditValue', 180));
      PingFrameA1[i].BottomRightPanel.Visible := RegIniFile.ReadBool('Frame_' + IntToStr(i), 'BottomRightPanelVisible', False);
      if RegIniFile.ValueExists('Frame_' + IntToStr(i), 'IPAddressStatusPnlWidth') then
      begin
        PingFrameA1[i].IPAddressStatusPnl.Width := RegIniFile.ReadInteger('Frame_' + IntToStr(i), 'IPAddressStatusPnlWidth', 371);
      end
      else
      begin
        PingFrameA1[i].AutoSizeHostEditWidth;
      end;
      AutoStart := RegIniFile.ReadBool('Frame_' + IntToStr(i), 'AutoStart', False);
      if AutoStart then
      begin
        PingFrameA1[i].ContinuousPingSpdBtn.Down := True;
        PingFrameA1[i].ContinuousPingSpdBtnClick(nil);
      end;
    end;

    FrameCount2 := RegIniFile.ReadInteger('Frame2', 'Count', 0);

    for i := 0 to FrameCount2 - 1 do
    begin
      AddPingFrame2;
      PingFrameA2[i].HostEdit.Text := RegIniFile.ReadString('Frame2_' + IntToStr(i), 'HostEditText', 'LocalHost');
      PingFrameA2[i].PointsEdit.Text := IntToStr(RegIniFile.ReadInteger('Frame2_' + IntToStr(i), 'SpinEditValue', 180));
      PingFrameA2[i].BottomRightPanel.Visible := RegIniFile.ReadBool('Frame2_' + IntToStr(i), 'BottomRightPanelVisible', False);
      if RegIniFile.ValueExists('Frame2_' + IntToStr(i), 'IPAddressStatusPnlWidth') then
      begin
        PingFrameA2[i].IPAddressStatusPnl.Width := RegIniFile.ReadInteger('Frame_2' + IntToStr(i), 'IPAddressStatusPnlWidth', 371);
      end
      else
      begin
        PingFrameA2[i].AutoSizeHostEditWidth;
      end;
      AutoStart := RegIniFile.ReadBool('Frame2_' + IntToStr(i), 'AutoStart', False);
      if AutoStart then
      begin
        PingFrameA2[i].ContinuousPingSpdBtn.Down := True;
        PingFrameA2[i].ContinuousPingSpdBtnClick(nil);
      end;
    end;
  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.PopulateScreenPresetsMenu;
var
  i: Integer;
  RootAccessItem: TMenuItem;
begin
  while mmiScreenPresets.Count > 0 do mmiScreenPresets.Delete(0);
  for i := 0 to SettingsForm.MainFormSettingsListBox.Count - 1 do
  begin
    if SettingsForm.MainFormSettingsListBox.Checked[i] then
    begin
      RootAccessItem := TMenuItem.Create(Self);
      RootAccessItem.Caption := SettingsForm.MainFormSettingsListBox.Items[i];
      RootAccessItem.Hint := SettingsForm.MainFormSettingsListBox.Items[i];
      RootAccessItem.Tag := i;
      RootAccessItem.OnClick := ScreenPresetsClick;
      mmiScreenPresets.Add(RootAccessItem);
    end;
  end;
  if mmiScreenPresets.Count = 0 then
  begin
    mmiScreenPresets.Visible := False;
  end
  else
  begin
    mmiScreenPresets.Visible := True;
  end;
  RightMenu(mmiVersionAbout); // Run after change to MainMenu
end;

procedure TMainForm.mmiVersionAboutClick(Sender: TObject);
begin
  TAboutBox.Execute;
end;

procedure TMainForm.MostRecentFilesMenuClick(Sender: TObject;
  const Filename: string);
begin
  LoadListFile(FileName);
end;

function TMainForm.GetServiceListFileName: String;
begin
  Result := FServiceListFileName;
end;

procedure TMainForm.SetServiceListFileName(ServiceListFileName: String);
begin
  FServiceListFileName := ServiceListFileName;
end;

function TMainForm.GetDtaDir: String;
begin
  Result := DtaDir;
end;

function TMainForm.GetLstDir: String;
begin
  Result := LstDir;
end;

function TMainForm.GetSsnDir: String;
begin
  Result := SsnDir;
end;

function TMainForm.GetTmpDir: String;
begin
  Result := TmpDir;
end;

procedure TMainForm.HostListBoxDblClick(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) then
  begin
    PingSelected1(not StartPingingOnFrameCreate);
  end
  else
  begin
    PingSelected1(StartPingingOnFrameCreate);
  end;
end;

procedure TMainForm.HostListBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then HLBDeleteSelected;
end;

procedure TMainForm.HostListBoxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^A then
  begin
    (Sender as TListBox).SelectAll;
    Key := #0;
  end;
  if Key = ^C then
  begin
    HLBCopyToClpBrd;
    Key := #0;
  end;
end;

procedure TMainForm.HostListBoxMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  HostListBox.ItemIndex := HostListBox.ItemAtPos(Point(X, Y), True);
  if HostListbox.SelCount = 0 then
  begin
    HostListbox.Selected[HostListBox.ItemIndex] := True;
  end;
end;

procedure TMainForm.InfoMemoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = ^A then
  begin
    (Sender as TMemo).SelectAll;
    Key := #0;
  end;
end;

procedure TMainForm.aAddNewHostExecute(Sender: TObject);
begin
  if Length(Trim(NewHostEdit.Text)) > 0 then
  begin
    HostListBox.Items.Append(Trim(NewHostEdit.Text));
    NewHostEdit.Text := '';
  end;
end;

procedure TMainForm.aAddPingFrameExecute(Sender: TObject);
begin
  AddPingFrame1;
end;

procedure TMainForm.aPasteFromClipboardExecute(Sender: TObject);
var
  TmpStrLst: TStringList;
  i: Integer;
begin
  { TODO : Verify with regex }
  TmpStrLst := TStringList.Create;
  TmpStrLst.Text := Clipboard.AsText;
  for i := 0 to TmpStrLst.Count - 1 do
  begin
    if Length(Trim(TmpStrLst[i])) > 0 then
    begin
      if ConvertToLC then
      begin
        HostListbox.Items.Append(LowerCase(TmpStrLst[i]));
      end
      else
      begin
        if ConvertToUC then
        begin
          HostListbox.Items.Append(UpperCase(TmpStrLst[i]));
        end
        else
        begin
          HostListbox.Items.Append(TmpStrLst[i]);
        end;
      end;
    end;
  end;
  TmpStrLst.Free;
end;

procedure TMainForm.aClearPingFrames2Execute(Sender: TObject);
begin
  ClearPingFrames2;
end;

procedure TMainForm.aClearAllFramesExecute(Sender: TObject);
begin
  ClearAllFrames;
end;

procedure TMainForm.aClearPingFramesExecute(Sender: TObject);
begin
  ClearPingFrames1;
end;

procedure TMainForm.aCopyDtaDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := DtaDir;
end;

procedure TMainForm.aCopyLstDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := LstDir;
end;

procedure TMainForm.aCopySsnDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := SsnDir;
end;

procedure TMainForm.aCopyTmpDirPathToClipboardExecute(Sender: TObject);
begin
  Clipboard.AsText := TmpDir;
end;

procedure TMainForm.aCopyToClipboardExecute(Sender: TObject);
begin
  HLBCopyToClpBrd;
end;

procedure TMainForm.aDeleteSelectedHostExecute(Sender: TObject);
begin
  if HostListbox.ItemIndex > -1 then
  begin
    HostListbox.DeleteSelected;
  end;
end;

procedure TMainForm.aExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.aHelpExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PChar(ExeDir + 'PingFrames.chm'), nil, nil, SW_SHOWNORMAL);
end;

procedure TMainForm.aHLBEditMemoExecute(Sender: TObject);
var
  i, ModalResult: Integer;
begin
  HLBEditMemoDlg.ListBoxEditMemo.Text := HostListbox.Items.Text;
  ModalResult := HLBEditMemoDlg.ShowModal;
  if ModalResult = mrOk then
  begin
    HostListbox.Clear;
    for i := 0 to HLBEditMemoDlg.ListBoxEditMemo.Lines.Count - 1 do
    begin
      if Length(Trim(HLBEditMemoDlg.ListBoxEditMemo.Lines[i])) > 0 then
        HostListbox.Items.Append(HLBEditMemoDlg.ListBoxEditMemo.Lines[i]);
    end;
  end;
end;

procedure TMainForm.aInfoMemoExecute(Sender: TObject);
begin
  if Application.MainForm.Left + Application.MainForm.Width + InfoMemoForm.Width < Screen.WorkAreaWidth then
  begin
    InfoMemoForm.Position := poDesigned;
    InfoMemoForm.Top := Application.MainForm.Top;
    InfoMemoForm.Left := Application.MainForm.Left + Application.MainForm.Width;
  end
  else
  begin
    if Application.MainForm.Top + Application.MainForm.Height + InfoMemoForm.Height < Screen.WorkAreaHeight then
    begin
      InfoMemoForm.Position := poDesigned;
      InfoMemoForm.Top := Application.MainForm.Top + Application.MainForm.Height;
      InfoMemoForm.Left := Application.MainForm.Left;
    end
    else
    begin
      InfoMemoForm.Position := poDesktopCenter;
    end;
  end;
  InfoMemoForm.Show;
end;

procedure TMainForm.aOIFormExecute(Sender: TObject);
begin
  OIForm.Top := MainForm.Top; OIForm.Left := MainForm.Left + MainForm.Width;

  if MainForm.Left + MainForm.Width + OIForm.Width < Screen.WorkAreaWidth then
  begin
    OIForm.Position := poDesigned;
    OIForm.Top := MainForm.Top;
    OIForm.Left := MainForm.Left + MainForm.Width;
  end
  else
  begin
    if MainForm.Top + MainForm.Height + OIForm.Height < Screen.WorkAreaHeight then
    begin
      OIForm.Position := poDesigned;
      OIForm.Top := MainForm.Top + MainForm.Height;
      OIForm.Left := MainForm.Left;
    end
    else
    begin
      OIForm.Position := poDesktopCenter;
    end;
  end;

  OIForm.Show;
end;

procedure TMainForm.aOpenDtaDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(DtaDir);
end;

procedure TMainForm.aOpenLstDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(LstDir);
end;

procedure TMainForm.aOpenSsnDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(SsnDir);
end;

procedure TMainForm.aOpenTmpDirInExplorerExecute(Sender: TObject);
begin
  OpenDirectory(TmpDir);
end;

function TMainForm.MatchingFileName(ListOfEditsText: String): String;
var
  SR: TSearchRec;
  StrLst: TStringList;
begin
  Result := '';
  if FindFirst(LstDir + '*.txt', faAnyFile, SR) = 0 then
  begin
    StrLst := TStringList.Create;
    repeat
      StrLst.LoadFromFile(LstDir + SR.Name);
      if StrLst.Text = ListOfEditsText then Result := SR.Name;
      Application.ProcessMessages;
    until FindNext(SR) <> 0;
    StrLst.Free;
  end;
  FindClose(SR);
end;

procedure TMainForm.LoadListFile(FileName: String);
begin
  if FileExists(FileName) then
  begin
    HostListBox.Items.LoadFromFile(FileName);
    MostRecentFiles.AddFile(FileName);
  end;
end;

procedure TMainForm.aSelectAllExecute(Sender: TObject);
begin
  HostListBox.SelectAll;
end;

procedure TMainForm.aSelectListFileExecute(Sender: TObject);
var
  TmpStr: String;
begin
  SelectFileDlg.SelectFileFrame.SetFileListPath(LstDir);
  SelectFileDlg.SelectFileFrame.SetFileListMask('*.txt');
  SelectFileDlg.SelectFileFrame.LoadFileList;
  if SelectFileDlg.ShowModal = mrOk then
  begin
    if Pos('[L] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      LoadListFile(TmpStr);
    end;
    if Pos('[E] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      ShellExecute(Handle, 'open', PChar(TmpStr), nil, nil, SW_SHOWNORMAL); // Open file in default text editor
    end;
  end;
end;

procedure TMainForm.aSelectSessionFileExecute(Sender: TObject);
var
  TmpStr: String;
begin
  SelectFileDlg.SelectFileFrame.SetFileListPath(SsnDir);
  SelectFileDlg.SelectFileFrame.SetFileListMask('*.txt');
  SelectFileDlg.SelectFileFrame.LoadFileList;
  if SelectFileDlg.ShowModal = mrOk then
  begin
    if Pos('[L] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      LoadFrameConfig(TmpStr);
    end;
    if Pos('[E] ', SelectFileDlg.FileName) = 1 then
    begin
      TmpStr := Copy(SelectFileDlg.FileName, 5);
      ShellExecute(Handle, 'open', PChar(TmpStr), nil, nil, SW_SHOWNORMAL); // Open file in default text editor
    end;
  end;
end;

procedure TMainForm.aLoadListFileExecute(Sender: TObject);
begin
  OpenDialog.InitialDir := LstDir;
  OpenDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  if OpenDialog.Execute then LoadListFile(OpenDialog.FileName);
end;

procedure TMainForm.aLowerCaseExecute(Sender: TObject);
begin
  if HostListbox.ItemIndex > -1 then
  begin
    HostListbox.Items[HostListbox.ItemIndex] := LowerCase(HostListbox.Items[HostListbox.ItemIndex]);
  end;
end;

procedure TMainForm.aPingSelected2Execute(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) then
  begin
    PingSelected2(not StartPingingOnFrameCreate);
  end
  else
  begin
    PingSelected2(StartPingingOnFrameCreate);
  end;
end;

procedure TMainForm.aPingSelectedExecute(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) then
  begin
    PingSelected1(not StartPingingOnFrameCreate);
  end
  else
  begin
    PingSelected1(StartPingingOnFrameCreate);
  end;
end;

procedure TMainForm.aPingSelectedWithExpandExecute(Sender: TObject);
begin
  if GetKeyState(VK_SHIFT) then
  begin
    PingSelectedWithExpand(not StartPingingOnFrameCreate);
  end
  else
  begin
    PingSelectedWithExpand(StartPingingOnFrameCreate);
  end;
end;

procedure TMainForm.aReloadAutosaveSessionExecute(Sender: TObject);
begin
  if FileExists(SsnDir + 'Session_AutoSave.txt') then LoadFrameConfig(SsnDir + 'Session_AutoSave.txt');
end;

procedure TMainForm.aRemoveOrphanFramesExecute(Sender: TObject);
var
  i: Integer;
begin

  for i := ColumnPanel1.ControlCount - 1 downto 0 do
  begin
    if (ColumnPanel1.Controls[i] as TPingFrame).ContinuousPingSpdBtn.Down then
    begin
      (ColumnPanel1.Controls[i] as TPingFrame).ContinuousPingSpdBtn.Down := False;
      (ColumnPanel1.Controls[i] as TPingFrame).ContinuousPingSpdBtnClick(nil);
    end;
    (ColumnPanel1.Controls[i] as TPingFrame).PingTimer.Enabled := False;
  end;
  for i := ColumnPanel2.ControlCount - 1 downto 0 do
  begin
    if (ColumnPanel2.Controls[i] as TPingFrame).ContinuousPingSpdBtn.Down then
    begin
      (ColumnPanel2.Controls[i] as TPingFrame).ContinuousPingSpdBtn.Down := False;
      (ColumnPanel2.Controls[i] as TPingFrame).ContinuousPingSpdBtnClick(nil);
    end;
    (ColumnPanel2.Controls[i] as TPingFrame).PingTimer.Enabled := False;
  end;

  Sleep(TimeToWait);

  for i := ColumnPanel1.ControlCount - 1 downto 0 do
  begin
    Repeat
      Application.ProcessMessages;
      Sleep(TimeToWait);
    Until (ColumnPanel1.Controls[i] as TPingFrame).ThreadInProgressLbl.Caption = '-' ;
    if Assigned(ColumnPanel1.Controls[i]) then FreeAndNil(ColumnPanel1.Controls[i]);
  end;
  SetLength(PingFrameA1, 0);
  for i := ColumnPanel2.ControlCount - 1 downto 0 do
  begin
    Repeat
      Application.ProcessMessages;
      Sleep(TimeToWait);
    Until (ColumnPanel2.Controls[i] as TPingFrame).ThreadInProgressLbl.Caption = '-' ;
    if Assigned(ColumnPanel2.Controls[i]) then FreeAndNil(ColumnPanel2.Controls[i]);
  end;
  SetLength(PingFrameA2, 0);
end;

procedure TMainForm.aLoadFrameSessionExecute(Sender: TObject);
begin
  OpenDialog.InitialDir := SsnDir;
  OpenDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  if OpenDialog.Execute then LoadFrameConfig(OpenDialog.FileName);
end;

procedure TMainForm.aSaveFrameSessionExecute(Sender: TObject);
begin
  SaveDialog.Options := SaveDialog.Options + [ofOverwritePrompt];
  SaveDialog.InitialDir := SsnDir;
  SaveDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  SaveDialog.FileName := 'Session_' + FormatDateTime('yyyy-mm-dd_hh.nn.ss',Now) + '.txt';
  if SaveDialog.Execute then SaveFrameConfig(ChangeFileExt(SaveDialog.FileName, '.txt'));
end;

procedure TMainForm.aSaveListFileExecute(Sender: TObject);
var
  TempFileName: String;
begin
  SaveDialog.InitialDir := LstDir;
  SaveDialog.Filter := 'Text Files (*.TXT)|*.TXT|All Files (*.*)|*.*';
  if SaveDialog.Execute then
  begin
    TempFileName := SaveDialog.FileName;
    if ExtractFileExt(TempFileName) = '' then TempFileName := TempFileName + '.txt';
    HostListBox.Items.SaveToFile(TempFileName);
  end;
end;

procedure TMainForm.aSettingsExecute(Sender: TObject);
begin
  SettingsForm.SavFrmSizChkBox.Checked := SaveFormSize;
  SettingsForm.SavFrmPosChkBox.Checked := SaveFormPosition;
  SettingsForm.EnableStylesSettingsCheckBox.Checked := StylesEnabled;
  SettingsForm.StylesListBox.Enabled := StylesEnabled;
  SettingsForm.StylesMMCheckBox.Checked := StylesMM;
  SettingsForm.AutoStartPingingCheckBox.Checked := AutoStartPinging;
  SettingsForm.StartTimeoutPnlVisibleCheckBox.Checked := StartTimeoutPnlVisible;
  SettingsForm.ConvertToLCCheckBox.Checked := ConvertToLC;
  SettingsForm.ConvertToUCCheckBox.Checked := ConvertToUC;
  SettingsForm.PauseForRemoveFrameCheckBox.Checked := PauseForRemoveFrame;
  SettingsForm.CntDwnSpinEdit.Value := CntDwnFrm;
  SettingsForm.SaveHostListBoxWidthCheckBox.Checked := SaveHostListBoxWidth;
  SettingsForm.StartPingingOnFrameCreateCheckBox.Checked := StartPingingOnFrameCreate;
  SettingsForm.ThrowAwayFirstPingCheckBox.Checked := ThrowAwayFirstPing;

//  SettingsForm.Top := MainForm.Top; SettingsForm.Left := MainForm.Left + MainForm.Width;
  if MainForm.Left + MainForm.Width + SettingsForm.Width < Screen.WorkAreaWidth then
  begin
    SettingsForm.Position := poDesigned;
    SettingsForm.Top := MainForm.Top;
    SettingsForm.Left := MainForm.Left + MainForm.Width;
  end
  else
  begin
    if MainForm.Top + MainForm.Height + SettingsForm.Height < Screen.WorkAreaHeight then
    begin
      SettingsForm.Position := poDesigned;
      SettingsForm.Top := MainForm.Top + MainForm.Height;
      SettingsForm.Left := MainForm.Left;
    end
    else
    begin
//      SettingsForm.Position := poMainFormCenter;
      SettingsForm.Position := poScreenCenter;
    end;
  end;

  if SettingsForm.MainFormSettingsListBox.Count > 0 then
    SettingsForm.MainFormSettingsListBox.ItemIndex := 0;
  SettingsForm.Show;
end;

procedure TMainForm.aShow2Execute(Sender: TObject);
begin
  SetColumn2;
end;

procedure TMainForm.aShow3Execute(Sender: TObject);
begin
  ColumnPanel3.Width := (RightPanel.Width - (Splitter12.Width + Splitter23.Width)) div 3;
  ColumnPanel3.Visible := True;
  Splitter23.Visible := True;
end;

procedure TMainForm.aSizeFrames2Execute(Sender: TObject);
begin
  SizeFrames2;
end;

procedure TMainForm.aSizeFramesExecute(Sender: TObject);
begin
  SizeFrames1;
end;

procedure TMainForm.aStartAllPingingExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to High(PingFrameA1) do
  begin
    if not PingFrameA1[i].ContinuousPingSpdBtn.Down then
    begin
      PingFrameA1[i].ContinuousPingSpdBtn.Down := True;
      PingFrameA1[i].ContinuousPingSpdBtnClick(nil);
    end;
  end;
  for i := 0 to High(PingFrameA2) do
  begin
    if not PingFrameA2[i].ContinuousPingSpdBtn.Down then
    begin
      PingFrameA2[i].ContinuousPingSpdBtn.Down := True;
      PingFrameA2[i].ContinuousPingSpdBtnClick(nil);
    end;
  end;
end;

procedure TMainForm.aStopAllPingingExecute(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to High(PingFrameA1) do
  begin
    if PingFrameA1[i].ContinuousPingSpdBtn.Down then
    begin
      PingFrameA1[i].ContinuousPingSpdBtn.Down := False;
      PingFrameA1[i].ContinuousPingSpdBtnClick(nil);
    end;
    PingFrameA1[i].PingTimer.Enabled := False;
  end;
  for i := 0 to High(PingFrameA2) do
  begin
    if PingFrameA2[i].ContinuousPingSpdBtn.Down then
    begin
      PingFrameA2[i].ContinuousPingSpdBtn.Down := False;
      PingFrameA2[i].ContinuousPingSpdBtnClick(nil);
    end;
    PingFrameA2[i].PingTimer.Enabled := False;
  end;
end;

procedure TMainForm.aUpperCaseExecute(Sender: TObject);
begin
  if HostListbox.ItemIndex > -1 then
  begin
    HostListbox.Items[HostListbox.ItemIndex] := UpperCase(HostListbox.Items[HostListbox.ItemIndex]);
  end;
end;

procedure TMainForm.SizeFrames1;
var
  i: Integer;
begin
  if Length(PingFrameA1) > 0 then
  begin
    for i := 0 to Length(PingFrameA1) - 1 do
    begin
      if i = 0 then
      begin
        PingFrameA1[i].Top := 0;
        PingFrameA1[i].Height := PingFrameA1[i].Parent.Height div Length(PingFrameA1);
      end
      else
      begin
        PingFrameA1[i].Top := (PingFrameA1[i].Parent.Height div Length(PingFrameA1)) * i;
        PingFrameA1[i].Height := PingFrameA1[i].Parent.Height div Length(PingFrameA1);
      end;
    end;
  end;
end;

procedure TMainForm.SizeFramesWithExpand;
var
  i: Integer;
begin
  if Length(PingFrameA1) > 0 then
  begin
    MainForm.Height := MainForm.Height + PingFrameA1[0].Height;
    for i := 0 to Length(PingFrameA1) - 1 do
    begin
      if i = 0 then
      begin
        PingFrameA1[i].Top := 0;
        PingFrameA1[i].Height := PingFrameA1[i].Parent.Height div Length(PingFrameA1);
      end
      else
      begin
        PingFrameA1[i].Top := (PingFrameA1[i].Parent.Height div Length(PingFrameA1)) * i;
        PingFrameA1[i].Height := PingFrameA1[i].Parent.Height div Length(PingFrameA1);
      end;
    end;
  end;
end;

procedure TMainForm.SizeFrames2;
var
  i: Integer;
begin
  if Length(PingFrameA2) > 0 then
  begin
    for i := 0 to Length(PingFrameA2) - 1 do
    begin
      if i = 0 then
      begin
        PingFrameA2[i].Top := 0;
        PingFrameA2[i].Height := PingFrameA2[i].Parent.Height div Length(PingFrameA2);
      end
      else
      begin
        PingFrameA2[i].Top := (PingFrameA2[i].Parent.Height div Length(PingFrameA2)) * i;
        PingFrameA2[i].Height := PingFrameA2[i].Parent.Height div Length(PingFrameA2);
      end;
    end;
  end;
end;

procedure TMainForm.NewFrameFromSelectedHost1(HostToPing: String; AutoStart: Boolean);
begin
  SetLength(PingFrameA1, Length(PingFrameA1) + 1);
  PingFrameA1[High(PingFrameA1)] := TPingFrame.Create(ColumnPanel1);
  with PingFrameA1[High(PingFrameA1)] do
  begin
    Parent := ColumnPanel1;
    if High(PingFrameA1) = 0 then
    begin
      Top := 0;
    end
    else
    begin
      Top := High(PingFrameA1) * Height;
    end;
    Left := 0;
    Width := ColumnPanel1.Width;
    Anchors := [akLeft, akTop, akRight];
    Name := 'PingFrame_' + IntToStr(High(PingFrameA1));
    Tag := High(PingFrameA1);
    PopupMenu := FramePM1;
    BottomRightPanel.Visible := StartTimeoutPnlVisible;
    HostEdit.Text := HostToPing;
    SizeFrames1;
    gThrowAwayFirstPing := True;
    {$IFDEF VER360} // RAD Studio 12
      PingChart.View3DOptions.ZoomText := ztNo;
    {$ENDIF}
    if AutoStart and (Length(HostEdit.Text) > 0) then
    begin
      ContinuousPingSpdBtn.Down := True;
      ContinuousPingSpdBtnClick(nil);
    end;
  end;
end;

procedure TMainForm.NewFrameFromSelectedHostWithExpand(HostToPing: String; AutoStart: Boolean);
begin
  SetLength(PingFrameA1, Length(PingFrameA1) + 1);
  PingFrameA1[High(PingFrameA1)] := TPingFrame.Create(ColumnPanel1);
  with PingFrameA1[High(PingFrameA1)] do
  begin
    Parent := ColumnPanel1;
    if High(PingFrameA1) = 0 then
    begin
      Top := 0;
    end
    else
    begin
      Top := High(PingFrameA1) * Height;
    end;
    Left := 0;
    Width := ColumnPanel1.Width;
    Anchors := [akLeft, akTop, akRight];
    Name := 'PingFrame_' + IntToStr(High(PingFrameA1));
    Tag := High(PingFrameA1);
    PopupMenu := FramePM1;
    BottomRightPanel.Visible := StartTimeoutPnlVisible;
    HostEdit.Text := HostToPing;
    SizeFramesWithExpand;
    {$IFDEF VER360} // RAD Studio 12
      PingChart.View3DOptions.ZoomText := ztNo;
    {$ENDIF}
    if AutoStart and (Length(HostEdit.Text) > 0) then
    begin
      ContinuousPingSpdBtn.Down := True;
      ContinuousPingSpdBtnClick(nil);
    end;
  end;
end;

procedure TMainForm.NewFrameFromSelectedHost2(HostToPing: String; AutoStart: Boolean);
begin
  SetLength(PingFrameA2, Length(PingFrameA2) + 1);
  PingFrameA2[High(PingFrameA2)] := TPingFrame.Create(ColumnPanel2);
  with PingFrameA2[High(PingFrameA2)] do
  begin
    Parent := ColumnPanel2;
    if High(PingFrameA2) = 0 then
    begin
      Top := 0;
    end
    else
    begin
      Top := High(PingFrameA2) * Height;
    end;
    Left := 0;
    Width := ColumnPanel2.Width;
    Anchors := [akLeft, akTop, akRight];
    Name := 'PingFrame2_' + IntToStr(High(PingFrameA2));
    Tag := High(PingFrameA2);
    PopupMenu := FramePM2;
    BottomRightPanel.Visible := StartTimeoutPnlVisible;
    HostEdit.Text := HostToPing;
    SizeFrames2;
    {$IFDEF VER360} // RAD Studio 12
      PingChart.View3DOptions.ZoomText := ztNo;
    {$ENDIF}
    if AutoStart and (Length(HostEdit.Text) > 0) then
    begin
      ContinuousPingSpdBtn.Down := True;
      ContinuousPingSpdBtnClick(nil);
    end;
  end;
end;

procedure TMainForm.OpenDirectory(DirectoryName: String);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(DirectoryName), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

procedure TMainForm.pmiMoveDown2Click(Sender: TObject);
var
  Caller: TObject;
  FrameNumber, TmpTag: Integer;
  TempPingFrame: TPingFrame;
  TempPingFrameName, TempPingFrameName2: String;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  FrameNumber := (Caller as TFrame).Tag;
  if FrameNumber < High(PingFrameA2) then
  begin
    TempPingFrameName := PingFrameA2[FrameNumber].Name;
    TempPingFrameName2 := PingFrameA2[FrameNumber + 1].Name;
    PingFrameA2[FrameNumber].Name := 'TempName';
    PingFrameA2[FrameNumber + 1].Name := TempPingFrameName;
    PingFrameA2[FrameNumber].Name := TempPingFrameName2;

    TmpTag := PingFrameA2[FrameNumber].Tag;
    PingFrameA2[FrameNumber].Tag := PingFrameA2[FrameNumber + 1].Tag;
    PingFrameA2[FrameNumber + 1].Tag := TmpTag;

    TempPingFrame := PingFrameA2[FrameNumber];
    PingFrameA2[FrameNumber] := PingFrameA2[FrameNumber + 1];
    PingFrameA2[FrameNumber + 1] := TempPingFrame;
    SizeFrames2;
  end;
end;

procedure TMainForm.pmiMoveDownClick(Sender: TObject);
var
  Caller: TObject;
  FrameNumber, TmpTag: Integer;
  TempPingFrame: TPingFrame;
  TempPingFrameName, TempPingFrameName2: String;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  FrameNumber := (Caller as TFrame).Tag;
  if FrameNumber < High(PingFrameA1) then
  begin
    TempPingFrameName := PingFrameA1[FrameNumber].Name;
    TempPingFrameName2 := PingFrameA1[FrameNumber + 1].Name;
    PingFrameA1[FrameNumber].Name := 'TempName';
    PingFrameA1[FrameNumber + 1].Name := TempPingFrameName;
    PingFrameA1[FrameNumber].Name := TempPingFrameName2;

    TmpTag := PingFrameA1[FrameNumber].Tag;
    PingFrameA1[FrameNumber].Tag := PingFrameA1[FrameNumber + 1].Tag;
    PingFrameA1[FrameNumber + 1].Tag := TmpTag;

    TempPingFrame := PingFrameA1[FrameNumber];
    PingFrameA1[FrameNumber] := PingFrameA1[FrameNumber + 1];
    PingFrameA1[FrameNumber + 1] := TempPingFrame;
    SizeFrames1;
  end;
end;

procedure TMainForm.pmiMovetoColumn1Click(Sender: TObject);
var
  Caller: TObject;
  TempFrameName: String;
  i, FrameToDelete: Integer;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  TempFrameName := (Caller as TFrame).Name;
  FrameToDelete := -1;
  for i := 0 to High(PingFrameA2) do if PingFrameA2[i].Name = TempFrameName then FrameToDelete := i;
  if Assigned(PingFrameA2[FrameToDelete]) then
  begin
    SetLength(PingFrameA1, Length(PingFrameA1) + 1);
    PingFrameA2[FrameToDelete].Parent := ColumnPanel1;
    PingFrameA2[FrameToDelete].Tag := High(PingFrameA1);
    PingFrameA2[FrameToDelete].Name := 'PingFrame_' + IntToStr(High(PingFrameA1));
    PingFrameA2[FrameToDelete].PopupMenu := FramePM1;
    PingFrameA1[High(PingFrameA1)] := PingFrameA2[FrameToDelete];
    PingFrameA2[FrameToDelete] := nil;
  end;
  if FrameToDelete < High(PingFrameA2) then
  begin
    for i := FrameToDelete to High(PingFrameA2) - 1 do
    begin
      PingFrameA2[i] := PingFrameA2[i + 1]
    end;
  end;
  SetLength(PingFrameA2, Length(PingFrameA2) - 1);
  for i := FrameToDelete to High(PingFrameA2) do
  begin
    PingFrameA2[i].Name := 'PingFrame2_' + IntToStr(i);
    PingFrameA2[i].Tag := i;
  end;
  SizeFrames1;
  SizeFrames2;
end;

procedure TMainForm.pmiMovetoColumn2Click(Sender: TObject);
var
  Caller: TObject;
  TempFrameName: String;
  i, FrameToDelete: Integer;
begin
  if ColumnPanel2.Visible then
  begin
    Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
    TempFrameName := (Caller as TFrame).Name;
    FrameToDelete := -1;
    for i := 0 to High(PingFrameA1) do if PingFrameA1[i].Name = TempFrameName then FrameToDelete := i;
    if Assigned(PingFrameA1[FrameToDelete]) then
    begin
      SetLength(PingFrameA2, Length(PingFrameA2) + 1);
      PingFrameA1[FrameToDelete].Parent := ColumnPanel2;
      PingFrameA1[FrameToDelete].Tag := High(PingFrameA2);
      PingFrameA1[FrameToDelete].Name := 'PingFrame2_' + IntToStr(High(PingFrameA2));
      PingFrameA1[FrameToDelete].PopupMenu := FramePM2;
      PingFrameA2[High(PingFrameA2)] := PingFrameA1[FrameToDelete];
      PingFrameA1[FrameToDelete] := nil;
    end;
    if FrameToDelete < High(PingFrameA1) then
    begin
      for i := FrameToDelete to High(PingFrameA1) - 1 do
      begin
        PingFrameA1[i] := PingFrameA1[i + 1]
      end;
    end;
    SetLength(PingFrameA1, Length(PingFrameA1) - 1);
    for i := FrameToDelete to High(PingFrameA1) do
    begin
      PingFrameA1[i].Name := 'PingFrame_' + IntToStr(i);
      PingFrameA1[i].Tag := i;
    end;
    SizeFrames1;
    SizeFrames2;
  end;
end;

procedure TMainForm.pmiMoveUp2Click(Sender: TObject);
var
  Caller: TObject;
  FrameNumber, TmpTag: Integer;
  TempPingFrame: TPingFrame;
  TempPingFrameName, TempPingFrameName2: String;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  FrameNumber := (Caller as TFrame).Tag;
  if FrameNumber > 0 then
  begin
    TempPingFrameName := PingFrameA2[FrameNumber].Name;
    TempPingFrameName2 := PingFrameA2[FrameNumber - 1].Name;
    PingFrameA2[FrameNumber].Name := 'TempName';
    PingFrameA2[FrameNumber - 1].Name := TempPingFrameName;
    PingFrameA2[FrameNumber].Name := TempPingFrameName2;

    TmpTag := PingFrameA2[FrameNumber].Tag;
    PingFrameA2[FrameNumber].Tag := PingFrameA2[FrameNumber - 1].Tag;
    PingFrameA2[FrameNumber - 1].Tag := TmpTag;

    TempPingFrame := PingFrameA2[FrameNumber];
    PingFrameA2[FrameNumber] := PingFrameA2[FrameNumber - 1];
    PingFrameA2[FrameNumber - 1] := TempPingFrame;
    SizeFrames2;
  end;
end;

procedure TMainForm.pmiMoveUpClick(Sender: TObject);
var
  Caller: TObject;
  FrameNumber, TmpTag: Integer;
  TempPingFrame: TPingFrame;
  TempPingFrameName, TempPingFrameName2: String;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  FrameNumber := (Caller as TFrame).Tag;
  if FrameNumber > 0 then
  begin
    TempPingFrameName := PingFrameA1[FrameNumber].Name;
    TempPingFrameName2 := PingFrameA1[FrameNumber - 1].Name;
    PingFrameA1[FrameNumber].Name := 'TempName';
    PingFrameA1[FrameNumber - 1].Name := TempPingFrameName;
    PingFrameA1[FrameNumber].Name := TempPingFrameName2;

    TmpTag := PingFrameA1[FrameNumber].Tag;
    PingFrameA1[FrameNumber].Tag := PingFrameA1[FrameNumber - 1].Tag;
    PingFrameA1[FrameNumber - 1].Tag := TmpTag;

    TempPingFrame := PingFrameA1[FrameNumber];
    PingFrameA1[FrameNumber] := PingFrameA1[FrameNumber - 1];
    PingFrameA1[FrameNumber - 1] := TempPingFrame;
    SizeFrames1;
  end;
end;

procedure TMainForm.pmiRemoveFrameObject2Click(Sender: TObject);
var
  Caller: TObject;
  TempFrameName: String;
  i, FrameToDelete: Integer;
  ActivePingsB: Boolean;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  TempFrameName := (Caller as TFrame).Name;
  FrameToDelete := -1;
  for i := 0 to High(PingFrameA2) do if PingFrameA2[i].Name = TempFrameName then FrameToDelete := i;
  if Assigned(PingFrameA2[FrameToDelete]) then
  begin
    ActivePingsB := False;
    if PingFrameA2[FrameToDelete].ContinuousPingSpdBtn.Down then
    begin
      PingFrameA2[FrameToDelete].ContinuousPingSpdBtn.Down := False;
      PingFrameA2[FrameToDelete].ContinuousPingSpdBtnClick(nil);
      ActivePingsB := True;
    end;
    Repeat
      Application.ProcessMessages;
      Sleep(TimeToWait);
    Until PingFrameA2[FrameToDelete].ThreadInProgressLbl.Caption = '-';
    if PauseForRemoveFrame and ActivePingsB then
      MyMessageDlgTm('Pausing for pings to finish!', mtConfirmation, [mbYes], ['Continue'], 'Confirmation', mbYes, Rect(MainForm.Left, MainForm.Top, MainForm.Left + MainForm.Width, MainForm.Top + MainForm.Height), CntDwnFrm);
    PingFrameA2[FrameToDelete].ThreadInProgressLbl.Caption := '-';
    PingFrameA2[FrameToDelete].Free;
    PingFrameA2[FrameToDelete] := nil;
  end;
  if FrameToDelete < High(PingFrameA2) then
  begin
    for i := FrameToDelete to High(PingFrameA2) - 1 do
    begin
      PingFrameA2[i] := PingFrameA2[i + 1]
    end;
  end;
  SetLength(PingFrameA2, Length(PingFrameA2) - 1);
  for i := FrameToDelete to High(PingFrameA2) do
  begin
    PingFrameA2[i].Name := 'PingFrame_' + IntToStr(i);
    PingFrameA2[i].Tag := i;
  end;
  SizeFrames2;
end;

procedure TMainForm.pmiRemoveFrameObjectClick(Sender: TObject);
var
  Caller: TObject;
  TempFrameName: String;
  i, FrameToDelete: Integer;
  ActivePingsB: Boolean;
begin
  Caller := ((Sender as TMenuItem).GetParentMenu as TPopupMenu).PopupComponent;
  TempFrameName := (Caller as TFrame).Name;
  FrameToDelete := -1;
  for i := 0 to High(PingFrameA1) do if PingFrameA1[i].Name = TempFrameName then FrameToDelete := i;
  if Assigned(PingFrameA1[FrameToDelete]) then
  begin
    ActivePingsB := False;
    if PingFrameA1[FrameToDelete].ContinuousPingSpdBtn.Down then
    begin
      PingFrameA1[FrameToDelete].ContinuousPingSpdBtn.Down := False;
      PingFrameA1[FrameToDelete].ContinuousPingSpdBtnClick(nil);
      ActivePingsB := True;
    end;
    Repeat
      Application.ProcessMessages;
      Sleep(TimeToWait);
    Until PingFrameA1[FrameToDelete].ThreadInProgressLbl.Caption = '-';
    if PauseForRemoveFrame and ActivePingsB then
      MyMessageDlgTm('Pausing for pings to finish!', mtConfirmation, [mbYes], ['Continue'], 'Confirmation', mbYes, Rect(MainForm.Left, MainForm.Top, MainForm.Left + MainForm.Width, MainForm.Top + MainForm.Height), CntDwnFrm);
    PingFrameA1[FrameToDelete].ThreadInProgressLbl.Caption := '-';
    PingFrameA1[FrameToDelete].Free;
    PingFrameA1[FrameToDelete] := nil;
  end;

  if FrameToDelete < High(PingFrameA1) then
  begin
    for i := FrameToDelete to High(PingFrameA1) - 1 do
    begin
      PingFrameA1[i] := PingFrameA1[i + 1]
    end;
  end;
  SetLength(PingFrameA1, Length(PingFrameA1) - 1);
  for i := FrameToDelete to High(PingFrameA1) do
  begin
    PingFrameA1[i].Name := 'PingFrame_' + IntToStr(i);
    PingFrameA1[i].Tag := i;
  end;
  SizeFrames1;
end;

procedure TMainForm.pmiScanPortsClick(Sender: TObject);
begin
  if HostListbox.ItemIndex > -1 then
  begin
    if Pos(':', HostListbox.Items[HostListbox.ItemIndex]) > 0 then
    begin
      ScanPortsForm.HostNameLabeledEdit.Text := Copy(HostListbox.Items[HostListbox.ItemIndex], 1, Pos(':', HostListbox.Items[HostListbox.ItemIndex]) - 1);
    end
    else
    begin
      ScanPortsForm.HostNameLabeledEdit.Text := HostListbox.Items[HostListbox.ItemIndex];
    end;
  end;
  ScanPortsForm.ClearPortBtnA;
  ScanPortsForm.DNSResultLbl.Caption := '';
  ScanPortsForm.Show;
end;

// https://stackoverflow.com/questions/11594084/shift-in-the-right-of-last-item-of-the-menu
Procedure TMainForm.RightMenu(mmiMoveRight: TMenuItem); // Shift in the right of last item of the menu
var
  mii: TMenuItemInfo;
  MainMenu: hMenu;
  Buffer: array[0..79] of Char;
begin
  MainMenu := Self.Menu.Handle;
  mii.cbSize := SizeOf(mii);
  mii.fMask := MIIM_TYPE;
  mii.dwTypeData := Buffer;
  mii.cch := SizeOf(Buffer);
  GetMenuItemInfo(MainMenu, mmiMoveRight.Command, False, mii);
  mii.fType := mii.fType or MFT_RIGHTJUSTIFY;
  if SetMenuItemInfo(MainMenu, mmiMoveRight.Command, False, mii) then DrawMenuBar(Self.Menu.WindowHandle);
end;

procedure TMainForm.RestoreMainFormPositionAndSize;
begin
  //  Position is lost when the Style is changed
  if SaveFormPosition then
  begin
    MainForm.Left := MainFormRect.Left;
    MainForm.Top := MainFormRect.Top;
  end;
  if SaveFormSize then
  begin
    MainForm.Width := MainFormRect.Width;
    MainForm.Height := MainFormRect.Height;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
{
  InfoMemo.Lines.Append('%MYDOCUMENTS%' + ' : ' + TPath.GetDocumentsPath);       // C:\Users\user\Documents       MyDocs
  InfoMemo.Lines.Append('%COMMONDOCUMENTS%' + ' : ' + GetCommonDocumentsFolder); // C:\Users\Public\Documents     PublicDocs
  InfoMemo.Lines.Append('%APPDATAROOT%' + ' : ' + GetAppdataFolder);             // C:\Users\user\AppData\Roaming AppDataRoaming
  InfoMemo.Lines.Append('%LOCALAPPDATAROOT%' + ' : ' + GetLocalAppData);         // C:\Users\user\AppData\Local   AppDataLocal
  InfoMemo.Lines.Append('%COMMONAPPDATAROOT%' + ' : ' + GetCommonAppdataFolder); // C:\ProgramData                AppDataCommon
}
  case StrIndex(DtaDirLoc, ['MyDocs', 'PublicDocs', 'AppDataRoaming', 'AppDataLocal', 'AppDataCommon']) of
    0: begin
         // DeployMaster - %MYDOCUMENTS%       C:\Users\user\Documents
         DtaDir := TPath.GetDocumentsPath + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
    1: begin
         // DeployMaster - %COMMONDOCUMENTS%   C:\Users\Public\Documents
         DtaDir := GetCommonDocumentsFolder + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
    2: begin
         // DeployMaster - %APPDATAROOT%       C:\Users\user\AppData\Roaming
         DtaDir := GetAppdataFolder + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
    3: begin
         // DeployMaster - %LOCALAPPDATAROOT%  C:\Users\user\AppData\Local
         DtaDir := GetLocalAppData + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
    4: begin
         // DeployMaster - %COMMONAPPDATAROOT% C:\ProgramData
         DtaDir := GetCommonAppdataFolder + '\MWB\' + PgmName + '\';
         ForceDirectories(DtaDir);
       end;
  end;
  LoadStyleSettings;
  TStyleManager.TrySetStyle(StyleStr);
  LoadSettingsFromFormCreate;
  if StylesMM then mmiStyles.Visible := True else mmiStyles.Visible := False;
  LoadSettingsFromFormCreate;
  RestoreMainFormPositionAndSize;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
  if mmiShow2.Checked then
  begin
    if mmiShow3.Checked then
    begin
      ColumnPanel2.Width := (RightPanel.Width - (Splitter12.Width + Splitter23.Width)) div 3;
    end
    else
    begin
      ColumnPanel2.Width := (RightPanel.Width - (Splitter12.Width + Splitter23.Width)) div 2;
    end;
  end;
  SizeFrames1;
  SizeFrames2;
end;

procedure TMainForm.FramePM2Popup(Sender: TObject);
var
  Caller: TObject;
  FrameNumber: Integer;
begin
  if GetKeyState(VK_SHIFT) then Abort;
  Caller := FramePM2.PopupComponent;
  FrameNumber := (Caller as TFrame).Tag;
  pmiMoveUp2.Visible := (FrameNumber > 0);
  pmiMoveDown2.Visible := (FrameNumber < High(PingFrameA2));
end;

procedure TMainForm.FramePM1Popup(Sender: TObject);
var
  Caller: TObject;
  FrameNumber: Integer;
begin
  if GetKeyState(VK_SHIFT) then Abort;
  Caller := FramePM1.PopupComponent;
  FrameNumber := (Caller as TFrame).Tag;
  pmiMoveUp.Visible := (FrameNumber > 0);
  pmiMoveDown.Visible := (FrameNumber < High(PingFrameA1));
end;

// https://stackoverflow.com/questions/4618743/how-to-make-messagedlg-centered-on-owner-form
function MessageDlgCenter(const Msg: String; DlgType: TMsgDlgType; Buttons: TMsgDlgButtons): Integer;
var R: TRect;
begin
  if not Assigned(Screen.ActiveForm) then
  begin
    Result := MessageDlg(Msg, DlgType, Buttons, 0);
  end else
  begin
    with CreateMessageDialog(Msg, DlgType, Buttons) do
    try
      GetWindowRect(Screen.ActiveForm.Handle, R);
      Left := R.Left + ((R.Right - R.Left) div 2) - (Width div 2);
      Top := R.Top + ((R.Bottom - R.Top) div 2) - (Height div 2);
      Result := ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TMainForm.CheckStyle(Menu: TMenuItem; StyleStr: String);
var
  i: Integer;
begin
  for i := 0 to Menu.Count - 1 do
  begin
    if Menu.Items[i].Hint = StyleStr then
      Menu.Items[i].Checked := True;
  end;
end;

procedure TMainForm.UnCheckStyles(Menu: TMenuItem);
var
  i: Integer;
begin
  for i := 0 to Menu.Count - 1 do
  begin
    Menu.Items[i].Checked := False;
  end;
end;

procedure TMainForm.mmiShowColumn2ResizeClick(Sender: TObject);
begin
  SetColumn2Resize;
end;

procedure TMainForm.mmiShowReloadClick(Sender: TObject);
begin
  aReloadAutosaveSession.Visible := mmiShowReload.Checked;
  RightMenu(mmiVersionAbout); // Run after change to MainMenu
end;

procedure TMainForm.mmiStylesClick(Sender: TObject);
begin
  SettingsForm.Close; // Access violation if SettingsForm is open
  UnCheckStyles(MainMenu.Items.Find('Styles'));
  TStyleManager.TrySetStyle((Sender as TMenuItem).Hint);
  StyleStr := (Sender as TMenuItem).Hint;
  CheckStyle(MainMenu.Items.Find('Styles'), StyleStr);
  SettingsForm.StylesListBox.ItemIndex := SettingsForm.StylesListBox.Items.IndexOf(StyleStr);
end;

procedure TMainForm.ScreenPresetsClick(Sender: TObject);
var
  Regex: TPerlRegEx;
begin
  Regex := TPerlRegEx.Create;
  try
    Regex.RegEx := 'T:(?<Top>[0-9]+) \| L:(?<Left>[0-9]+) \| H:(?<Height>[0-9]+) \| W:(?<Width>[0-9]+)';
    Regex.Options := [];
    Regex.State := [];
    Regex.Subject := AnsiToUTF8((Sender as TMenuItem).Hint); // Must use hint!
    if Regex.Match then
    begin
      MainForm.Top := StrToInt(Utf8ToAnsi(Regex.Groups[1]));
      MainForm.Left := StrToInt(Utf8ToAnsi(Regex.Groups[2]));
      MainForm.Height := StrToInt(Utf8ToAnsi(Regex.Groups[3]));
      MainForm.Width := StrToInt(Utf8ToAnsi(Regex.Groups[4]));
      SizeFrames1;
      SizeFrames2;
    end;
  finally
    Regex.Free;
  end;
end;

function TMainForm.FindMenuItemByHint(AMainMenu: TMainMenu; const Hint: String): TMenuItem;

  function FindItemInner(Item: TMenuItem; const Hint: String): TMenuItem;
  var
    i: Integer;
  begin
    Result := nil;
    if Item.Hint = Hint then
    begin
      Result := Item;
      Exit;
    end
    else
    begin
      for i := 0 to Item.Count - 1 do
      begin
        Result := FindItemInner(Item.Items[i], Hint);
        if Result <> nil then
          Break;
      end;
    end;
  end;

begin
  Result := FindItemInner(AMainMenu.Items, Hint);
end;

procedure TMainForm.AddStylesToMainMenu(StylesCaption: String);
var
  StyleStr: String;
  RootAccessItem, ItemToFind: TMenuItem;
  StylesStrLst: TStringList;
  i: Integer;
begin
  // Add Styles menu items to the MainMenu
  // ItemToFind := FindMenuItemByCaption(MainMenu, 'Styles'); // Does not work in the top
  ItemToFind := MainMenu.Items.Find(StylesCaption); // Searches top menu
  StylesStrLst := TStringList.Create;
  for StyleStr in TStyleManager.StyleNames do StylesStrLst.Append(StyleStr);
  StylesStrLst.Sort;
  for i := 0 to StylesStrLst.Count - 1 do
  begin
    RootAccessItem := TMenuItem.Create(Self);
    RootAccessItem.Caption := StylesStrLst[i];
    RootAccessItem.Hint := StylesStrLst[i];
    RootAccessItem.OnClick := mmiStylesClick;
    ItemToFind.Add(RootAccessItem);
  end;
  StylesStrLst.Free;
end;

procedure TMainForm.FormActivate(Sender: TObject);
var
  VerStr: String;
  Item: TMenuItem;
begin
  if not FInitialized then
  begin
    FInitialized := True;
    RestoreMainFormPositionAndSize;
    // DtaDir in FormCreate

    ExeDir := ExtractFilePath(Application.ExeName);
    TmpDir := GetTempDir + PgmName + '\TMP\'; ForceDirectories(TmpDir);
    LstDir := DtaDir + 'LST\'; ForceDirectories(LstDir);
    SsnDir := DtaDir + 'Sessions\'; ForceDirectories(SsnDir);
    SettingsForm.DtaDirLbl.Caption := DtaDir;
    SettingsForm.LstDirLbl.Caption := LstDir;
    SettingsForm.SsnDirLbl.Caption := SsnDir;
    SettingsForm.TmpDirLbl.Caption := TmpDir;
    VerStr := PgmName + '-v' + GetVersionInfoStr(ParamStr(0));
    MostRecentFiles.IniFile := DtaDir + 'LoadFile-MRU.INI';

    LoadSettingsFromFormActivate;

    MainMenu.Items.Find('About').Caption := VerStr;
    AddStylesToMainMenu('Styles');
    Item := FindMenuItemByHint(MainMenu, StyleStr);
    if Assigned(Item) then Item.Checked := True;
    if FileExists(ExeDir + 'PingFrames.chm') then aHelp.Visible := True;
    RightMenu(mmiVersionAbout); // Run after change to MainMenu

    LoadSettingsLateFormActivate;

    AddStylesToListBox;
    SettingsForm.StylesListBox.ItemIndex := SettingsForm.StylesListBox.Items.IndexOf(StyleStr);

    if FileExists(LstDir + 'AutoSaveList.txt') then HostListBox.Items.LoadFromFile(LstDir + 'AutoSaveList.txt');
    if AutoStartPinging then
    begin
      if FileExists(SsnDir + 'Session_AutoSave.txt') then LoadFrameConfig(SsnDir + 'Session_AutoSave.txt');
    end;

  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  HostListBox.Items.SaveToFile(LstDir + 'AutoSaveList.txt');
  if AutoStartPinging then
  begin
    if Length(PingFrameA1) > 0 then
    begin
      SaveFrameConfig(SsnDir + 'Session_AutoSave.txt');
    end
    else
    begin
      if FileExists(SsnDir + 'Session_AutoSave.txt') then DeleteFile(SsnDir + 'Session_AutoSave.txt');
    end;
  end;
  ScanPortsForm.ClearPortBtnA;
  ClearAllFrames;
  SaveSettings;
end;

procedure TMainForm.OnMoving(var Msg: TWMMoving);
begin
  inherited;
  UpdateScrPosEdits;
end;

procedure TMainForm.UpdateScrPosEdits;
begin
  SettingsForm.TScrPosFrame.SpinEditTop.Value := MainForm.Top;
  SettingsForm.TScrPosFrame.SpinEditLeft.Value := MainForm.Left;
  SettingsForm.TScrPosFrame.SpinEditHeight.Value := MainForm.Height;
  SettingsForm.TScrPosFrame.SpinEditWidth.Value := MainForm.Width;
end;

procedure TMainForm.LoadSettingsFromFormCreate;
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    MainFormDefaultRect.Top := RegIniFile.ReadInteger('Section-Window', 'DefaultTop', 75);
    MainFormDefaultRect.Left := RegIniFile.ReadInteger('Section-Window', 'DefaultLeft', 75);
    MainFormDefaultRect.Height := RegIniFile.ReadInteger('Section-Window', 'DefaultHeight', 280);
    MainFormDefaultRect.Width := RegIniFile.ReadInteger('Section-Window', 'DefaultWidth', 600);

    SaveFormSize := RegIniFile.ReadBool('Section-Window', 'SaveFormSize', False);
    SaveFormPosition := RegIniFile.ReadBool('Section-Window', 'SaveFormPosition', False);

    if SaveFormPosition then
    begin
      MainFormRect.Top := RegIniFile.ReadInteger('Section-Window', 'Top', MainFormDefaultRect.Top);
      MainFormRect.Left := RegIniFile.ReadInteger('Section-Window', 'Left', MainFormDefaultRect.Left);
    end;

    if SaveFormSize then
    begin
      MainFormRect.Height := RegIniFile.ReadInteger('Section-Window', 'Height', MainFormDefaultRect.Height);
      MainFormRect.Width := RegIniFile.ReadInteger('Section-Window', 'Width', MainFormDefaultRect.Width);
    end;

    SaveHostListBoxWidth := RegIniFile.ReadBool('Section-Window', 'SaveHostListWidth', False);
    if SaveHostListBoxWidth then LeftPanel.Width := RegIniFile.ReadInteger('Section-Window', 'HostListWidth', 158);

  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.LoadSettingsFromFormActivate;
var
  RegIniFile: TIniFile;
  i, ItemCount: Integer;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
//    SelectFileDlg.Top := RegIniFile.ReadInteger('Section-Window', 'SelectFileTop', 100);
//    SelectFileDlg.Left := RegIniFile.ReadInteger('Section-Window', 'SelectFileLeft', 100);
    SelectFileDlg.Height := RegIniFile.ReadInteger('Section-Window', 'SelectFileHeight', 275);
    SelectFileDlg.Width := RegIniFile.ReadInteger('Section-Window', 'SelectFileWidth', 525);
    TimeToWait :=  RegIniFile.ReadInteger('Section-Misc', 'TimeToWait', 400);
    RegIniFile.ReadSection('MainFormSettingsListBox', SettingsForm.MainFormSettingsListBox.Items);
    ItemCount := SettingsForm.MainFormSettingsListBox.Items.Count;
    SettingsForm.MainFormSettingsListBox.Clear;
    SettingsForm.MainFormSettingsListBox.CheckAll(cbUnchecked, False, False);
    for i := 0 to ItemCount - 1 do
    begin
      SettingsForm.MainFormSettingsListBox.Items.Append(RegIniFile.ReadString('MainFormSettingsListBox', IntToStr(i), ''));
      SettingsForm.MainFormSettingsListBox.Checked[i] := RegIniFile.ReadBool('MainFormSettingsListBoxChecked', IntToStr(i), False);
    end;
    PopulateScreenPresetsMenu;
  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.LoadSettingsLateFormActivate;
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    SettingsForm.JvPageList.ActivePageIndex := RegIniFile.ReadInteger('Section-Settings', 'CurrentPage', 2);
    AutoStartPinging := RegIniFile.ReadBool('Section-Settings', 'AutoStartPinging', False);
    StartTimeoutPnlVisible := RegIniFile.ReadBool('Section-Settings', 'StartTimeoutPnlVisible', True);
    ConvertToLC := RegIniFile.ReadBool('Section-Settings', 'ConvertToLC', False);
    ConvertToUC := RegIniFile.ReadBool('Section-Settings', 'ConvertToUC', False);
    PauseForRemoveFrame := RegIniFile.ReadBool('Section-Settings', 'PauseForRemoveFrame', True);
    CntDwnFrm := RegIniFile.ReadInteger('Section-Settings', 'CntDwnFrm', 10);
    StartPingingOnFrameCreate := RegIniFile.ReadBool('Section-Settings', 'StartPingingOnFrameCreate', True);
    ThrowAwayFirstPing := RegIniFile.ReadBool('Section-Settings', 'ThrowAwayFirstPing', True);
  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.LoadStyleSettings;
var
  RegIniFile: TIniFile;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    StyleStr := RegIniFile.ReadString('Section-Options', 'Style', 'Windows');
    StylesMM := RegIniFile.ReadBool('Section-Options', 'StylesMM', False);
    StylesEnabled := RegIniFile.ReadBool('Section-Options', 'StylesEnabled', False);
  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.SaveSettings;
var
  RegIniFile: TIniFile;
  i: Integer;
begin
  RegIniFile := TIniFile.Create(DtaDir + PgmIni);
  try
    RegIniFile.WriteBool('Section-Window', 'SaveFormSize', SaveFormSize);
    RegIniFile.WriteBool('Section-Window', 'SaveFormPosition', SaveFormPosition);

    RegIniFile.WriteInteger('Section-Window', 'DefaultTop', MainFormDefaultRect.Top);
    RegIniFile.WriteInteger('Section-Window', 'DefaultLeft', MainFormDefaultRect.Left);
    RegIniFile.WriteInteger('Section-Window', 'DefaultHeight', MainFormDefaultRect.Height);
    RegIniFile.WriteInteger('Section-Window', 'DefaultWidth', MainFormDefaultRect.Width);

    RegIniFile.WriteInteger('Section-Window', 'Top', MainForm.Top);
    RegIniFile.WriteInteger('Section-Window', 'Left', MainForm.Left);
    RegIniFile.WriteInteger('Section-Window', 'Height', MainForm.Height);
    RegIniFile.WriteInteger('Section-Window', 'Width', MainForm.Width);
{
    RegIniFile.WriteInteger('Section-Window', 'SelectFileTop', SelectFileDlg.Top);
    RegIniFile.WriteInteger('Section-Window', 'SelectFileLeft', SelectFileDlg.Left);
    RegIniFile.WriteInteger('Section-Window', 'SelectFileHeight', SelectFileDlg.Height);
    RegIniFile.WriteInteger('Section-Window', 'SelectFileWidth', SelectFileDlg.Width);
}
    RegIniFile.WriteString('Section-Options', 'Style', StyleStr);
    RegIniFile.WriteBool('Section-Options', 'StylesMM', StylesMM);
    RegIniFile.WriteBool('Section-Options', 'StylesEnabled', StylesEnabled);

    RegIniFile.EraseSection('MainFormSettingsListBox');
    RegIniFile.EraseSection('MainFormSettingsListBoxChecked');
    for i := 0 to SettingsForm.MainFormSettingsListBox.Items.Count - 1 do
    begin
      RegIniFile.WriteString('MainFormSettingsListBox', IntToStr(i), SettingsForm.MainFormSettingsListBox.Items[i]);
      RegIniFile.WriteBool('MainFormSettingsListBoxChecked', IntToStr(i), SettingsForm.MainFormSettingsListBox.Checked[i]);
    end;
    RegIniFile.WriteInteger('Section-Settings', 'CurrentPage', SettingsForm.JvPageList.ActivePageIndex);
    RegIniFile.WriteBool('Section-Settings', 'AutoStartPinging', AutoStartPinging);
    RegIniFile.WriteBool('Section-Settings', 'StartTimeoutPnlVisible', StartTimeoutPnlVisible);

    RegIniFile.WriteBool('Section-Settings', 'StartPingingOnFrameCreate', StartPingingOnFrameCreate);
    RegIniFile.WriteBool('Section-Settings', 'ThrowAwayFirstPing', ThrowAwayFirstPing);

    RegIniFile.WriteBool('Section-Settings', 'ConvertToLC', ConvertToLC);
    RegIniFile.WriteBool('Section-Settings', 'ConvertToUC', ConvertToUC);

    RegIniFile.WriteBool('Section-Settings', 'PauseForRemoveFrame', PauseForRemoveFrame);
    RegIniFile.WriteInteger('Section-Settings', 'CntDwnFrm', CntDwnFrm);

    RegIniFile.WriteInteger('Section-Misc', 'TimeToWait', TimeToWait);

    RegIniFile.WriteBool('Section-Window', 'SaveHostListWidth', SaveHostListBoxWidth );
    RegIniFile.WriteInteger('Section-Window', 'HostListWidth', LeftPanel.Width);

  finally
    RegIniFile.Free;
  end;
end;

procedure TMainForm.AddStylesToListBox;
var
  StyleStr: String;
begin
  // Add Styles menu items to the ListBox
  SettingsForm.StylesListBox.Clear;
  for StyleStr in TStyleManager.StyleNames do SettingsForm.StylesListBox.Items.Append(StyleStr);
  SettingsForm.StylesListBox.Sorted := True;
end;

procedure TMainForm.ClearPingFrames1;
var
  ActivePingsB: Boolean;
begin
  ActivePingsB := False;
  StopPinging1(ActivePingsB);
  Sleep(TimeToWait);
  if PauseForRemoveFrame and ActivePingsB then
    MyMessageDlgTm('Pausing for pings to finish!', mtConfirmation, [mbYes], ['Continue'], 'Confirmation', mbYes, Rect(MainForm.Left, MainForm.Top, MainForm.Left + MainForm.Width, MainForm.Top + MainForm.Height), CntDwnFrm);
  MinusFrames1;
  ClearFrames1;
end;

procedure TMainForm.ClearPingFrames2;
var
  ActivePingsB: Boolean;
begin
  ActivePingsB := False;
  StopPinging2(ActivePingsB);
  Sleep(TimeToWait);
  if PauseForRemoveFrame and ActivePingsB then
    MyMessageDlgTm('Pausing for pings to finish!', mtConfirmation, [mbYes], ['Continue'], 'Confirmation', mbYes, Rect(MainForm.Left, MainForm.Top, MainForm.Left + MainForm.Width, MainForm.Top + MainForm.Height), CntDwnFrm);
  MinusFrames2;
  ClearFrames2;
end;

procedure TMainForm.AddPingFrame1;
begin
  SetLength(PingFrameA1, Length(PingFrameA1) + 1);
  PingFrameA1[High(PingFrameA1)] := TPingFrame.Create(ColumnPanel1);
  with PingFrameA1[High(PingFrameA1)] do
  begin
    Parent := ColumnPanel1;
    if High(PingFrameA1) = 0 then
    begin
      Top := 0;
    end
    else
    begin
      Top := High(PingFrameA1) * Height {+ 5};
    end;
    Left := 0;
    Width := ColumnPanel1.Width;
    Anchors := [akLeft, akTop, akRight];
    Name := 'PingFrame_' + IntToStr(High(PingFrameA1));
    Tag := High(PingFrameA1);
    PopupMenu := FramePM1;
    BottomRightPanel.Visible := StartTimeoutPnlVisible;
    SizeFrames1;
    gThrowAwayFirstPing := ThrowAwayFirstPing;
    {$IFDEF VER360} // RAD Studio 12
      PingChart.View3DOptions.ZoomText := ztNo;
    {$ENDIF}
  end;
end;

procedure TMainForm.AddPingFrame2;
begin
  SetLength(PingFrameA2, Length(PingFrameA2) + 1);
  PingFrameA2[High(PingFrameA2)] := TPingFrame.Create(ColumnPanel2);
  with PingFrameA2[High(PingFrameA2)] do
  begin
    Parent := ColumnPanel2;
    if High(PingFrameA2) = 0 then
    begin
      Top := 0;
    end
    else
    begin
      Top := High(PingFrameA2) * Height {+ 5};
    end;
    Left := 0;
    Width := ColumnPanel2.Width;
    Anchors := [akLeft, akTop, akRight];
    Name := 'PingFrame2_' + IntToStr(High(PingFrameA2));
    Tag := High(PingFrameA2);
    PopupMenu := FramePM2;
    BottomRightPanel.Visible := StartTimeoutPnlVisible;
    SizeFrames2;
    gThrowAwayFirstPing := ThrowAwayFirstPing;
    {$IFDEF VER360} // RAD Studio 12
      PingChart.View3DOptions.ZoomText := ztNo;
    {$ENDIF}
  end;
end;

end.
