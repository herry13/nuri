#!/bin/sh

read -p "What is the address of master node? " TRUSTED
TRUSTED="\"$TRUSTED\""

echo "Installing required softwares and libraries..."
sudo apt-get -y update
sudo apt-get -y install ruby1.9.1 ruby1.9.1-dev libz-dev libaugeas-ruby1.9.1
sudo gem install webrick antlr3 json
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

	# setup configuration file
	echo -n "Setup configuration file..."
	cp etc/nuri-template.sfp etc/nuri.sfp
	sed -i 's/^\s*trusted.*/\ttrusted is \(__TRUSTED__\)/g' etc/nuri.sfp
	sed -i "s/__TRUSTED__/$TRUSTED/g" etc/nuri.sfp

	# delete unused file
	cd ..
	rm -f nuri.tgz

	echo "...OK"
fi
