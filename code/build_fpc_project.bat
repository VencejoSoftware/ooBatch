@echo off

setlocal EnableDelayedExpansion
set path_project=%1%
set project=%2%
set config_mode=%3%
set project_path=Lazarus
set fpc_path=C:\lazarus\

%fpc_path%\lazbuild --build-mode=%config_mode% "%path_project%\!project_path!\%project%" --build-all