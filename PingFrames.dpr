program PingFrames;

uses
  Forms,
  MFUnit in 'MFUnit.pas' {MainForm},
  UtlUnit in '..\UTL\UtlUnit.pas',
  About in 'About.pas' {AboutBox},
  SelectFileUnit in 'SelectFileUnit.pas' {SelectFileDlg},
  SelectFileFrameUnit in 'SelectFileFrameUnit.pas' {SelectFileFrame: TFrame},
  ScrPosF in 'ScrPosF.pas' {ScrPosFrame: TFrame},
  SetUnit in 'SetUnit.pas' {SettingsForm},
  Vcl.Themes,
  Vcl.Styles,
  IMUnit in 'IMUnit.pas' {InfoMemoForm},
  PingFrameUnit in 'PingFrameUnit.pas' {PingFrame: TFrame},
  OIUnit in 'OIUnit.pas' {OIForm},
  HLBEditMemoUnit in 'HLBEditMemoUnit.pas' {HLBEditMemoDlg},
  ScanPortsUnit in 'ScanPortsUnit.pas' {ScanPortsForm},
  PIAFrameUnit in 'PIAFrameUnit.pas' {PingIntervalAdjustFrame: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSelectFileDlg, SelectFileDlg);
  Application.CreateForm(TSettingsForm, SettingsForm);
  Application.CreateForm(TInfoMemoForm, InfoMemoForm);
  Application.CreateForm(TInfoMemoForm, InfoMemoForm);
  Application.CreateForm(TOIForm, OIForm);
  Application.CreateForm(THLBEditMemoDlg, HLBEditMemoDlg);
  Application.CreateForm(TScanPortsForm, ScanPortsForm);
  Application.Run;
end.
