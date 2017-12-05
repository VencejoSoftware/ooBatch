{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooRunTest;
//{$IFNDEF FPC}
{$APPTYPE CONSOLE}
//{$ENDIF}

interface

uses
  Forms,
{$IFDEF FPC}
  consoletestrunner,
  Interfaces,
{$ifopt D+}
  heaptrc,
{$endif}
{$ELSE}
  Windows,
  TestFramework,
  TestExtensions,
  TextTestRunner,
  AgiledoxTestRunner,
{$ENDIF}
  GuiTestRunner;
{$IFNDEF FPC}
function GetConsoleWindow: HWND; stdcall; external kernel32;
{$ENDIF}
procedure Run(const Title: String = '');

implementation

procedure Run(const Title: String = '');
begin
  if Length(Title) < 1 then
    Application.Title := 'FPC/Delphi tests'
  else
    Application.Title := Title;
  Application.Initialize;
{$IFDEF FPC}
{$ifopt D+}
  SetHeapTraceOutput('heaptrace.log');
{$endif}
  if ParamCount > 0 then
  begin
    with TTestRunner.Create(Application) do
      try
        Run;
      finally
        Free;
      end;
  end
  else
  begin
    Application.CreateForm(TGuiTestRunner, TestRunner);
    Application.Run;
  end;
{$ELSE}
{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := (DebugHook <> 0);
{$WARN SYMBOL_PLATFORM ON}
  if ParamCount > 0 then
  begin
    with AgiledoxTestRunner.RunRegisteredTests(mnpUnderscore, cnpPrefix, rxbContinue) do
      Free;
  end
  else
  begin
    ShowWindow(GetConsoleWindow, SW_HIDE);
    GuiTestRunner.RunRegisteredTests;
  end;
{$ENDIF}
end;

end.
