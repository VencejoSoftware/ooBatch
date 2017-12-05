rem @echo off
set path_3rd_party=..\..\..\3rd_party
set path_ooLib=..\..\
set absolute_path_3rd=
set absolute_path_ooLib=

@echo "Registering system variable...".

pushd %path_3rd_party%
set absolute_path_3rd=%CD%
popd

setx delphi3rdParty %absolute_path_3rd% /m

pushd %path_ooLib%
set absolute_path_ooLib=%CD%
popd

setx delphiooLib %absolute_path_ooLib% /m

@SET delphi3rdParty=%absolute_path_3rd%
@SET delphiooLib=%absolute_path_ooLib%
