unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
  public
  end;

  T1 = class
  private
  public
    procedure Test(i:integer); virtual;
    procedure Fly; virtual;
    procedure look; virtual;
  end;

  T2 = class(T1)
  private
  public
    procedure Test(i:integer); //override;
    procedure Fly; //override;
    procedure look; override;
    procedure Fly2; virtual;
  end;

  T3 = class(T2)
  private
  public
    procedure Test(i:integer);
    procedure Fly; virtual;
    procedure look; override;
  end;

var
  Form1: TForm1;
  T1_:T1;
  T2_:T2;
  T3_:T3;


implementation

{$R *.dfm}

{ T1 }

procedure T1.Fly;
begin
  ShowMessage('T1.Fly');
end;

procedure T1.look;
begin
  ShowMessage('T1.look');
end;

procedure T1.Test(i: integer);
begin
  ShowMessage('T1.Test(i:integer)');
end;

{ T2 }

procedure T2.Fly;
begin
  ShowMessage('T2.Fly');
end;

procedure T2.Fly2;
begin
  ShowMessage('T2.Fly2');
end;

procedure T2.look;
begin
  ShowMessage('T2.look');
end;

procedure T2.Test(i: integer);
begin
  ShowMessage('T2.Test(i:integer)');
end;

{ T3 }

procedure T3.Fly;
begin
  ShowMessage('T3.Fly');
end;

procedure T3.look;
begin
  ShowMessage('T3.look');
end;

procedure T3.Test(i: integer);
begin
  ShowMessage('T3.Test(i:integer)');
end;

procedure TForm1.Button1Click(Sender: TObject);
type
  TVMT = array[0..100] of pointer;
  GoProc = procedure(Obj:T1);

var
  pVMT:^TVMT;
  pMethod:pointer;
  pObj:pointer;
  i,j,k,sum:integer;

begin
  Memo1.Clear;
  T1_:=T1.Create;
  pObj:=pointer(T1_);
  pVMT:=pointer(pObj^);
  //pMethod:=pVMT^[0];

  Memo1.Lines.Add('pVMT ????????? ?? VMT ?????? ?????? ' + TObject(pObj).ClassName);
  Memo1.Lines.Add('????? ??????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[0])));
  Memo1.Lines.Add('????? ??????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[1])));
  Memo1.Lines.Add('????? ???????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[2])));
  Memo1.Lines.Add('');
  //GoProc(pMethod)(T1_);

  T2_:=T2.Create;
  pObj:=pointer(T2_);
  pVMT:=pointer(pObj^);
  Memo1.Lines.Add('pVMT ????????? ?? VMT ?????? ?????? ' + TObject(pObj).ClassName);
  Memo1.Lines.Add('????? ??????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[0])));
  Memo1.Lines.Add('????? ??????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[1])));
  Memo1.Lines.Add('????? ???????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[2])));
  Memo1.Lines.Add('????? ?????????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[3])));
  Memo1.Lines.Add('');

  FreeAndNil(T1_);
  FreeAndNil(T2_);

end;

procedure TForm1.Button2Click(Sender: TObject);
type
  TVMT = array[0..100] of pointer;
  GoProc = procedure(Obj:T1);

var
  pVMT:^TVMT;
  pMethod:pointer;
  pObj:pointer;
  i,j,k,sum:integer;

begin
  T3_:=T3.Create;
  pObj:=pointer(T3_);
  pVMT:=pointer(pObj^);
  //pMethod:=pVMT^[0];

  Memo1.Lines.Add('pVMT ????????? ?? VMT ?????? ?????? ' + TObject(pObj).ClassName);
  Memo1.Lines.Add('????? ??????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[0])));
  Memo1.Lines.Add('????? ??????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[1])));
  Memo1.Lines.Add('????? ???????? ?????? ? VMT ????? ' + #9 + IntToStr(longword(pVMT^[2])));
  Memo1.Lines.Add('');

  FreeAndNil(T3_);
end;

procedure TForm1.Button3Click(Sender: TObject);
type GoProc = procedure(Obj:TObject);
var pMethod:pointer;
begin
  pMethod:=addr(T3.Test);
  Memo1.Lines.Add('????? ???????????? ?????? ????? ' + #9 + IntToStr(longword(pMethod)));
  T3_:=T3.Create;
  GoProc(pMethod)(T3_);
  T1(T3_).Test(1);
  FreeAndNil(T3_);
end;

end.
