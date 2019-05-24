unit UComRiad;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
Windows, ActiveX, Classes, ComObj, Chart, Grids, Math, SysUtils, IniFiles,
UCom_Tlb, ExtCtrls, Messages;

type
TRiad = class(TComObject, IComRiad)
protected
IniFile : TIniFile; //������ Ini-�����
w : integer;
arr: Dat_Ar;//������ ��� �������� �������� ������� � ������

public
Procedure Create(AIniFileName : string); stdcall;
Destructor Destroy;
procedure Graphic(AChart:TChart); stdcall; //��������� �������
procedure Table(AStringGrid:TStringGrid); stdcall; //����� � �������
procedure WriteToIniFile; stdcall; //������ � Ini-����
procedure ReadFromIniFile; stdcall; //������ �� Ini-�����

function GetW : integer; stdcall; //�������� w
procedure SetW; stdcall; //���������� w

procedure buildTable(AStringGrid:TStringGrid; res_Ar:Dat_Ar); stdcall; //��������� ������
procedure buildGraphic(AChart:TChart; res_Ar:Dat_Ar); stdcall; //��������� �������
function selectedOption(x, y: real): real;
function method_ejlera(a, b, y0, h: real; n: integer): Dat_Ar; stdcall;//������� �����
function mmethod_ejlera(a, b, y0, h: real; n: integer): Dat_Ar; stdcall;//���������������� �����

private

end;

implementation

uses ComServ, Dialogs, Graphics, UnitMain;
const P=500;
const x=1;
const TimeStart=0; //����� ������ �������
const TimeEnd=100; //����� ��������� �������
const TimeStep=0.5; //��� ������������� �������

Procedure TRiad.Create(AIniFileName : string);
begin
//������� ������ Ini-�����
IniFile:= TIniFile.Create(AIniFileName);
end;//TRod.Create

Destructor TRiad.Destroy;
begin //�� ������������
//������� �� Heap ������ Ini-�����
if Assigned(IniFile) then
begin
IniFile.Free;
IniFile:= NIL;
end;
end;//TRod.Create



procedure TRiad.Graphic(AChart : TChart);
//���������� �������
var
time : extended;
Y1, Y2 : extended;
begin
Time:= TimeStart;
AChart.Series[0].Clear; //�������� Series[0]
AChart.Series[1].Clear; //�������� Series[1]
AChart.BottomAxis.Increment:= Floor((TimeEnd - TimeStart) / 5);
//������� �������� � Series
while(time <= TimeEnd) do
begin

AChart.Series[0].AddXY(time, Y1);
AChart.Series[1].AddXY(time, Y2);
time:= time + TimeStep / 4;
end;
end;//TRiad.Graphic



procedure TRiad.Table(AStringGrid : TStringGrid);
//����� ���������� � �������
var
k : integer;
time : extended;
y: extended;
begin
k:= 0;
time:= TimeStart;

while (time <= TimeEnd) do
begin
inc(k);

//Form1.StringGrid1.Cells[2,k]:= FloatToStrF(y , ffFixed, 5, 3);
time:= time + TimeStep;
end;
end;//TRiad.Table

procedure TRiad.WriteToIniFile;
//������ � Ini-����
begin
IniFile.WriteInteger('Parameters', 'W', W);
IniFile.UpdateFile;//������� ������ � ������ ����� �� ����
end;//TRiad.WriteToIniFile

procedure TRiad.ReadFromIniFile;
//������ �� Ini-�����
begin
W:= IniFile.ReadInteger('Parameters', 'W', w);
end;//TRiad.ReadFromIniFile

function TRiad.GetW :integer;
begin
 result:= W;
end;//TRiad.GetW

procedure TRiad.SetW;
begin
if Form1.RadioGroup1.ItemIndex=-1 then
    MessageDlg(Pchar('�� ������� �������� w!!!'),mtError,[mbOk],0);
 if Form1.RadioGroup1.ItemIndex =0 then
  begin
  //Form1.Label10.Caption:='1';
  w:=1;
  end
 else if Form1.RadioGroup1.ItemIndex =1 then
  begin
  //Form1.label10.Caption:='3';
  w:=3;
   end
  else
  begin
  //Form1.label10.Caption:='5';
  w:=5;
  end ;
 end;//TRiad.SetW

procedure TRiad.buildTable(AStringGrid:TStringGrid; res_Ar:Dat_Ar);
//���������� ����
var
  j: integer;
begin

end;//TRiad.Graphic1

procedure TRiad.buildGraphic(AChart :TChart; res_Ar:Dat_Ar);
//���������� �������
var
  i,n: integer;
begin
    AChart.Series[0].Clear; //�������� Series[0]
    //res_Ar := method_ejlera(a, b, y0, h,n);
    //��������� ������� �� ������������� ������� � �������� �
    //������������� ����� ����� ��� ���������� �������
    for i := 1 to round(res_Ar[0, 1]) do
      begin
        AChart.Series[0].AddXY(res_Ar[i, 1], res_Ar[i, 2]);
      end;
end;//TRiad.Graphic1

 //����������� ������� ���������������� ���������
function TRiad.selectedOption(x, y: real): real;
begin
     //�������� �������� ��������� �������
     //f := x + cos(y/sqrt(5));
     //f:= x + exp(x) - 1;
     selectedOption:=exp(x)+sin(x)-sqrt(x);
end;

//������� ����� ������
function TRiad.method_ejlera(a, b, y0, h: real; n: integer): Dat_Ar;
 var
  xn: real;
  res_Ar: Dat_Ar;
  i: integer;
begin
     i := 1;
     res_Ar[1, 1] := a;
     res_Ar[1, 2] := y0;
     xn := a + h;
     while (xn <= b) do
       begin
         i := i + 1;
         res_Ar[i, 1] := res_Ar[i-1, 1] + h;
         res_Ar[i, 2] := res_Ar[i-1, 2] + h * selectedOption(res_Ar[i-1, 1], res_Ar[i-1, 2]);
         xn := xn + h;
       end;
    res_Ar[0, 1] := i;
    method_ejlera := res_Ar;
end;

//���������������� ����� ������
function TRiad.mmethod_ejlera(a, b, y0, h: real; n: integer): Dat_Ar;
var
  xn,xr,yr: real;
  res_Ar: Dat_Ar;
  i: integer;
begin
     i := 1;
     res_Ar[1, 1] := a;
     res_Ar[1, 2] := y0;
     xn := a + h;
     while (xn <= b) do
       begin
         i := i + 1;
         //��������� ������ �������� �������� �� �������� ������
         xr:= res_Ar[i-1, 1] + h/2;//����������� ��������� �����
         //������ �������� ������� � ���� �����
         yr:= res_Ar[i-1, 2] + (h/2) * selectedOption(res_Ar[i-1, 1], res_Ar[i-1, 2]);
         //������ � ��������� ����� �������� � ������
         res_Ar[i, 1] := res_Ar[i-1, 1] + h;
         //� ���� ������� ������ ������� ����� ����������� �������� � ���������� �����
         res_Ar[i, 2] := res_Ar[i-1, 2] + h * selectedOption(xr, yr);
         xn := xn + h;
       end;
    res_Ar[0, 1] := i;
    mmethod_ejlera := res_Ar;
end;

initialization
TComObjectFactory.Create(ComServer, TRiad, Class_ServerRiad,
'ServerRiad', '', ciMultiInstance, tmApartment);
end.

