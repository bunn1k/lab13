unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    FA:word;
    FB:integer;
    procedure SetA(const Value: word);
    function GetB: integer;
  public
    property A:word read FA write SetA;
    property B:integer read GetB write FB;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
  A:=100;
  Memo1.Lines.Add(IntToStr(A));
  B:=300;
  Memo1.Lines.Add(IntToStr(B));
end;

function TForm1.GetB: integer;
begin
  Result := FB;
end;

procedure TForm1.SetA(const Value: word);
begin
  FA := Value+5000;
end;

end.
