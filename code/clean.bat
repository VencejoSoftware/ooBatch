@echo off
@echo "Cleaning folders..."

set path_code=%1%

for /d /r %path_code%\ %%R in (__history) do if exist "%%R" (rd /s /q "%%R")
for /d /r %path_code%\ %%R in (backup) do if exist "%%R" (rd /s /q "%%R")
for /d /r %path_code%\ %%R in (lib) do if exist "%%R" (rd /s /q "%%R")
for /d /r %path_code%\ %%R in (build\debug) do if exist "%%R" (rd /s /q "%%R")
for /d /r %path_code%\ %%R in (build\release) do if exist "%%R" (rd /s /q "%%R")
for /d /r %path_code%\ %%R in (build) do if exist "%%R" (rd /s /q "%%R")
for /d /r %path_code%\ %%R in (tipuesearch) do if exist "%%R" (rd /s /q "%%R")

del /s %path_code%\test_result.txt
del /s %path_code%\*.ec
del /s %path_code%\*.em
del /s %path_code%\*.xml
del /s %path_code%\*.html
del /s %path_code%\*.exe
del /s %path_code%\*.drc
del /s %path_code%\*.map
del /s %path_code%\*.dll
del /s %path_code%\*.dcu
del /s %path_code%\*.bpl
del /s %path_code%\*.~*
del /s %path_code%\*.ddp
del /s %path_code%\*.ddp
del /s %path_code%\*.log
del /s %path_code%\*.stat
del /s %path_code%\*.identcache
del /s %path_code%\*.dproj.local
del /s %path_code%\*.bak
del /s %path_code%\*.o
del /s %path_code%\*.ppu
del /s %path_code%\*.dot
del /s %path_code%\*.gif
del /s %path_code%\*.svg
del /s %path_code%\*.css
del /s %path_code%\*.o
del /s %path_code%\*.ppu
del /s %path_code%\*.map
