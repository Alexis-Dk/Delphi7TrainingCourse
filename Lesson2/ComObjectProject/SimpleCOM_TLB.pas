unit SimpleCOM_TLB;

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
// File generated on 23.05.2019 13:48:04 from Type Library described below.

// ************************************************************************  //
// Type Lib: E:\Bntu\delphi7\helloWorld projects\Lesson3\ComObjectProject\SimpleCOM.tlb (1)
// LIBID: {9881A7D3-D575-42B7-8DAD-EA726F783456}
// LCID: 0
// Helpfile: 
// HelpString: SimpleCOM Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
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
  SimpleCOMMajorVersion = 1;
  SimpleCOMMinorVersion = 0;

  LIBID_SimpleCOM: TGUID = '{9881A7D3-D575-42B7-8DAD-EA726F783456}';

  IID_ISmpCom: TGUID = '{6A872EB9-1927-4522-8571-D2C842BC5974}';
  CLASS_SmpCom: TGUID = '{4FAFBAEB-1377-431E-BD30-9EFBF4B79FE4}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  ISmpCom = interface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  SmpCom = ISmpCom;


// *********************************************************************//
// Interface: ISmpCom
// Flags:     (256) OleAutomation
// GUID:      {6A872EB9-1927-4522-8571-D2C842BC5974}
// *********************************************************************//
  ISmpCom = interface(IUnknown)
    ['{6A872EB9-1927-4522-8571-D2C842BC5974}']
    function Tangent(Angle: Double): Double; stdcall;
  end;

// *********************************************************************//
// The Class CoSmpCom provides a Create and CreateRemote method to          
// create instances of the default interface ISmpCom exposed by              
// the CoClass SmpCom. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoSmpCom = class
    class function Create: ISmpCom;
    class function CreateRemote(const MachineName: string): ISmpCom;
  end;

implementation

uses ComObj;

class function CoSmpCom.Create: ISmpCom;
begin
  Result := CreateComObject(CLASS_SmpCom) as ISmpCom;
end;

class function CoSmpCom.CreateRemote(const MachineName: string): ISmpCom;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_SmpCom) as ISmpCom;
end;

end.
