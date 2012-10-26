#!/bin/bash
#
# $Id: bootstrap.sh,v 1.2 2012/10/26 22:55:23 nadya Exp $
#
# Run before making a roll. 
# Create and install (in src/RPMS) prereq perl modules rpms
#

export PATH=/opt/perl/bin:$PATH
DIR=`pwd`

EXTRA=extramods
if [ ! -d $EXTRA ] ; then
   mkdir $EXTRA
fi
cd $EXTRA

doClassStd () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks --default-ignorelist  Class::Std
MOD=`ls Class-Std/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doClassStdFast () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks --default-ignorelist  Class::Std::Fast
MOD=`ls Class-Std-Fast/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doDateFormat () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks --default-ignorelist Date::Format
MOD=`ls TimeDate/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doSoapWsdl () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks --default-ignorelist SOAP::WSDL
MOD=`ls SOAP-WSDL/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doHTMLTemplate () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks --default-ignorelist HTML::Template
MOD=`ls HTML-Template/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

### main 
doClassStd
doClassStdFast
doDateFormat
doSoapWsdl
doHTMLTemplate

