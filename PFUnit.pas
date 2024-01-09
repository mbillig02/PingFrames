unit PFUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PingFrameUnit, JvComponentBase,
  JvFormMagnet;

type
  TPingForm = class(TForm)
    PingFrame: TPingFrame;
    JvFormMagnet: TJvFormMagnet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PingForm: TPingForm;

implementation

{$R *.dfm}

end.
