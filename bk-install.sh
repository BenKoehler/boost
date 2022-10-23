#!/bin/bash
cd ..
mv boost/ boost-src/
#remove previous installation
rm -r boost
mkdir boost
cd boost-src
./bootstrap.sh --without-icu
./b2 clean
./b2 headers
./b2 \
-j8 \
--disable-icu \
--ignore-site-config \
--prefix=../boost \
--layout=system \
variant=release \
threading=multi \
cxxflags="-fPIC -std=c++17 -O3" \
link=shared \
-sZLIB_INCLUDE=../zlib/include \
-sZLIB_LIBPATH=../zlib/lib \
install
cd ..
cp boost-src/bk.cmake boost
