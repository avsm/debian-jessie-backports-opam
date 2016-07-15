#!/bin/sh -e

url=$1
shift
dir=$1
shift
dget -x $url
cd $dir
dch --local ~bpo80+ --distribution jessie-backports "Rebuild for jessie-backports." 
dpkg-buildpackage -d -us -uc
apt-get -y install $*
dpkg -iE ../*.deb
cd ..
rm -rf $dir
