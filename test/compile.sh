if [ ! -d "build" ]; then
  mkdir /build
fi

fpc ../lazarus/tests.lpr @../../../ooBatch/test/compile_tests.cfg

