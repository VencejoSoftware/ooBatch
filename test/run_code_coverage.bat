if not exist build\debug\tests.exe (
  @echo "Building test..."
  call build_debug.bat
)

@echo "Running code coverage tool..."
..\..\3rd_party\CodeCoverage\CodeCoverage.exe -e build\debug\tests.exe -a consoles -m build\debug\tests.map -ife -uf code_coverage_units.lst -spf code_coverage_paths.lst -od build\output\coverage\ -lt build\output\coverage\coverage.log -emma -meta -html -xml -v
@echo Code coverage results in build\output\coverage\CodeCoverage_summary.html