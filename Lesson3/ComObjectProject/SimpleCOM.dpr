library SimpleCOM;

uses
  ComServ,
  SimpleCOM_TLB in 'SimpleCOM_TLB.pas',
  InterfaceUnit in 'InterfaceUnit.pas' {SmpCom: CoClass},
  ComServer in 'ComServer.pas';

exports
  DllGetClassObject,
  DllCanUnloadNow,
  DllRegisterServer,
  DllUnregisterServer;

{$R *.TLB}

{$R *.RES}

begin
end.
