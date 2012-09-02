#!/bin/sh

BASE_DIR=$(cd "$(dirname "$0")"; pwd)
CURRENT_DIR=`pwd`

cd $BASE_DIR
ruby ./extconf.rb
make
make install
make clean 
cd $CURRENT_DIR
