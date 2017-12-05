if not exist build\release\tests.exe (
  @echo "Building test..."
  call build_release.bat
)

if not exist build\output\ (
  @echo "Creating output path..."
  mkdir build\output\
)

@echo "Running tests..."
build\release\tests.exe /console > build\output\test_result.log

@echo "Test results in build\output\test_result.log"
