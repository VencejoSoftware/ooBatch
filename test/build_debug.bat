if not exist build\ (
  @echo "Creating build path..."
  mkdir build\
)

@echo "Running ambient vars..."
if exist "C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\bin\" (
  @echo Building with Delphi 2010...
  call "C:\Program Files (x86)\Embarcadero\RAD Studio\7.0\bin\rsvars.bat"
  MSBuild %1 /t:Clean;Build /p:config=Debug d2010\tests.dproj
)

if exist "C:\Program Files (x86)\Embarcadero\Studio\16.0\bin\rsvars.bat" (
  @echo Building with Delphi XE8...
  call "C:\Program Files (x86)\Embarcadero\Studio\16.0\bin\rsvars.bat"
  MSBuild %1 /t:Clean;Build /p:config=Debug XE8\tests.dproj
)