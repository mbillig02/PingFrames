unit SetUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList, Vcl.ComCtrls,
  JvExComCtrls, JvPageListTreeView, Vcl.StdCtrls, ScrPosF, JvComponentBase,
  JvBalloonHint, Vcl.ExtCtrls, Vcl.CheckLst, Vcl.Samples.Spin, PIAFrameUnit;

type
  TSettingsForm = class(TForm)
    JvPageList: TJvPageList;
    JvStandardPageForm: TJvStandardPage;
    SetDefaultScreenBtn: TButton;
    SetAlomstFullScreenBtn: TButton;
    SavFrmSizChkBox: TCheckBox;
    SavFrmPosChkBox: TCheckBox;
    TScrPosFrame: TScrPosFrame;
    JvStandardPageDirectories: TJvStandardPage;
    DtaDirGrpBox: TGroupBox;
    DtaDirLbl: TLabel;
    DtaDirCopyToClpBrdBtn: TButton;
    DtaDirOpenInExplorerBtn: TButton;
    DtaDirJvBalloonHint: TJvBalloonHint;
    TmpDirGrpBox: TGroupBox;
    TmpDirLbl: TLabel;
    TmpDirCopyToClpBrdBtn: TButton;
    TmpDirOpenInExplorerBtn: TButton;
    TmpDirJvBalloonHint: TJvBalloonHint;
    JvStandardPageStyles: TJvStandardPage;
    StylesListBox: TListBox;
    MainFormSettingsToListBoxBtn: TButton;
    MainFormSettingsToFormBtn: TButton;
    DeleteListBoxItemBtn: TButton;
    ListToFormGroupBox: TGroupBox;
    MainFormPosSettingsToFormBtn: TButton;
    MainFormSizeSettingsToFormBtn: TButton;
    StylesMMCheckBox: TCheckBox;
    EnableStylesSettingsCheckBox: TCheckBox;
    LstDirJvBalloonHint: TJvBalloonHint;
    LstDirGrpBox: TGroupBox;
    LstDirLbl: TLabel;
    LstDirCopyToClpBrdBtn: TButton;
    LstDirOpenInExplorerBtn: TButton;
    SetLeftPanel: TPanel;
    DirBtn: TButton;
    FormBtn: TButton;
    StylesBtn: TButton;
    MainFormSettingsListBox: TCheckListBox;
    MiscBtn: TButton;
    JvStandardPageMisc: TJvStandardPage;
    AutoStartPingingCheckBox: TCheckBox;
    StartTimeoutPnlVisibleCheckBox: TCheckBox;
    ConvertToLCCheckBox: TCheckBox;
    ConvertToUCCheckBox: TCheckBox;
    PasteToHostListGroupBox: TGroupBox;
    SsnDirGrpBox: TGroupBox;
    SsnDirLbl: TLabel;
    SsnDirCopyToClpBrdBtn: TButton;
    SsnDirOpenInExplorerBtn: TButton;
    SsnDirJvBalloonHint: TJvBalloonHint;
    PauseForRemoveFrameCheckBox: TCheckBox;
    CntDwnSpinEdit: TSpinEdit;
    SaveHostListBoxWidthCheckBox: TCheckBox;
    StartPingingOnFrameCreateCheckBox: TCheckBox;
    ThrowAwayFirstPingCheckBox: TCheckBox;
    ShowIPWidthSpinEditCheckBox: TCheckBox;
    JvStandardPageIntervals: TJvStandardPage;
    DefaultPingIntervalSpinEdit: TSpinEdit;
    IntervalsBtn: TButton;
    IntervalsGroupBox: TGroupBox;
    DefaultPingIntervalLbl: TLabel;
    IntervalsMemo: TMemo;
    Intervals2Memo: TMemo;
    ListPIAFrameBtn: TButton;
    IntervalsMiddlePnl: TPanel;
    PIAPanelSplitter: TSplitter;
    PIAPanel1: TScrollBox;
    PIAPanel2: TScrollBox;
    procedure SetDefaultScreenBtnClick(Sender: TObject);
    procedure SetAlomstFullScreenBtnClick(Sender: TObject);
    procedure SavFrmSizChkBoxClick(Sender: TObject);
    procedure SavFrmPosChkBoxClick(Sender: TObject);
    procedure TScrPosFrameSpinEditTopChange(Sender: TObject);
    procedure TScrPosFrameSpinEditLeftChange(Sender: TObject);
    procedure TScrPosFrameSpinEditHeightChange(Sender: TObject);
    procedure TScrPosFrameSpinEditWidthChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DtaDirCopyToClpBrdBtnClick(Sender: TObject);
    procedure DtaDirOpenInExplorerBtnClick(Sender: TObject);
    procedure TmpDirCopyToClpBrdBtnClick(Sender: TObject);
    procedure TmpDirOpenInExplorerBtnClick(Sender: TObject);
    procedure StylesListBoxClick(Sender: TObject);
    procedure MainFormSettingsToListBoxBtnClick(Sender: TObject);
    procedure MainFormSettingsToFormBtnClick(Sender: TObject);
    procedure DeleteListBoxItemBtnClick(Sender: TObject);
    procedure MainFormPosSettingsToFormBtnClick(Sender: TObject);
    procedure MainFormSizeSettingsToFormBtnClick(Sender: TObject);
    procedure StylesMMCheckBoxClick(Sender: TObject);
    procedure EnableStylesSettingsCheckBoxClick(Sender: TObject);
    procedure LstDirCopyToClpBrdBtnContextPopup(Sender: TObject;
      MousePos: TPoint; var Handled: Boolean);
    procedure LstDirOpenInExplorerBtnClick(Sender: TObject);
    procedure DirBtnClick(Sender: TObject);
    procedure FormBtnClick(Sender: TObject);
    procedure StylesBtnClick(Sender: TObject);
    procedure MainFormSettingsListBoxClickCheck(Sender: TObject);
    procedure MiscBtnClick(Sender: TObject);
    procedure AutoStartPingingCheckBoxClick(Sender: TObject);
    procedure StartTimeoutPnlVisibleCheckBoxClick(Sender: TObject);
    procedure ConvertToLCCheckBoxClick(Sender: TObject);
    procedure ConvertToUCCheckBoxClick(Sender: TObject);
    procedure SsnDirCopyToClpBrdBtnClick(Sender: TObject);
    procedure SsnDirOpenInExplorerBtnClick(Sender: TObject);
    procedure PauseForRemoveFrameCheckBoxClick(Sender: TObject);
    procedure CntDwnSpinEditChange(Sender: TObject);
    procedure SaveHostListBoxWidthCheckBoxClick(Sender: TObject);
    procedure StartPingingOnFrameCreateCheckBoxClick(Sender: TObject);
    procedure ThrowAwayFirstPingCheckBoxClick(Sender: TObject);
    procedure ShowIPWidthSpinEditCheckBoxClick(Sender: TObject);
    procedure IntervalsBtnClick(Sender: TObject);
    procedure ListPIAFrameBtnClick(Sender: TObject);
  private
    procedure OpenDirectory(DirectoryName: String);
    procedure ListToForm(PositionB, SizeB: Boolean);
    procedure AddPIAFrame(HostNameText: string; PingInterval: Integer);
    procedure ClearPIAFrames;
    procedure ClearPIAFrames2;
    procedure AddPIAFrame2(HostNameText: string; PingInterval: Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses MFUnit, ClipBrd, ShellApi, Themes, PerlRegex, IniFiles, PingFrameUnit;

var
  IniFileName: String;
  PIAFrameA1, PIAFrameA2: array of TPingIntervalAdjustFrame;

procedure OpenAsTextFile(const FileName: String);
var
  sei: TShellExecuteInfo;
begin
  ZeroMemory(@sei, SizeOf(sei));
  sei.cbSize := SizeOf(sei);
  sei.fMask := SEE_MASK_CLASSNAME;
  sei.lpFile := PChar(FileName);
  sei.lpClass := '.txt';
  sei.nShow := SW_SHOWNORMAL;
  ShellExecuteEx(@sei);
end;

procedure TSettingsForm.SetDefaultScreenBtnClick(Sender: TObject);
begin
  MainForm.Top := MainFormDefaultRect.Top;
  MainForm.Left := MainFormDefaultRect.Left;
  MainForm.Height := MainFormDefaultRect.Height;
  MainForm.Width := MainFormDefaultRect.Width;
  MainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.ShowIPWidthSpinEditCheckBoxClick(Sender: TObject);
begin
  MainForm.ShowIPWidthSpinEdit;
end;

procedure TSettingsForm.SsnDirCopyToClpBrdBtnClick(Sender: TObject);
begin
  SsnDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := MainForm.GetSsnDir;
  SsnDirJvBalloonHint.ActivateHint(SsnDirCopyToClpBrdBtn, '(Copied to clipboard)', MainForm.GetSsnDir, 4000);
end;

procedure TSettingsForm.SsnDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(MainForm.GetSsnDir);
end;

procedure TSettingsForm.StartPingingOnFrameCreateCheckBoxClick(Sender: TObject);
begin
  StartPingingOnFrameCreate := StartPingingOnFrameCreateCheckBox.Checked;
end;

procedure TSettingsForm.StartTimeoutPnlVisibleCheckBoxClick(Sender: TObject);
begin
  StartTimeoutPnlVisible := StartTimeoutPnlVisibleCheckBox.Checked;
end;

procedure TSettingsForm.StylesBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 0;
end;

procedure TSettingsForm.StylesListBoxClick(Sender: TObject);
begin
  StyleStr := StylesListBox.Items[StylesListBox.ItemIndex];
  TStyleManager.TrySetStyle(StyleStr);
end;

procedure TSettingsForm.StylesMMCheckBoxClick(Sender: TObject);
begin
  StylesMM := StylesMMCheckBox.Checked;
  MainForm.mmiStyles.Visible := StylesMM;
  MainForm.RightMenu(MainForm.mmiVersionAbout);
end;

procedure TSettingsForm.SetAlomstFullScreenBtnClick(Sender: TObject);
begin
  MainForm.Top := 30;
  MainForm.Left := 30;
  MainForm.Height := Screen.WorkAreaHeight - 60;
  MainForm.Width := Screen.WorkAreaWidth - 60;
  MainForm.UpdateScrPosEdits;
end;

procedure TSettingsForm.ThrowAwayFirstPingCheckBoxClick(Sender: TObject);
begin
  ThrowAwayFirstPing := ThrowAwayFirstPingCheckBox.Checked;
end;

procedure TSettingsForm.TmpDirCopyToClpBrdBtnClick(Sender: TObject);
begin
  TmpDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := MainForm.GetTmpDir;
  TmpDirJvBalloonHint.ActivateHint(TmpDirCopyToClpBrdBtn, '(Copied to clipboard)', MainForm.GetTmpDir, 4000);
end;

procedure TSettingsForm.MainFormSettingsToListBoxBtnClick(Sender: TObject);
var
  TmpStr: String;
begin
//  MainFormSettingsListBox.Items.Add('T:1234 | L:1234 | H:1234 | W:1234');
  TmpStr := 'T:' + IntToStr(TScrPosFrame.SpinEditTop.Value) + ' | ' +
            'L:' + IntToStr(TScrPosFrame.SpinEditLeft.Value) + ' | ' +
            'H:' + IntToStr(TScrPosFrame.SpinEditHeight.Value) + ' | ' +
            'W:' + IntToStr(TScrPosFrame.SpinEditWidth.Value);
  if MainFormSettingsListBox.Items.IndexOf(TmpStr) = -1 then
    MainFormSettingsListBox.Items.Add(TmpStr);
end;

procedure TSettingsForm.ListToForm(PositionB: Boolean; SizeB: Boolean);
var
  Regex: TPerlRegEx;
begin
  if MainFormSettingsListBox.ItemIndex <> -1 then
  begin
    Regex := TPerlRegEx.Create;
    try
      Regex.RegEx := 'T:(?<Top>[0-9]+) \| L:(?<Left>[0-9]+) \| H:(?<Height>[0-9]+) \| W:(?<Width>[0-9]+)';
      Regex.Options := [];
      Regex.State := [];
      Regex.Subject := AnsiToUTF8(MainFormSettingsListBox.Items[MainFormSettingsListBox.ItemIndex]);
      if Regex.Match then
      begin
        if PositionB then
        begin
          TScrPosFrame.SpinEditTop.Value := StrToInt(Utf8ToAnsi(Regex.Groups[1]));
          TScrPosFrame.SpinEditLeft.Value := StrToInt(Utf8ToAnsi(Regex.Groups[2]));
        end;
        if SizeB then
        begin
          TScrPosFrame.SpinEditHeight.Value := StrToInt(Utf8ToAnsi(Regex.Groups[3]));
          TScrPosFrame.SpinEditWidth.Value := StrToInt(Utf8ToAnsi(Regex.Groups[4]));
        end;
      end;
    finally
      Regex.Free;
    end;
  end;
end;

procedure TSettingsForm.AddPIAFrame(HostNameText: string; PingInterval: Integer);
begin
  SetLength(PIAFrameA1, Length(PIAFrameA1) + 1);
  PIAFrameA1[High(PIAFrameA1)] := TPingIntervalAdjustFrame.Create(PIAPanel1);
  with PIAFrameA1[High(PIAFrameA1)] do
  begin
    Parent := PIAPanel1;
    if High(PIAFrameA1) = 0 then
    begin
      Top := 0;
    end
    else
    begin
      Top := High(PIAFrameA1) * Height;
    end;
    Left := 0;
    Width := PIAPanel1.Width;
    Anchors := [akLeft, akTop, akRight];
    Name := 'PIAFrame_' + IntToStr(High(PIAFrameA1));
    Tag := High(PIAFrameA1);
    FrameLbl.Caption := HostNameText;
    IntervalSpinEdit.Value := PingInterval;
  end;
end;

procedure TSettingsForm.AddPIAFrame2(HostNameText: string; PingInterval: Integer);
begin
  SetLength(PIAFrameA2, Length(PIAFrameA2) + 1);
  PIAFrameA2[High(PIAFrameA2)] := TPingIntervalAdjustFrame.Create(PIAPanel2);
  with PIAFrameA2[High(PIAFrameA2)] do
  begin
    Parent := PIAPanel2;
    if High(PIAFrameA2) = 0 then
    begin
      Top := 0;
    end
    else
    begin
      Top := High(PIAFrameA2) * Height;
    end;
    Left := 0;
    Width := PIAPanel2.Width;
    Anchors := [akLeft, akTop, akRight];
    Name := 'PIAFrame2_' + IntToStr(High(PIAFrameA2));
    Tag := High(PIAFrameA2);
    FrameLbl.Caption := HostNameText;
    IntervalSpinEdit.Value := PingInterval;
  end;
end;

procedure TSettingsForm.ClearPIAFrames;
var
  i: Integer;
begin
  for i := 0 to High(PIAFrameA1) do
  begin
    if Assigned(PIAFrameA1[i]) then
    begin
      PIAFrameA1[i].Free;
      PIAFrameA1[i] := nil;
    end;
  end;
  SetLength(PIAFrameA1, 0);
end;

procedure TSettingsForm.ClearPIAFrames2;
var
  i: Integer;
begin
  for i := 0 to High(PIAFrameA2) do
  begin
    if Assigned(PIAFrameA2[i]) then
    begin
      PIAFrameA2[i].Free;
      PIAFrameA2[i] := nil;
    end;
  end;
  SetLength(PIAFrameA2, 0);
end;

procedure TSettingsForm.LstDirCopyToClpBrdBtnContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  LstDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := MainForm.GetLstDir;
  LstDirJvBalloonHint.ActivateHint(LstDirCopyToClpBrdBtn, '(Copied to clipboard)', MainForm.GetLstDir, 4000);
end;

procedure TSettingsForm.LstDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(MainForm.GetLstDir);
end;

procedure TSettingsForm.MainFormSizeSettingsToFormBtnClick(Sender: TObject);
begin
  ListToForm(False, True);
end;

procedure TSettingsForm.MiscBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 3;
end;

procedure TSettingsForm.MainFormPosSettingsToFormBtnClick(Sender: TObject);
begin
  ListToForm(True, False);
end;

procedure TSettingsForm.MainFormSettingsListBoxClickCheck(Sender: TObject);
begin
  MainForm.PopulateScreenPresetsMenu;
end;

procedure TSettingsForm.MainFormSettingsToFormBtnClick(Sender: TObject);
begin
  ListToForm(True, True);
end;

procedure TSettingsForm.AutoStartPingingCheckBoxClick(Sender: TObject);
begin
  AutoStartPinging := AutoStartPingingCheckBox.Checked;
end;

procedure TSettingsForm.ListPIAFrameBtnClick(Sender: TObject);
var
  HostNameText: String;
  PingInterval: Integer;
  i: Integer;
begin
  ClearPIAFrames; ClearPIAFrames2;
  IntervalsMemo.Text := MainForm.ListPingIntervals;
  for i := 0 to IntervalsMemo.Lines.Count - 1 do
  begin
    HostNameText := Copy(IntervalsMemo.Lines[i], 1, Pos(' | ', IntervalsMemo.Lines[i]));
    PingInterval := StrToInt(Copy(IntervalsMemo.Lines[i], Pos(' | ', IntervalsMemo.Lines[i]) + 3));
    AddPIAFrame(HostNameText, PingInterval);
  end;
  Intervals2Memo.Text := MainForm.ListPingIntervals2;
  PIAPanel2.Visible := (Length(Intervals2Memo.Text) > 0);
  for i := 0 to Intervals2Memo.Lines.Count - 1 do
  begin
    HostNameText := Copy(Intervals2Memo.Lines[i], 1, Pos(' | ', Intervals2Memo.Lines[i]));
    PingInterval := StrToInt(Copy(Intervals2Memo.Lines[i], Pos(' | ', Intervals2Memo.Lines[i]) + 3));
    AddPIAFrame2(HostNameText, PingInterval);
  end;
end;

procedure TSettingsForm.CntDwnSpinEditChange(Sender: TObject);
begin
  CntDwnFrm := CntDwnSpinEdit.Value;
end;

procedure TSettingsForm.ConvertToLCCheckBoxClick(Sender: TObject);
begin
  if ConvertToLCCheckBox.Checked then
  begin
    ConvertToLC := True;
    ConvertToUC := False;
    ConvertToUCCheckbox.Checked := ConvertToUC;
  end
  else
  begin
    ConvertToLC := False;
  end;
end;

procedure TSettingsForm.ConvertToUCCheckBoxClick(Sender: TObject);
begin
  if ConvertToUCCheckBox.Checked then
  begin
    ConvertToUC := True;
    ConvertToLC := False;
    ConvertToLCCheckbox.Checked := ConvertToLC;
  end
  else
  begin
    ConvertToUC := False;
  end;
end;

procedure TSettingsForm.DeleteListBoxItemBtnClick(Sender: TObject);
var
  OldIndx: Integer;
  ItemChecked: Boolean;
begin
  if MainFormSettingsListBox.ItemIndex <> -1 then
  begin
    OldIndx := MainFormSettingsListBox.ItemIndex;
    ItemChecked := MainFormSettingsListBox.Checked[OldIndx];
    MainFormSettingsListBox.DeleteSelected;
    if MainFormSettingsListBox.Items.Count > 0 then    // set listbox position to old position - 1
    begin
      if OldIndx > 0 then
      begin
        if OldIndx > MainFormSettingsListBox.Count - 1 then
        begin
          MainFormSettingsListBox.ItemIndex := MainFormSettingsListBox.Count - 1;
        end
        else
        begin
          MainFormSettingsListBox.ItemIndex := OldIndx;
        end;
      end
      else
      begin
        MainFormSettingsListBox.ItemIndex := 0;
      end;
    end;
    if ItemChecked then MainForm.PopulateScreenPresetsMenu;
  end;
end;

procedure TSettingsForm.DirBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 2;
end;

procedure TSettingsForm.DtaDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(MainForm.GetDtaDir);
end;

procedure TSettingsForm.EnableStylesSettingsCheckBoxClick(Sender: TObject);
begin
  StylesListBox.Enabled := EnableStylesSettingsCheckBox.Checked;
  StylesEnabled := EnableStylesSettingsCheckBox.Checked;
end;

procedure TSettingsForm.TmpDirOpenInExplorerBtnClick(Sender: TObject);
begin
  OpenDirectory(MainForm.GetTmpDir);
end;

procedure TSettingsForm.DtaDirCopyToClpBrdBtnClick(Sender: TObject);
begin
  DtaDirCopyToClpBrdBtn.Hint := '';
  Clipboard.AsText := MainForm.GetDtaDir;
  DtaDirJvBalloonHint.ActivateHint(DtaDirCopyToClpBrdBtn, '(Copied to clipboard)', MainForm.GetDtaDir, 4000);
end;

procedure TSettingsForm.FormActivate(Sender: TObject);
begin
  TScrPosFrame.SpinEditTop.Value := MainForm.Top;
  TScrPosFrame.SpinEditLeft.Value := MainForm.Left;
  TScrPosFrame.SpinEditHeight.Value := MainForm.Height;
  TScrPosFrame.SpinEditWidth.Value := MainForm.Width;
end;

procedure TSettingsForm.FormBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 1;
end;

procedure TSettingsForm.IntervalsBtnClick(Sender: TObject);
begin
  JvPageList.ActivePageIndex := 4;
end;

procedure TSettingsForm.OpenDirectory(DirectoryName: String);
begin
  ShellExecute(Application.Handle,
    nil,
    'explorer.exe',
    PChar(DirectoryName), //wherever you want the window to open to
    nil,
    SW_NORMAL     //see other possibilities by ctrl+clicking on SW_NORMAL
    );
end;

procedure TSettingsForm.PauseForRemoveFrameCheckBoxClick(Sender: TObject);
begin
  PauseForRemoveFrame := PauseForRemoveFrameCheckBox.Checked;
end;

procedure TSettingsForm.SaveHostListBoxWidthCheckBoxClick(Sender: TObject);
begin
  SaveHostListBoxWidth := SaveHostListBoxWidthCheckBox.Checked;
end;

procedure TSettingsForm.SavFrmPosChkBoxClick(Sender: TObject);
begin
  SaveFormPosition := SavFrmPosChkBox.Checked;
end;

procedure TSettingsForm.SavFrmSizChkBoxClick(Sender: TObject);
begin
  SaveFormSize := SavFrmSizChkBox.Checked;
end;

procedure TSettingsForm.TScrPosFrameSpinEditHeightChange(Sender: TObject);
begin
  MainForm.Height := TScrPosFrame.SpinEditHeight.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditLeftChange(Sender: TObject);
begin
  MainForm.Left := TScrPosFrame.SpinEditLeft.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditTopChange(Sender: TObject);
begin
  MainForm.Top := TScrPosFrame.SpinEditTop.Value;
end;

procedure TSettingsForm.TScrPosFrameSpinEditWidthChange(Sender: TObject);
begin
  MainForm.Width := TScrPosFrame.SpinEditWidth.Value;
end;

end.
