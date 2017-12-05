@echo off
@echo "Building documentation..."

set path_doc=..\doc\

@echo "Deleting old files..."
rmdir /s/q %path_doc%\
mkdir "%path_doc%"

set path_3rdparty=%delphi3rdParty%
set path_pasdoc=%path_3rdparty%\pasdoc\bin
set path_graphviz=%path_3rdparty%\Graphviz\bin

if "%1"=="" (
  set app_title="ooLib"
) else if not "%1"=="" (
  set app_title="%1"
)

@echo "Creating used units files..."
dir ..\code\*.pas /S /B > pas_doc_files.txt

@echo "Build introduction..."
call %delphiooLib%"\ooBatch\code\build_readme_html.bat" ..\ introduction.html

echo @html( > %path_doc%introduction.txt
type introduction.html >> %path_doc%introduction.txt
echo ) >> %path_doc%introduction.txt
del introduction.html

@echo "Building documentation..."
call %path_pasdoc%\pasdoc ^
  --link-gv-uses svg ^
  --link-gv-classes svg ^
  --graphviz-uses ^
  --graphviz-classes ^
  --visible-members protected,public,private,published,automated ^
  --output=%path_doc% ^
  --write-uses-list ^
  --source pas_doc_files.txt ^
  --title %app_title% ^
  --introduction %path_doc%introduction.txt ^
  --language=es ^
  --use-tipue-search ^
  --include-creation-time

del %path_doc%introduction.txt

@echo "Creating SVG class map..."
call %path_graphviz%\fdp ^
  -Tsvg %path_doc%GVClasses.dot ^
  -o %path_doc%GVClasses.svg

@echo "Creating SVG units map..."
call %path_graphviz%\dot ^
  -Grankdir=LR -Tsvg %path_doc%GVUses.dot ^
  -o %path_doc%GVUses.svg

del pas_doc_files.txt