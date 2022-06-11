#! /bin/bash
#
# Nagios NRPE installer script
#
sudo useradd nagios
sudo apt update
sudo apt install -y autoconf gcc libmcrypt-dev make libssl-dev wget dc build-essential gettext
cd ~
curl -L -O https://nagios-plugins.org/download/nagios-plugins-2.3.2.tar.gz
tar zxf nagios-plugins-2.3.2.tar.gz
cd nagios-plugins-2.3.2
./configure
make
sudo make install
cd ~
curl -L -O https://github.com/NagiosEnterprises/nrpe/archive/refs/tags/nrpe-4.0.3.tar.gz
tar zxf nrpe-4.0.3.tar.gz
cd nrpe-4.0.3
./configure
make nrpe
sudo make install-daemon
sudo make install-config
sudo make install-init
