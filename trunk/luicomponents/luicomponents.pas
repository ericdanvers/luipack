{ This file was automatically created by Lazarus. do not edit!
  This source is only used to compile and install the package.
 }

unit luicomponents; 

interface

uses
LuiConfig, IniConfigProvider, LazarusPackageIntf;

implementation

procedure Register; 
begin
end; 

initialization
  RegisterPackage('luicomponents', @Register); 
end.
