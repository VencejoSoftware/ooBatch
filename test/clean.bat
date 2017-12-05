call ..\..\ooBatch\general\clean.bat

for /r %1 %%R in (debug) do if exist "%%R" (rd /s /q "%%R")
for /r %1 %%R in (release) do if exist "%%R" (rd /s /q "%%R")
for /r %1 %%R in (output) do if exist "%%R" (rd /s /q "%%R")