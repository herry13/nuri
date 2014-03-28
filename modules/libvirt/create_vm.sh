#!/bin/sh

NAME="hpvm1"

# hardware
CPU=1
MEMORY_SIZE=256 # in MB
DISKSIZE=3 # in GB

# network
MAC="54:52:00:6C:46:01"
BRIDGE=br0

# disk
STORAGE="/nfs/vms/herry/images"
IMAGE="$STORAGE/$NAME.img,size=$DISKSIZE"

# operating system
LOCATION="http://archive.ubuntu.com/ubuntu/dists/precise/main/installer-amd64/"
OS_TYPE=linux
OS_VARIANT=ubuntumaverick

# others
KS="ks=file:/$NAME.cfg"
CONSOLE="console=ttyS0,9600n8"
INITRD="/tmp/$NAME.cfg"

virt-install -n $NAME -r $MEMORY_SIZE -f $IMAGE \
	-s $DISKSIZE --vcpus=$CPU --os-type $OS_TYPE \
	--os-variant=$OS_VARIANT --accelerate \
	--mac=$MAC --network bridge:$BRIDGE \
	--location=$LOCATION \
	--extra-args="$CONSOLE $KS" \
	--noautoconsole \
	--initrd-inject=$INITRD \

