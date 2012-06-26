#!/bin/sh

DIR=`pwd`
cd $1
ruby extconf.rb
make
make install
make clean 
cd $DIR
