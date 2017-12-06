rem @echo off

setlocal EnableDelayedExpansion

call build_add_system_variable.bat

set path_3rd_party=%delphi3rdParty%

if exist "C:\Program Files (x86)\Embarcadero\Studio\19.0\bin\rsvars.bat" (
  set ide_path="C:\Program Files (x86)\Embarcadero\Studio\19.0\bin"
) else if exist "C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\bin\" (
  set ide_path="C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\bin"
)

if not exist %path_3rd_party%\dxDUnit\ (
  @echo "Clonning dxDUnit..."
  git clone https://github.com/VencejoSoftware/dxDUnit.git %path_3rd_party%\dxDUnit\
)
if not exist %path_3rd_party%\dunit-agiledoxtestrunner\ (
  @echo "Clonning dunit-agiledoxtestrunner..."
  git clone https://github.com/VencejoSoftware/delphi-dunit-agiledoxtestrunner.git %path_3rd_party%\dunit-agiledoxtestrunner\
)
if not exist %path_3rd_party%\CodeCoverage\ (
  @echo "Clonning CodeCoverage..."
  git clone https://github.com/VencejoSoftware/codecoverage.git %path_3rd_party%\CodeCoverage\
)
if not exist %path_3rd_party%\CodeCoverage\CodeCoverage.exe (
  @echo "Running ambient vars..."
  call !ide_path!\rsvars.bat
  @echo "Building CodeCoverage..."
  set current="%cd%"
  cd %path_3rd_party%\CodeCoverage\
  call build.bat
  move build\Win32\CodeCoverage.exe .\
  cd "%current%"
)
if not exist %path_3rd_party%\graphviz\ (
  @echo "graphviz..."
  git clone https://github.com/VencejoSoftware/graphviz.git %path_3rd_party%\graphviz\
)
if not exist %path_3rd_party%\pasdoc\ (
  @echo "pasdoc..."
  git clone https://github.com/VencejoSoftware/pasdoc.git %path_3rd_party%\pasdoc\
)
if not exist %path_3rd_party%\multimarkdown\ (
  @echo "multimarkdown..."
  git clone https://github.com/VencejoSoftware/multimarkdown.git %path_3rd_party%\multimarkdown\
)
