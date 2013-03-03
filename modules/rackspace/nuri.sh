#!/bin/bash

TRUSTED="$1"
CLOUD="$2"
NURI_VERSION="master"

echo "Installing required softwares and libraries..."
sudo apt-get -y update
sudo apt-get -y install make gcc
sudo apt-get -y update
sudo apt-get -y install make gcc
sudo apt-get -y update
sudo apt-get -y install make gcc
sudo apt-get -y install ruby ruby-dev rubygems libz-dev libaugeas-ruby
sudo gem install --no-ri --no-rdoc webrick json antlr3
echo "...OK"

echo "Download Nuri binaries..."
/usr/bin/wget -O nuri.tgz -o /dev/null https://github.com/herry13/nuri/tarball/$NURI_VERSION
echo "...OK"

if [ -f "nuri.tgz" ]; then
	# extract
	/bin/tar xvf nuri.tgz
	# locate the directory, rename it, then change current directory
	DIR=`/bin/ls | grep 'herry13-nuri'`
	mv $DIR nuri
	cd nuri

	# setup configuration file
	echo -n "Setup configuration file..."
	cp etc/nuri-template.sfp etc/nuri.sfp
	sed -i 's/^\s*trusted.*/\ttrusted is \(__TRUSTED__\)/g' etc/nuri.sfp
	sed -i "s/__TRUSTED__/$TRUSTED/g" etc/nuri.sfp
	sed -i "s/host/virtual_machine is true\n\thost/g" etc/nuri.sfp
	sed -i "s/virtual/oncloud is $CLOUD\n\tvirtual/g" etc/nuri.sfp

	# delete unused file
	cd ..
	rm -f nuri.tgz

	echo "...OK"
fi
