if [ ! -d "build" ]; then
  mkdir /build
fi

fpc -MObjFPC -B -g -Xm -Cr -CR -va -Fu../../code/;../../../3rd_party/dunit-agiledoxtestrunner/;../../../3rd_party/dcpcrypt/;../../../3rd_party/dcpcrypt/Ciphers/;../../../3rd_party/dcpcrypt/Hashes/;../../../ooGeneric/code/;../code/ -FU./dcu/ -o./Build/ lazarus/tests.lpr
