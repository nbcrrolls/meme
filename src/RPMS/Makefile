#
# $Id: Makefile,v 1.2 2012/10/25 21:51:01 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.2  2012/10/25 21:51:01  nadya
# add HTML-Template perl package
#
# Revision 1.1  2012/08/29 02:04:19  nadya
# add missing perl prereq modules
#

REDHAT.ROOT     = $(CURDIR)/../../
MAKE.iscontrib  = 1
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

NOARCH = noarch

rpm:: build
	-cp $(CLASS_STD)-*.$(NOARCH).rpm $(REDHAT.RPMS)/$(NOARCH)/
	-cp $(CLASS_STD_FAST)-*.$(NOARCH).rpm $(REDHAT.RPMS)/$(NOARCH)/
	-cp $(SOAP_WSDL)-*.$(NOARCH).rpm $(REDHAT.RPMS)/$(NOARCH)/
	-cp $(TimeDate)-*.$(NOARCH).rpm $(REDHAT.RPMS)/$(NOARCH)/
	-cp $(HTML_Template)-*.$(NOARCH).rpm $(REDHAT.RPMS)/$(NOARCH)/

build:
	mkdir -p $(REDHAT.RPMS)/$(NOARCH)/

