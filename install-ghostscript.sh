#!/bin/bash

wget http://downloads.ghostscript.com/public/ghostscript-9.10.tar.gz -O ghostscript.tgz
tar xfvz ghostscript.tgz
cd ghostscript-*/
./configure
make -j4
make install
cd ..
