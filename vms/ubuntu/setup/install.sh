#!/bin/bash

#install basic tools
sudo DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" install git

sudo apt-get -y install fish
#get golang 1.9.1
curl -O https://storage.googleapis.com/golang/go1.12.8.linux-amd64.tar.gz

#unzip the archive
tar -xvf go1.12.8.linux-amd64.tar.gz

#move the go lib to local folder
mv go /usr/local

#delete the source file
rm  go1.12.8.linux-amd64.tar.gz

#only full path will work
touch /home/vagrant/.bash_profile

echo "export PATH=$PATH:/usr/local/go/bin" >> /home/vagrant/.bash_profile
echo "export GOPATH=/home/vagrant/Computer/Work/go" >> /home/vagrant/.bash_profile
echo "export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin" >> /home/vagrant/.bash_profile
export GOPATH=/home/vagrant/Computer/Work/go

sudo apt-get -y install jq