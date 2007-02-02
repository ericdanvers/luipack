unit ATViewerMsg;

interface

uses
  Windows;

function MsgBox(const Msg, Title: WideString; Flags: integer; h: THandle = INVALID_HANDLE_VALUE): integer;
procedure MsgInfo(const Msg: WideString; h: THandle = INVALID_HANDLE_VALUE);
procedure MsgError(const Msg: WideString; h: THandle = INVALID_HANDLE_VALUE);

var
  ATViewerMessagesEnabled: boolean = true;

var
  MsgViewerCaption: string = 'Viewer';
  MsgViewerErrCannotFindFile: string = 'File not found: %s';
  MsgViewerErrCannotOpenFile: string = 'Cannot open file: %s';
  MsgViewerErrCannotLoadFile: string = 'Cannot load file: %s';
  MsgViewerErrCannotReadFile: string = 'Cannot read file: %s';
  MsgViewerErrCannotReadStream: string = 'Cannot read stream';
  MsgViewerErrCannotReadPos: string = 'Read error at offset %s';
  MsgViewerErrImage: string = 'Unknown image format';
  MsgViewerErrMedia: string = 'Unknown multimedia format';
  MsgViewerErrMediaWMP: string = 'Cannot initialize Windows Media Player %s ActiveX';
  MsgViewerErrCannotCopyData: string = 'Cannot copy data to Clipboard';
  MsgViewerWlxException: string = 'Exception in plugin %s in function %s';
  MsgViewerWlxCannotUnload: string = 'Cannot unload plugin %s';
  MsgViewerWlxParentNotSpecified: string = 'Cannot load plugins: parent form not specified';


implementation

uses
  SysUtils, Forms;

function MsgBox(const Msg, Title: WideString; Flags: integer; h: THandle = INVALID_HANDLE_VALUE): integer;
begin
  if not ATViewerMessagesEnabled then
    begin Result:= IDCANCEL; Exit end;

  if h=INVALID_HANDLE_VALUE then
    h:= Application.Handle;

  if Win32Platform=VER_PLATFORM_WIN32_NT
    then Result:= MessageBoxW(h, PWChar(Msg), PWChar(Title), Flags or MB_SETFOREGROUND)
    else Result:= MessageBoxA(h, PChar(string(Msg)), PChar(string(Title)), Flags or MB_SETFOREGROUND);
end;

procedure MsgInfo(const Msg: WideString; h: THandle = INVALID_HANDLE_VALUE);
begin
  MsgBox(Msg, MsgViewerCaption, MB_OK or MB_ICONINFORMATION, h);
end;

procedure MsgError(const Msg: WideString; h: THandle = INVALID_HANDLE_VALUE);
begin
  MsgBox(Msg, MsgViewerCaption, MB_OK or MB_ICONERROR, h);
end;

end.
