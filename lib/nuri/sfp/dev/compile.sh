#!/bin/sh

cd dev
antlr4ruby SFP.g
cp SFPParser.rb ..
cp SFPLexer.rb ..
cd ..
