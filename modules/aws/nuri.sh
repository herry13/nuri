#!/bin/bash

TRUSTED="$1"
CLOUD="$2"
NURI_VERSION="master"


##### SET HOSTNAME #####
SCRIPT="/etc/ec2-hostname.sh"
echo "USER_DATA=$3" >> $SCRIPT
echo 'HOSTNAME=`echo $USER_DATA`' >> $SCRIPT
echo 'IPV4=`/usr/bin/curl -s http://169.254.169.254/latest/meta-data/public-ipv4`' >> $SCRIPT
echo 'hostname $HOSTNAME' >> $SCRIPT
echo 'echo $HOSTNAME > /etc/hostname' >> $SCRIPT
echo 'cat<<EOF > /etc/hosts' >> $SCRIPT
echo '127.0.0.1 localhost' >> $SCRIPT
echo '$IPV4 $HOSTNAME' >> $SCRIPT
echo '::1 ip6-localhost ip6-loopback' >> $SCRIPT
echo 'fe00::0 ip6-localnet' >> $SCRIPT
echo 'ff00::0 ip6-mcastprefix' >> $SCRIPT
echo 'ff02::1 ip6-allnodes' >> $SCRIPT
echo 'ff02::2 ip6-allrouters' >> $SCRIPT
echo 'ff02::3 ip6-allhosts' >> $SCRIPT
echo 'EOF' >> $SCRIPT
chmod +x $SCRIPT
echo "/bin/sh $SCRIPT" > /etc/rc.local

$SCRIPT


##### NURI Installation #####
echo "Installing required softwares and libraries..."
sudo apt-get -y update
sudo apt-get -y install make gcc
sudo apt-get -y update
sudo apt-get -y install make gcc
sudo apt-get -y update
sudo apt-get -y install make gcc
sudo apt-get -y install ruby ruby-dev rubygems libz-dev libaugeas-ruby
gem install --no-ri --no-rdoc webrick json antlr3
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

