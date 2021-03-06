unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
  public
  end;

  T1 = class
    procedure Test(i:integer); overload; virtual;
  end;

  T2 = class(T1)
    procedure Test(s:string); overload;
    procedure Test(i:integer); override;
  end;

  T3 = class(T2)
    procedure Test(i:integer); override;
  end;

var
  Form1: TForm1;
  T1_:T1;
  T2_:T2;
  T3_:T3;

implementation

{$R *.dfm}

{ T1 }

procedure T1.Test(i: integer);
begin
  ShowMessage('T1.Test(i:integer)');
end;

{ T2 }

procedure T2.Test(s: string);
begin
  ShowMessage('T2.Test(s:string)');
end;

procedure T2.Test(i: integer);
begin
  ShowMessage('T2.Test(i:integer)');
end;

{ T3 }

procedure T3.Test(i: integer);
begin
  ShowMessage('T3.Test(i:integer)');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  T2_:=T2.Create;
  T2_.Test('????? ?????????!');
  T2_.Test(1000);
  T2_.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  T1_:=T2.Create;
  T1_.Test(1000);
  T1_.Free;
  T1_:=T3.Create;
  T1_.Test(1000);
  T1_.Free;
  T2_:=T3.Create;
  T2_.Test(1000);
  T2_.Free;
end;

end.
