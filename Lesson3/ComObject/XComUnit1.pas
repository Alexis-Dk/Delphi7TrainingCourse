unit XComUnit1;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Windows, ActiveX, Classes, ComObj, ComLibrary_TLB, StdVcl;

type
  TCom1 = class(TTypedComObject, ICom1)
  protected
    function XCom(xn, xk, h: Single): SYSINT; stdcall;
    {Declare ICom1 methods here}
  end;

implementation

uses ComServ;

function TCom1.XCom(xn, xk, h: Single): SYSINT;
begin
   Result:=trunc((xk-xn)/h+1);
end;

initialization
  TTypedComObjectFactory.Create(ComServer, TCom1, Class_Com1,
    ciMultiInstance, tmApartment);
end.
