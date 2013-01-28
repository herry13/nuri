#!/bin/bash

MASTER="nena.inf.ed.ac.uk"

echo "Installing required softwares and libraries..."
sudo apt-get -y update
sudo apt-get -y install make ruby ruby-dev rubygems libz-dev libaugeas-ruby
sudo gem install webrick json antlr3
echo "...OK"

echo "Download Nuri binaries..."
/usr/bin/wget -O nuri.tgz -o /dev/null https://github.com/herry13/nuri/tarball/master
echo "...OK"

if [ -f "nuri.tgz" ]; then
	# extract
	/bin/tar xvf nuri.tgz
	# locate the directory, rename it, then change current directory
	DIR=`/bin/ls | grep 'herry13-nuri'`
	mv $DIR nuri
	cd nuri

	echo -n "Setup configuration file..."
	cp etc/nuri-template.sfp etc/nuri.sfp
	sed -i 's/^\s*trusted.*/\ttrusted is \("__MASTER__"\)/g' etc/nuri.sfp
	sed -i "s/__MASTER__/$MASTER/g" etc/nuri.sfp
	echo "...OK"
fi