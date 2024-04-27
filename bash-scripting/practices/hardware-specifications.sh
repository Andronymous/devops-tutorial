#!/bin/bash
mkdir -p $HOME/tmp

echo -e '\n' >> $HOME/tmp/basic-check.txt
# Host
echo 'Hostname: ' >> $HOME/tmp/basic-check.txt
hostname  >> $HOME/tmp/basic-check.txt
echo 'HostIP: ' >> $HOME/tmp/basic-check.txt
hostname -I  >> $HOME/tmp/basic-check.txt
echo 'Detect Virt: ' >> $HOME/tmp/basic-check.txt
systemd-detect-virt  >> $HOME/tmp/basic-check.txt
echo -e '\n' >> $HOME/tmp/basic-check.txt

# check system OS version
echo '** Os version:' >> $HOME/tmp/basic-check.txt
lsb_release -a  >> $HOME/tmp/basic-check.txt
echo -e '\n' >> $HOME/tmp/basic-check.txt



# check system Hardware
##CPU
echo '** CPU Attributes:' >> $HOME/tmp/basic-check.txt
lscpu | grep 'Model name:' >> $HOME/tmp/basic-check.txt
lscpu | grep 'Model name:' >> $HOME/tmp/basic-check.txt
lscpu | grep -w '^CPU(s)' >> $HOME/tmp/basic-check.txt
lscpu | grep -w '^Socket(s):' >> $HOME/tmp/basic-check.txt
lscpu | grep -w '^Core(s) per socket:' >> $HOME/tmp/basic-check.txt
lscpu | grep -w '^Thread(s) per core:' >> $HOME/tmp/basic-check.txt
lscpu | grep -w 'CPU family:' >> $HOME/tmp/basic-check.txt
echo -e '\n' >> $HOME/tmp/basic-check.txt


##RAM
echo '** RAM Attributes:' >> $HOME/tmp/basic-check.txt
free -mh  >> $HOME/tmp/basic-check.txt
echo -e '\n' >> $HOME/tmp/basic-check.txt

##Storage
echo '** Storage Attributes:' >> $HOME/tmp/basic-check.txt
lsblk >> $HOME/tmp/basic-check.txt
echo -e '\n' >> $HOME/tmp/basic-check.txt

clear
cat $HOME/tmp/basic-check.txt
