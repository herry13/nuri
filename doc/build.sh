#!/bin/sh

type yardoc > /dev/null 2>&1 || { echo >&2 "'yard' is not available. Please install it using: gem install yard"; exit 1; }

yardoc -o doc --exclude SFP* ../{bin,lib,modules}/** - ../README.md ../LICENSE
