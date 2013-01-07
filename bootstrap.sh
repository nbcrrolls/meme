#!/bin/bash
#
# $Id: bootstrap.sh,v 1.4 2013/01/07 18:39:58 nadya Exp $
#
# Run before making a roll. 
# Create and install (in src/RPMS) prereq perl modules rpms
#

IGNORE="--default-ignorelist --ignorelist `pwd`/modules-ignore"

export PATH=/opt/perl/bin:$PATH
DIR=`pwd`

EXTRA=extramods
if [ ! -d $EXTRA ] ; then
   mkdir $EXTRA
fi
cd $EXTRA

doClassStd () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks $IGNORE  Class::Std
MOD=`ls Class-Std/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doClassStdFast () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks $IGNORE  Class::Std::Fast
MOD=`ls Class-Std-Fast/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doTimeDate () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks $IGNORE Date::Format
MOD=`ls TimeDate/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doSoapWsdl () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks $IGNORE SOAP::WSDL
MOD=`ls SOAP-WSDL/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doHTMLTemplate () {
/opt/perl/bin/cpan2dist --format CPANPLUS::Dist::Rocks $IGNORE HTML::Template
MOD=`ls HTML-Template/noarch/*.rpm`
rpm -i $MOD
cp $MOD ../src/RPMS
}

doXMLParser () {
/opt/perl/bin/cpan2dist --force --format CPANPLUS::Dist::Rocks $IGNORE XML::Parser
MOD=`ls XML-Parser/noarch/*.rpm`
#rpm -i $MOD
cp $MOD ../src/RPMS
}

### main 
doClassStd
doClassStdFast
doTimeDate
doSoapWsdl
doHTMLTemplate
#doXMLParser

