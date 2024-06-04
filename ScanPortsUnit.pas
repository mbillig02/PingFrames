unit ScanPortsUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, IdTCPClient,
  Vcl.Mask, OverbyteIcsWndControl, OverbyteIcsWSocket;

type
  TScanPortsForm = class(TForm)
    ScanPortsBtn: TButton;
    HostNameLabeledEdit: TLabeledEdit;
    ButtonPanel: TPanel;
    WSocket: TWSocket;
    DNSLookupBtn: TButton;
    DNSResultLbl: TLabel;
    procedure ScanPortsBtnClick(Sender: TObject);
    procedure DNSLookupBtnClick(Sender: TObject);
    procedure WSocketDnsLookupDone(Sender: TObject; ErrCode: Word);
  private
    procedure CreatePortsList;
    function TcpPing(Host: String; Port: Integer): Integer;
    procedure AddPortBtn(BtnCap: String; BtnTag: Integer; BtnHint: String);
    procedure PortBtnClick(Sender: TObject);
    { Private declarations }
  public
    procedure ClearPortBtnA;
    { Public declarations }
  end;

var
  ScanPortsForm: TScanPortsForm;
  PortBtnA: array of TButton;

implementation

uses MFUnit;

{$R *.dfm}

function StripDelimiterFromEnd(const StrToStrip: String; const Delimiter: Char): String;
var
  TmpInStr: String;
begin
  TmpInStr := StrToStrip;
  if Length(TmpInStr) > 0 then while Copy(TmpInStr, 1, 1) = Delimiter do Delete(TmpInStr, 1, 1);
  if Length(TmpInStr) > 0 then while Copy(TmpInStr, Length(TmpInStr), 1) = Delimiter do Delete(TmpInStr, Length(TmpInStr), 1);
  Result := TmpInStr;
end;

procedure Parse(const StrToParse: String; const Delimiter: Char; var Words: TStringList);
var
  TmpInStr: String;
begin
  TmpInStr := StripDelimiterFromEnd(StrToParse, Delimiter);
  Words.Clear;
  if Length(TmpInStr) > 0 then
  begin
    while Pos(Delimiter, TmpInStr) > 0 do
    begin
      Words.Append(Copy(TmpInStr, 1, Pos(Delimiter, TmpInStr) - 1));
      Delete(TmpInStr, 1, Pos(Delimiter, TmpInStr));
    end;
    Words.Append(TmpInStr);
  end;
end;

procedure TScanPortsForm.DNSLookupBtnClick(Sender: TObject);
begin
  WSocket.DnsLookup(HostNameLabeledEdit.Text);
end;

procedure TScanPortsForm.ClearPortBtnA;
var
  i: Integer;
begin
  for i := 0 to High(PortBtnA) do
  begin
    if Assigned(PortBtnA[i]) then
    begin
      PortBtnA[i].Free;
      PortBtnA[i] := nil;
    end;
  end;
  SetLength(PortBtnA, 0);
end;

procedure TScanPortsForm.PortBtnClick(Sender: TObject);
begin
  MainForm.HostListbox.Items.Append((Sender as TButton).Hint + ':' + IntToStr((Sender as TButton).Tag));
end;

procedure TScanPortsForm.AddPortBtn(BtnCap: String; BtnTag: Integer; BtnHint: String);
begin
  SetLength(PortBtnA, Length(PortBtnA) + 1);
  PortBtnA[High(PortBtnA)] := TButton.Create(ButtonPanel);
  with PortBtnA[High(PortBtnA)] do
  begin
    Visible := False;
    Parent := ButtonPanel;
    Name := 'PortBtn_' + IntToStr(High(PortBtnA));
    Caption := BtnCap;
    Tag := BtnTag;
    Hint := BtnHint;
    OnClick := PortBtnClick;
    Top := Height * High(PortBtnA);
    Align := alTop;
    Visible := True;
  end;
end;

procedure TScanPortsForm.CreatePortsList;
var
  PortsStrLst: TStringList;
begin
  PortsStrLst := TStringList.Create;
  PortsStrLst.Append('PortName,PortNumber');
  PortsStrLst.Append('ftp,21');
  PortsStrLst.Append('ssh,22');
  PortsStrLst.Append('telnet,23');
  PortsStrLst.Append('http,80');
  PortsStrLst.Append('https,443');
  PortsStrLst.Append('rdp,3389');
  PortsStrLst.SaveToFile(DtaDir + 'PortsList.csv');
  PortsStrLst.Free;
end;

procedure TScanPortsForm.ScanPortsBtnClick(Sender: TObject);
var
  PortsStrLst, Words: TStringList;
  i: Integer;
begin
  ClearPortBtnA;
  ScanPortsBtn.Enabled := False;
  PortsStrLst := TStringList.Create;
  Words := TStringList.Create;
  if not FileExists(DtaDir + 'PortsList.csv') then CreatePortsList;
  PortsStrLst.LoadFromFile(DtaDir + 'PortsList.csv');
  for i := 1 to PortsStrLst.Count - 1 do
  begin
    Parse(PortsStrLst[i], ',', Words);
    if TcpPing(HostNameLabeledEdit.Text, StrToInt(Words[1])) = 1 then
    begin
      AddPortBtn(Words[0], StrToInt(Words[1]), HostNameLabeledEdit.Text);
    end;
  end;
  Words.Free;
  PortsStrLst.Free;
  ScanPortsBtn.Enabled := True;
end;

function TScanPortsForm.TcpPing(Host: String; Port: Integer): Integer;
var
  TcpClient: TIdTCPClient;
begin
  TcpClient := TIdTCPClient.Create(nil);
  try
    try
      TcpClient.Host := Host;
      TcpClient.Port := Port;
      TcpClient.ConnectTimeout := 200;
      TcpClient.Connect;
      Result := 1;
    except
      Result := 0;
    end;
  finally
    FreeAndNil(TcpClient);
  end;
end;

procedure TScanPortsForm.WSocketDnsLookupDone(Sender: TObject; ErrCode: Word);
begin
  if ErrCode = 0 then
  begin
    DNSResultLbl.Caption := WSocket.DnsResult;
  end
  else
  begin
    DNSResultLbl.Caption := 'DNS Lookup Failed!';
  end;
end;

end.
