unit HLBEditMemoUnit;

interface

uses Winapi.Windows, System.SysUtils, System.Classes, Vcl.Graphics, Vcl.Forms,
  Vcl.Controls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  THLBEditMemoDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    ListBoxEditMemo: TMemo;
    RightPanel: TPanel;
    SortBtn: TButton;
    UpperCaseBtn: TButton;
    LowerCaseBtn: TButton;
    procedure ListBoxEditMemoKeyPress(Sender: TObject; var Key: Char);
    procedure SortBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UpperCaseBtnClick(Sender: TObject);
    procedure LowerCaseBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HLBEditMemoDlg: THLBEditMemoDlg;

implementation

{$R *.dfm}

procedure THLBEditMemoDlg.UpperCaseBtnClick(Sender: TObject);
begin
  ListBoxEditMemo.SelText := UpperCase(ListBoxEditMemo.SelText);
end;

procedure THLBEditMemoDlg.FormActivate(Sender: TObject);
begin
  ListBoxEditMemo.SetFocus;
end;

procedure THLBEditMemoDlg.ListBoxEditMemoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = ^A then
  begin
    (Sender as TMemo).SelectAll;
    Key := #0;
  end;
end;

procedure THLBEditMemoDlg.LowerCaseBtnClick(Sender: TObject);
begin
  ListBoxEditMemo.SelText := LowerCase(ListBoxEditMemo.SelText);
end;

procedure THLBEditMemoDlg.SortBtnClick(Sender: TObject);
var
  TmpStrLst: TStringList;
begin
  TmpStrLst := TStringList.Create;
  TmpStrLst.Text := ListBoxEditMemo.Text;
  TmpStrLst.Sort;
  ListBoxEditMemo.Text := TmpStrLst.Text;
  TmpStrLst.Free;
end;

end.
