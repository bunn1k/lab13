unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TFirst = class
  public
  procedure Hello;
  end;

  TSecond = class(TFirst)
  public
  procedure Hello; reintroduce;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TFirst }

procedure TFirst.Hello;
var
  a:string;
begin
  a:='Hello';
end;

{ TSecond }

procedure TSecond.Hello;
var
  a:string;
begin
  a:='Hello Second';
end;

end.
