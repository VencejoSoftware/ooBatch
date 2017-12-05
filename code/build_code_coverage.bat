rem @echo off

set path_3rd_party=%delphi3rdParty%\
set path_code=..\code\
set path_project=%1%
set binary=%2%

@echo "Recreating dependencies paths...".
del %path_project%\code_coverage_paths.lst
for /d /r %path_code% %%R in (*) do (
  echo %%R>>%path_project%\code_coverage_paths.lst
)
rem relative path to absolute
for %%A in ("%path_code%") do echo %%~dpA>>%path_project%\code_coverage_paths.lst
for %%A in ("..\build\debug\") do echo %%~dpA>>%path_project%\code_coverage_paths.lst

@echo "Recreating unit name from filenames..."
del %path_project%\code_coverage_units.lst
for /d /r %path_code% %%R in (*) do (
  for %%a in (%%R\*.pas) do @echo %%~na>>%path_project%\code_coverage_units.lst
)
for %%a in (%path_code%*.pas) do @echo %%~na>>%path_project%\code_coverage_units.lst

@echo "Running code coverage tool..."
call %path_3rd_party%\CodeCoverage\CodeCoverage.exe ^
  -e %path_project%\build\debug\%binary% ^
  -a console ^
  -ife ^
  -od %path_project%\coverage\ ^
  -lt %path_project%\coverage\coverage.log ^
  -spf %path_project%\code_coverage_paths.lst ^
  -uf %path_project%\code_coverage_units.lst ^
  -emma ^
  -meta ^
  -html ^
  -xml ^
  -v

@echo Code coverage results in %path_project%\coverage\CodeCoverage_summary.html
rem  -m C:\SVN\3rd_party\ooLib\ooAppInfo\test\build\debug\test.map ^

del %path_project%\code_coverage_paths.lst
del %path_project%\code_coverage_units.lst
