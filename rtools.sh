#!/bin/sh
RCONFIG="/c/Progra~1/R/R-3.4.3/bin/x64/R CMD config"
CXX11="`$RCONFIG CXX11`"
CXX11STD="`$RCONFIG CXX11STD`"
export CXX="$CXX11 $CXX11STD -I/mingw64/include"
export CXXCPP="`$RCONFIG CXXCPP`"
export CXXFLAGS="`$RCONFIG CXXFLAGS`"
export CC="`$RCONFIG CC` -I/mingw64/include"
export CPP="`$RCONFIG CPP` -I/mingw64/include"
export CFLAGS="`$RCONFIG CFLAGS`"

export FFLAGS="`$RCONFIG FFLAGS`"
export F77="`$RCONFIG F77`"
export FC="`$RCONFIG FC`"
export FLIBS="`$RCONFIG FLIBS`"

# Link against mingw64 libs
export CPPFLAGS="-I/mingw64/include"
export LDFLAGS="-L/mingw64/lib"
export LIBS="$LDFLAGS"

# To use 'ar' and stuff from Rtools as well
#RBINPATH=`dirname $CC`
#RBINPATH=`cygpath $RBINPATH`
#export PATH="$RBINPATH:$PATH"
