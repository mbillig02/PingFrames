unit SetUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvPageList, Vcl.ComCtrls,
  JvExComCtrls, JvPageListTreeView, Vcl.StdCtrls, ScrPosF, JvComponentBase,
  JvBalloonHint, Vcl.ExtCtrls, Vcl.CheckLst;

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
  private
    procedure OpenDirectory(DirectoryName: String);
    procedure ListToForm(PositionB, SizeB: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SettingsForm: TSettingsForm;

implementation

{$R *.dfm}

uses MFUnit, ClipBrd, ShellApi, Themes, PerlRegex, IniFiles;

var
  IniFileName: String;

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
