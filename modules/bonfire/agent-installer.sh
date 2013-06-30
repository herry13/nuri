#!/bin/bash

setup_configuration_file() {
	# setup configuration file
	echo -n "Setup configuration file..."
	CONFIG_FILE="$1/etc/nuri.sfp"
	if [ -f "$CONFIG_FILE" ]; then
		# backup existing file
		mv $CONFIG_FILE "$CONFIG_FILE.bak"
	fi
	cp "$1/etc/nuri-template.sfp" $CONFIG_FILE
	sed -i 's/^\s*trusted.*/\ttrusted is \(__TRUSTED__\)/g' $CONFIG_FILE
	sed -i "s/__TRUSTED__/$TRUSTED/g" $CONFIG_FILE
	echo "OK"
}

setup_init_script() {
	echo -n "Setup v init script..."
	INIT_FILE="$1/bin/nuri-init"
	DAEMON="$1/bin/nuri-client"
	DAEMON=${DAEMON//\//\\\/}
	sudo cp $INIT_FILE /etc/init.d/nuri
	sudo sed -i "s/^DAEMON=.*/DAEMON=\"$DAEMON\"/" /etc/init.d/nuri
	HOME=${1//\//\\\/}
	sudo sed -i "s/^HOME=.*/HOME=\"$HOME\"/" /etc/init.d/nuri
	cd /etc/rc0.d; sudo ln -sf ../init.d/nuri K30nuri
	cd /etc/rc1.d; sudo ln -sf ../init.d/nuri K30nuri
	cd /etc/rc2.d; sudo ln -sf ../init.d/nuri S30nuri
	cd /etc/rc3.d; sudo ln -sf ../init.d/nuri S30nuri
	cd /etc/rc4.d; sudo ln -sf ../init.d/nuri S30nuri
	cd /etc/rc5.d; sudo ln -sf ../init.d/nuri S30nuri
	cd /etc/rc6.d; sudo ln -sf ../init.d/nuri K30nuri
	echo "OK"
}

set_default_ruby() {
	ln -sf /usr/bin/ruby1.9.1 /usr/bin/ruby
	ln -sf /usr/bin/gem1.9.1 /usr/bin/gem
	ln -sf /usr/bin/erb1.9.1 /usr/bin/erb
	ln -sf /usr/bin/irb1.9.1 /usr/bin/irb
	ln -sf /usr/bin/rake1.9.1 /usr/bin/rake
	ln -sf /usr/bin/rdoc1.9.1 /usr/bin/rdoc
}

install_required_softwares() {
	echo "Installing required softwares and libraries..."
	apt-get -y update
	apt-get -y install ruby1.9.1 ruby1.9.1-dev libz-dev \
		libaugeas-ruby1.9.1 make gcc libxml2-dev libxslt-dev \
		sudo
	set_default_ruby
	gem install webrick antlr3 fog --no-ri --no-rdoc
	echo "...OK"
}

DEST="$( pwd )/nuri"
TRUSTED=""
if [ "$1" = "-silent" ]; then
	TRUSTED=$2
else
	read -p "What is the address of master node? " TRUSTED_INPUT
	TRUSTED_INPUT="$( echo $TRUSTED_INPUT | sed -e 's/^ *//g' -e 's/ *$//g' )"
	if [ "$TRUSTED_INPUT" != "" ]; then
		TRUSTED=$TRUSTED_INPUT
	fi
fi

TRUSTED="\"$TRUSTED\""

install_required_softwares

if [ "$1" = "-environment" ]; then
	DIR="$( cd "$( dirname "$0" )" && cd .. && pwd )"
	setup_configuration_file $DIR
	setup_init_script $DIR
	echo "Finish setup the environment!"
	exit 0
fi

# download binaries from github repository
echo -n "Download binaries..."
/usr/bin/wget --no-check-certificate -O /tmp/nuri.tgz -o /dev/null https://github.com/herry13/nuri/tarball/master
echo "OK"

if [ -f "/tmp/nuri.tgz" ]; then
	cd /tmp

	# extract
	echo -n "Extract the files..."
	/bin/tar xvf nuri.tgz 1>/dev/null 2>/dev/null
	# locate the directory, rename it, then change current directory
	DIR=`/bin/ls | grep 'herry13-nuri'`
	mv $DIR $DEST
	rm -f nuri.tgz
	echo "OK"

	cd $DEST

	setup_configuration_file "$DEST"

	setup_init_script "$DEST"

	echo "Finished!"
fi

exit 0
