#!/bin/bash
#
# $Id: bootstrap.sh,v 1.1 2012/08/29 02:04:19 nadya Exp $
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

### main 
doClassStd
doClassStdFast
doDateFormat
doSoapWsdl

