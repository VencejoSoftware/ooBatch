echo "Cleaning folders..."
find . -type d -name "lib" -exec rm -r "{}" \;
find . -type d -name "backup" -exec rm -r "{}" \;
find . -type d -name "build/debug" -exec rm -r "{}" \;
find . -type d -name "build/release" -exec rm -r "{}" \;

find . -name \*.html -type f -delete
find . -name \*.a -type f -delete
find . -name \*.so -type f -delete
find . -name \*.ppu -type f -delete
find . -name \*.map -type f -delete
find . -name \*.o -type f -delete
find . -name \*.or -type f -delete
find . -name \*.compiled -type f -delete
find . -name \*.log -type f -delete
find . -name \*.~* -type f -delete
find . -name \link.res -type f -delete