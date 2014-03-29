# locales
lang en_GB.UTF-8
langsupport en_GB
keyboard uk
timezone --utc Europe/London

text
install
reboot

# url of ubuntu repository
url --url=http://archive.ubuntu.com/ubuntu/

# network setting
network --onboot yes --device eth0 --mtu=1500 --bootproto dhcp --hostname <%= name %>.diy.inf.ed.ac.uk
firewall --disabled

# authentication type
auth --useshadow --enablemd5

# accounts
rootpw  --iscrypted $6$2o5vN88/M0tumJGy$yq.eTRe0yk5z1OB4DDgdCcKtoIZBf6x07GxxHnGbSCpZSyk3nTVguQeNUzIfZw0c90afRHopRr0l3WcjQKFek/
user herry --fullname "Herry" --iscrypted --password $6$2o5vN88/M0tumJGy$yq.eTRe0yk5z1OB4DDgdCcKtoIZBf6x07GxxHnGbSCpZSyk3nTVguQeNUzIfZw0c90afRHopRr0l3WcjQKFek/

# partitions
zerombr yes
clearpart --all --initlabel
part / --fstype=ext3 --grow --size=2072
part swap --size=512

# bootloader
bootloader --location=mbr --driveorder=vda --append="console=ttyS0,9600n8 crashkernel=auto"

%packages
ubuntu-minimal
openssh-server
wget
vim
lynx

ruby1.9.1
ruby1.9.1-dev
libz-dev
libaugeas-ruby1.9.1

%post

echo "alias ls='ls --color'" > /etc/profile.d/ls.sh

# update packages
apt-get update
apt-get upgrade -y

# setup locales
locale-gen en_GB.UTF-8
update-locale LANG="en_GB.UTF-8"
echo 'LANG=en_GB.UTF-8' >> /etc/environment
echo 'LC_ALL=en_GB.UTF-8' >> /etc/environment

# install sfpagent
gem install sfpagent
echo "*  *    * * *   root    sfpagent -s" >> /etc/crontab
