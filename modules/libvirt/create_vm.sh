#!/bin/sh

NAME="<%= name %>"

# hardware
CPU=<%= cpus %>
MEMORY=<%= memory %>
DISKSIZE=<%= disksize %>

# network
MAC="<%= mac_address %>"
BRIDGE=br0

# disk
STORAGE=<%= image_location %>
IMAGE="$STORAGE/$NAME.img"

# operating system
VERSION=<%= os_version %>
LOCATION="http://archive.ubuntu.com/ubuntu/dists/$VERSION/main/installer-amd64/"
OS_TYPE=linux
OS_VARIANT=ubuntumaverick

# others
KS="ks=file:/<%= File.basename(ks_file) %>"
CONSOLE="console=ttyS0,9600n8"
INITRD="<%= ks_file %>"

virt-install -n $NAME -r $MEMORY -f $IMAGE \
	-s $DISKSIZE --vcpus=$CPU --os-type $OS_TYPE \
	--os-variant=$OS_VARIANT --accelerate \
	--mac=$MAC --network bridge:$BRIDGE \
	--location=$LOCATION \
	--extra-args="$CONSOLE $KS" \
	--noautoconsole \
	--initrd-inject=$INITRD \

