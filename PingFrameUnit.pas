unit PingFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.TeeProcs, VCLTee.Chart,
  VCLTee.Series, Vcl.Buttons, Vcl.Samples.Spin, OverbyteIcsWndControl,
  OverbyteIcsWSocket;

const
  clCarbon = $00323232;
  clPing1C = clGreen;
  clPing2C = clBlue;
  clPing3C = $000080FF; //Orange
  clPing4C = clFuchsia;
  clPing5C = clBlack;
  clPing6C = clRed;
  clPing7C = $00808040;
  clPing8C = clPurple;
  clPingTimeout = clWhite;

type
  TPingFrame = class(TFrame)
    TopPanel: TPanel;
    PingChart: TChart;
    LineSeries: TLineSeries;
    ContinuousPingSpdBtn: TSpeedButton;
    PingTimer: TTimer;
    StatusLbl: TLabel;
    ThreadInProgressLbl: TLabel;
    IPAddressLbl: TLabel;
    HostEdit: TEdit;
    BottomPanel: TPanel;
    BottomRightPanel: TPanel;
    Splitter: TSplitter;
    TimeoutsLbl: TLabel;
    ToggleBRPnl: TPanel;
    WSocket: TWSocket;
    LastTimeoutComboBox: TComboBox;
    ClearChartPnl: TPanel;
    PointsLbl: TLabel;
    TimeSinceLastTimeoutLbl: TLabel;
    SpacerPnl4: TPanel;
    SpacerPnl3: TPanel;
    SpacerPnl2: TPanel;
    SpacerPnl1: TPanel;
    PointsSpinBtn: TSpinButton;
    PointsEdit: TEdit;
    SpinEdit: TSpinEdit;
    procedure ContinuousPingSpdBtnClick(Sender: TObject);
    procedure PingTimerTimer(Sender: TObject);
    procedure ToggleBRPnlClick(Sender: TObject);
    procedure WSocketDnsLookupDone(Sender: TObject; ErrCode: Word);
    procedure ClearChartPnlClick(Sender: TObject);
    procedure TimeoutsLblMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ThreadInProgressLblClick(Sender: TObject);
    procedure PointsSpinBtnUpClick(Sender: TObject);
    procedure PointsSpinBtnDownClick(Sender: TObject);
  private
    ClearChart: Boolean;
    procedure DoPingThread(PingThreadId: Integer; HostToPing: String);
    procedure PingThreadTermPing(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  OverbyteIcsPing, DateUtils;

{$R *.dfm}

function RPad(InString: String; Noc: Byte; Value: Char): String;
var
  Pad: String;
  i: Integer;
begin
  Pad := '';
  for i := 1 to Noc do Pad := Pad + Value;
  Result := Copy(InString + String(Pad), 1, Noc);
end;

procedure TPingFrame.PingTimerTimer(Sender: TObject);
begin
  PingTimer.Enabled := False;
  if ClearChart then
  begin
    ClearChart := False;
    PingChart.Series[0].Clear;
  end;
  WSocket.DnsLookup(HostEdit.Text);
end;

procedure TPingFrame.PointsSpinBtnDownClick(Sender: TObject);
var
  TmpInt: Integer;
begin
  TmpInt := StrToIntDef(PointsEdit.Text, 1);
  if TmpInt < 6 then PointsEdit.Text := '1' else PointsEdit.Text := IntToStr(TmpInt - 5);
end;

procedure TPingFrame.PointsSpinBtnUpClick(Sender: TObject);
var
  TmpInt: Integer;
begin
  TmpInt := StrToIntDef(PointsEdit.Text, 1);
  if TmpInt > 295 then PointsEdit.Text := '300' else PointsEdit.Text := IntToStr(TmpInt + 5);
end;

procedure TPingFrame.WSocketDnsLookupDone(Sender: TObject; ErrCode: Word);
begin
  if ErrCode = 0 then
  begin
    IPAddressLbl.Caption := WSocket.DnsResult;
    DoPingThread(1, WSocket.DnsResult);
  end
  else
  begin
    IPAddressLbl.Caption := 'DNS Error!';
    ContinuousPingSpdBtn.Down := False;
    ContinuousPingSpdBtnClick(nil);
  end;
end;

procedure TPingFrame.ClearChartPnlClick(Sender: TObject);
begin
  ClearChart := True;
end;

procedure TPingFrame.ContinuousPingSpdBtnClick(Sender: TObject);
begin
  if ContinuousPingSpdBtn.Down then
  begin
    HostEdit.Enabled := False;
    ContinuousPingSpdBtn.Caption := 'Stop';
    WSocket.SocketFamily := sfIPv4;
    WSocket.DnsLookup(HostEdit.Text);
  end
  else
  begin
    ContinuousPingSpdBtn.Caption := 'Start';
    HostEdit.Enabled := True;
  end;
end;

procedure TPingFrame.DoPingThread(PingThreadId: Integer; HostToPing: String);
begin
  ThreadInProgressLbl.Caption := '+';
  with TPingThread.Create(True) do      // create suspended
  begin
    FreeOnTerminate := True;
    PingId := PingThreadId;             // keep track of the results
    OnTerminate := PingThreadTermPing;  // where we get the response
    PingHostName := HostToPing;         // host name or IP address to ping
    PingTimeout := 4000;                // ms
    PingTTL := 32;                      // hops
    PingLookupReply := False;           // don't need response host name lookup
    {$IF CompilerVersion < 21}
        Resume;    // start it now
    {$ELSE}
        Start;
    {$IFEND}
  end;
end;

procedure TPingFrame.ThreadInProgressLblClick(Sender: TObject);
begin
  ThreadInProgressLbl.Caption := '-';
end;

procedure TPingFrame.TimeoutsLblMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssShift in Shift then
  begin
    case Button of
      mbLeft:
      begin
        // Shift-Left-Click
        LastTimeoutComboBox.Text := '00:00:00';
        LastTimeoutComboBox.Items.Clear;
        TimeoutsLbl.Caption := 'Timeouts: ' + IntToStr(LastTimeoutComboBox.Items.Count);
      end;
      mbRight:
      begin
        // Shift-Right-Click
        ToggleBRPnl.Color := clBtnFace;
      end;
    end;
  end
  else
  begin
    case Button of
      mbLeft:
      begin
        // Left-Click
      end;
      mbRight:
      begin
        // Right-Click
      end;
    end;
  end;
end;

procedure TPingFrame.ToggleBRPnlClick(Sender: TObject);
begin
  ToggleBRPnl.Color := clBtnFace;
  BottomRightPanel.Visible := not BottomRightPanel.Visible;
  if BottomRightPanel.Visible then
  begin
    Splitter.Align := alRight;
    Splitter.Visible := True;
  end
  else
  begin
    Splitter.Visible := False;
    Splitter.Align := alNone;
  end;
end;

procedure TPingFrame.PingThreadTermPing(Sender: TObject);
var
  i, LowReplyRTT, HighReplyRTT, AverageReplyRTT, TmpRTT: Integer;
  Time1, Time2: TTime;
begin
// this event is thread safe, all publics from the thread are available here
  while PingChart.Series[0].Count >= StrToIntDef(PointsEdit.Text, 1) do PingChart.Series[0].Delete(0);
  with Sender as TPingThread do
  begin
    if ReplyTotal <> 0 then
    begin
      IPAddressLbl.Caption := DnsHostIP;
      if ReplyIPAddr <> DnsHostIP then
      begin
        if PingChart.Series[0].Count > 0 then
        begin
          PingChart.Series[0].AddXY(Now, PingChart.Series[0].YValue[PingChart.Series[0].Count - 1], '', clPing3C);
        end
        else
        begin
          // Should I do something here?
        end;
        LastTimeoutComboBox.Text := FormatDateTime('hh:nn:ss', Now);
        LastTimeoutComboBox.Items.Insert(0, FormatDateTime('hh:nn:ss', Now));
        while LastTimeoutComboBox.Items.Count > 99 do LastTimeoutComboBox.Items.Delete(LastTimeoutComboBox.Items.Count - 1);
        TimeoutsLbl.Caption := 'Timeouts: ' + IntToStr(LastTimeoutComboBox.Items.Count);
        ToggleBRPnl.Color := clYellow;
      end
      else
      begin
        PingChart.Series[0].AddXY(Now,ReplyRTT, '', clGreen);
        LowReplyRTT := Trunc(PingChart.Series[0].YValue[0]);
        for i := 0 to PingChart.Series[0].Count - 1 do
        begin
          if PingChart.Series[0].YValue[i] < LowReplyRTT then
            LowReplyRTT := Trunc(PingChart.Series[0].YValue[i]);
        end;
        HighReplyRTT := Trunc(PingChart.Series[0].YValue[0]);
        for i := 0 to PingChart.Series[0].Count - 1 do
        begin
          if PingChart.Series[0].YValue[i] > HighReplyRTT then
            HighReplyRTT := Trunc(PingChart.Series[0].YValue[i]);
        end;
        TmpRTT := Trunc(PingChart.Series[0].YValue[0]);
        for i := 1 to PingChart.Series[0].Count - 1 do
        begin
          TmpRTT := TmpRTT + Trunc(PingChart.Series[0].YValue[i]);
        end;
        AverageReplyRTT := Round(TmpRTT / PingChart.Series[0].Count);
        StatusLbl.Caption := 'Low: ' + IntToStr(LowReplyRTT) + '  Avg: ' + IntToStr(AverageReplyRTT) + '  High: ' + IntToStr(HighReplyRTT);
        PingChart.LeftAxis.AutomaticMaximum := False;
        PingChart.LeftAxis.Maximum := HighReplyRTT + (HighReplyRTT * 0.25);
      end;
    end
    else
    begin
      if PingChart.Series[0].Count > 0 then
      begin
        PingChart.Series[0].AddXY(Now, PingChart.Series[0].YValue[PingChart.Series[0].Count - 1], '', clRed);
      end
      else
      begin
        // Should I do something here?
      end;
      LastTimeoutComboBox.Text := FormatDateTime('hh:nn:ss', Now);
      LastTimeoutComboBox.Items.Insert(0, FormatDateTime('hh:nn:ss', Now));
      while LastTimeoutComboBox.Items.Count > 99 do LastTimeoutComboBox.Items.Delete(LastTimeoutComboBox.Items.Count - 1);
      TimeoutsLbl.Caption := 'Timeouts: ' + IntToStr(LastTimeoutComboBox.Items.Count);
      ToggleBRPnl.Color := clYellow;
    end;
  end;
  PointsLbl.Caption := 'Points: ' + IntToStr(PingChart.Series[0].Count);

  if LastTimeoutComboBox.Text = '00:00:00' then
  begin
    TimeSinceLastTimeoutLbl.Caption := '';
  end
  else
  begin
    Time1 := StrToTime(LastTimeoutComboBox.Text);
    Time2 := Time;
    TimeSinceLastTimeoutLbl.Caption := FormatDateTime('hh:nn:ss', SecondsBetween(Time1, Time2) / SecsPerDay);
  end;

  Application.ProcessMessages;
  ThreadInProgressLbl.Caption := '-';
  if Application.Terminated then Exit;
  if ContinuousPingSpdBtn.Down then PingTimer.Enabled := True;
end;

end.
