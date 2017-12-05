@echo off

setlocal EnableDelayedExpansion
set path_project=%1%
set project=%2%
set config_mode=%3%

if exist "C:\Program Files (x86)\Embarcadero\Studio\19.0\bin\rsvars.bat" (
  set ide_path="C:\Program Files (x86)\Embarcadero\Studio\19.0\bin"
  set project_path=XE10
) else if exist "C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\bin\" (
  set ide_path="C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\bin"
  set project_path=d2010
)

@echo "Running ambient vars..."
call !ide_path!\rsvars.bat

call "..\..\ooBatch\code\build_add_system_variable.bat"

@echo Building with Delphi !project_path!...
call MSBuild /t:Clean;Build /p:config=%config_mode% "%path_project%\!project_path!\%project%"