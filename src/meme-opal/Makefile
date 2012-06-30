# $Id: Makefile,v 1.1 2012/06/30 02:18:14 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.1  2012/06/30 02:18:14  nadya
# initial
#

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

SEDSPEC += \
        -e 's%@VER@%$(VERSION)%g' 

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
