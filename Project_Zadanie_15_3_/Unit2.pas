unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Unit1, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button2: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

 TSecondClass2 = class(TFirstClass)
 public
   procedure access;
 end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ TSecondClass2 }

procedure TSecondClass2.access;
begin
  //priv:=1;
  publ:='publ';
  prot:=100.123;
end;

end.
