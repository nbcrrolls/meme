# $Id: Makefile,v 1.1 2012/06/30 02:13:35 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.1  2012/06/30 02:13:35  nadya
# initial
#

-include $(shell $(ROCKSROOT)/bin/arch).mk
-include $(shell $(ROCKSROOT)/bin/os).mk

default:	pkg

copyright pkg rpm clean::
	for i in $(SRCDIRS) ; do \
		(cd $$i; $(MAKE) $@) ; \
	done
