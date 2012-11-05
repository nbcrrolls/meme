# $Id: Makefile,v 1.6 2012/11/05 22:43:37 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.6  2012/11/05 22:43:37  nadya
# add undeploy scripts
#
# Revision 1.5  2012/11/03 01:22:13  nadya
# add deployment for old version
#
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

SEDSPECPREV += \
            -e 's%@MEMEVER@%$(MEMEPREV)%g' 

version.mk:
	cat version.mk.in ../version.mk > version.mk

deploy_meme_$(MEMEVER).sh: deploy_meme.sh.in
	$(SED) $(SEDSPEC) $^ > $@

deploy_meme_$(MEMEPREV).sh: deploy_meme.sh.in
	$(SED) $(SEDSPECPREV) $^ > $@

undeploy_meme_$(MEMEVER).sh: undeploy_meme.sh.in
	$(SED) $(SEDSPEC) $^ > $@

undeploy_meme_$(MEMEPREV).sh: undeploy_meme.sh.in
	$(SED) $(SEDSPECPREV) $^ > $@

build: deploy_meme_$(MEMEVER).sh deploy_meme_$(MEMEPREV).sh undeploy_meme_$(MEMEVER).sh undeploy_meme_$(MEMEPREV).sh
	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	$(INSTALL)  -m 0755  *deploy_meme_$(MEMEVER).sh  $(ROOT)/$(PKGROOT)
	$(INSTALL)  -m 0755  *deploy_meme_$(MEMEPREV).sh  $(ROOT)/$(PKGROOT)

clean::
	rm -rf version.mk *deploy_meme_*.sh
