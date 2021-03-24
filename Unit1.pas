unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TA = class
  public
    procedure show; virtual;
  end;

  TB = class(TA)
  public
    procedure show; override;
  end;

  TC = class(TB)
  public
    procedure show; override;
  end;

  TD = class(TC)
  public
    procedure show; reintroduce; override;
  end;

  TE = class(TD)
  public
    procedure show; override;
  end;

  TF = class(TE)
  public
    procedure show; virtual;
  end;

  TG = class(TF)
  public
    procedure show; override;
  end;

var
  Form1: TForm1;
  A:TA;
  B:TB;
  C:TC;
  D:TD;
  E:TE;
  F:TF;
  G:TG;

implementation

{$R *.dfm}

{ TA }

procedure TA.show;
begin
  ShowMessage('TA.show');
end;

{ TB }

procedure TB.show;
begin
  ShowMessage('TB.show');
end;

{ TC }

procedure TC.show;
begin
  ShowMessage('TC.show');
end;

{ TD }

procedure TD.show;
begin
  ShowMessage('TD.show');
end;

{ TE }

procedure TE.show;
begin
  ShowMessage('TE.show');
end;

{ TF }

procedure TF.show;
begin
  ShowMessage('TF.show');
end;

{ TG }

procedure TG.show;
begin
  ShowMessage('TG.show');
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  A:=TA.Create; A.show; A.Free;
  A:=TB.Create; A.show; A.Free;
  A:=TC.Create; A.show; A.Free;
  A:=TD.Create; A.show; A.Free;
  A:=TE.Create; A.show; A.Free;
  A:=TF.Create; A.show; A.Free;
  A:=TG.Create; A.show; A.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  B:=TB.Create; B.show; B.Free;
  B:=TC.Create; B.show; B.Free;
  B:=TD.Create; B.show; B.Free;
  B:=TE.Create; B.show; B.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  A:=TA.Create; A.show; A.Free;
  A:=TB.Create; A.show; A.Free;
  A:=TC.Create; A.show; A.Free;
  A:=TD.Create; A.show; A.Free;
  A:=TE.Create; A.show; A.Free;
  D:=TD.Create; D.show; D.Free;
  D:=TE.Create; D.show; D.Free;
  D:=TF.Create; D.show; D.Free;
  D:=TG.Create; D.show; D.Free;
end;

end.
