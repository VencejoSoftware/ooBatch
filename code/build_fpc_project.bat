@echo off

setlocal EnableDelayedExpansion
set path_project=%1%
set project=%2%
set config_mode=%3%
set project_path=Lazarus
set fpc_path=C:\lazarus\

call "..\..\ooBatch\code\build_add_system_variable.bat"

%fpc_path%\lazbuild --build-mode=%config_mode% "%path_project%\!project_path!\%project%"
  --build-all
  --os=win32
  --cpu=i386
