# $Id: Makefile,v 1.4 2012/10/24 23:05:39 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.4  2012/10/24 23:05:39  nadya
# fix permissions
#
# Revision 1.3  2012/10/05 18:30:52  nadya
# use version in deployment script name: 2 meme verisons need to coexist on a server
#
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

deploy_meme_$(MEMEVER).sh: deploy_meme.sh.in
	$(SED) $(SEDSPEC) $^ > $@

build: deploy_meme_$(MEMEVER).sh
	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	$(INSTALL)  -m 0755  deploy_meme_$(MEMEVER).sh  $(ROOT)/$(PKGROOT)

clean::
	rm -rf version.mk deploy_meme_$(MEMEVER).sh
