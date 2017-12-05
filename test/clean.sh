# cleaning...
sh ../../ooBatch/general/clean.sh

find . -type d -name "debug" -exec rm -r "{}" \;
find . -type d -name "release" -exec rm -r "{}" \;
find . -type d -name "output" -exec rm -r "{}" \;
