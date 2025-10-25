unit PIAFrameUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Samples.Spin;

type
  TPingIntervalAdjustFrame = class(TFrame)
    FrameLbl: TLabel;
    IntervalSpinEdit: TSpinEdit;
    SetIntervalBtn: TButton;
    procedure SetIntervalBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses MFUnit;

procedure TPingIntervalAdjustFrame.SetIntervalBtnClick(Sender: TObject);
var
  Column, Row, Interval: Integer;
begin
  Column := 1;
  if Pos('PIAFrame2_', Self.Name) > 0 then Column := 2;
  Row := Self.Tag;
  Interval := Self.IntervalSpinEdit.Value;
  MainForm.SetPingIntervalInFrame(Column, Row, Interval);
end;

end.
