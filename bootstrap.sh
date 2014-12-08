#!/bin/bash
#
# $Id: bootstrap.sh,v 1.4 2013/01/07 18:39:58 nadya Exp $
#
# Run before making a roll. 
# Create and install (in src/RPMS) prereq perl modules rpms
# Needed during meme build for creating db csv files
#

.  /opt/rocks/share/devel/src/roll/etc/bootstrap-functions.sh

IGNORE="--default-ignorelist --ignorelist `pwd`/modules-ignore"

export PATH=/opt/perl/bin:$PATH
DIR=`pwd`

EXTRA=extramods
if [ ! -d $EXTRA ] ; then
   mkdir $EXTRA
fi
cd $EXTRA

doDBs () {
cd $DIR
# create dirs needed for making links in meme rpm.
echo "meme `hostname -s`:/export/&" >> /etc/auto.share
/etc/init.d/autofs restart
compile_and_install meme-db
}

doHTMLTemplate () {
/opt/perl/bin/cpan2dist --force --format CPANPLUS::Dist::Rocks $IGNORE HTML::Template
MOD=`ls HTML-Template/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

### main 
doHTMLTemplate
doDBs

