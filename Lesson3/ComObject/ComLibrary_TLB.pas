unit ComLibrary_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 01.06.2010 23:25:23 from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\Documents and Settings\�����\������� ����\����� ������ � ������ �����������311(���������)\ComObject\ComLibrary.tlb (1)
// LIBID: {A0E4A220-A57D-4856-A35B-E151C3387E38}
// LCID: 0
// Helpfile: 
// HelpString: ComLibrary Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\system32\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  ComLibraryMajorVersion = 1;
  ComLibraryMinorVersion = 0;

  LIBID_ComLibrary: TGUID = '{A0E4A220-A57D-4856-A35B-E151C3387E38}';

  IID_ICom1: TGUID = '{DCF85656-9447-44DF-9E31-AE6AA2958D82}';
  CLASS_Com1: TGUID = '{D17A4066-376F-4F1B-865E-B3C6E30B98FF}';
  IID_ICom2: TGUID = '{C0841A01-6867-4E99-9647-8E21312633E6}';
  CLASS_Com2: TGUID = '{C22F16A6-346D-45EE-AA9A-D30FDDD78C74}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ICom1 = interface;
  ICom2 = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  Com1 = ICom1;
  Com2 = ICom2;


// *********************************************************************//
// Interface: ICom1
// Flags:     (256) OleAutomation
// GUID:      {DCF85656-9447-44DF-9E31-AE6AA2958D82}
// *********************************************************************//
  ICom1 = interface(IUnknown)
    ['{DCF85656-9447-44DF-9E31-AE6AA2958D82}']
    function XCom(xn: Single; xk: Single; h: Single): SYSINT; stdcall;
  end;

// *********************************************************************//
// Interface: ICom2
// Flags:     (256) OleAutomation
// GUID:      {C0841A01-6867-4E99-9647-8E21312633E6}
// *********************************************************************//
  ICom2 = interface(IUnknown)
    ['{C0841A01-6867-4E99-9647-8E21312633E6}']
    function FCom(xr: Single; yr1: Single; yr2: Single; yr3: Single): Single; stdcall;
  end;

// *********************************************************************//
// The Class CoCom1 provides a Create and CreateRemote method to          
// create instances of the default interface ICom1 exposed by              
// the CoClass Com1. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCom1 = class
    class function Create: ICom1;
    class function CreateRemote(const MachineName: string): ICom1;
  end;

// *********************************************************************//
// The Class CoCom2 provides a Create and CreateRemote method to          
// create instances of the default interface ICom2 exposed by              
// the CoClass Com2. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoCom2 = class
    class function Create: ICom2;
    class function CreateRemote(const MachineName: string): ICom2;
  end;

implementation

uses ComObj;

class function CoCom1.Create: ICom1;
begin
  Result := CreateComObject(CLASS_Com1) as ICom1;
end;

class function CoCom1.CreateRemote(const MachineName: string): ICom1;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Com1) as ICom1;
end;

class function CoCom2.Create: ICom2;
begin
  Result := CreateComObject(CLASS_Com2) as ICom2;
end;

class function CoCom2.CreateRemote(const MachineName: string): ICom2;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Com2) as ICom2;
end;

end.
