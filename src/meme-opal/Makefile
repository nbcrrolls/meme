# $Id: Makefile,v 1.2 2012/09/01 04:11:23 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.2  2012/09/01 04:11:23  nadya
# user version in one place
#
# Revision 1.1  2012/06/30 02:18:14  nadya
# initial
#

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

SEDSPEC += \
        -e 's%@MEMEVER@%$(MEMEVER)%g' 

version.mk:
	cat version.mk.in ../version.mk > version.mk

deploy_meme.sh: deploy_meme.sh.in
	$(SED) $(SEDSPEC) $^ > $@

build: deploy_meme.sh
	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	$(INSTALL)  -m 0750  deploy_meme.sh  $(ROOT)/$(PKGROOT)

clean::
	rm -rf version.mk deploy_meme.sh
