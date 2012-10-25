# $Id: Makefile,v 1.3 2012/10/25 21:41:18 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.3  2012/10/25 21:41:18  nadya
# update db root dir
#
# Revision 1.2  2012/08/31 01:23:03  nadya
# move databases to /export
#
# Revision 1.1  2012/08/23 00:01:29  nadya
# initial
#
# Revision 1.1  2012/06/30 02:19:26  nadya
# initial
#

PKGROOT_DB = /state/partition1/meme/db
PKGROOT= /opt/meme_$(MEMEVER)

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


version.mk:
	cat version.mk.in ../version.mk > version.mk


build: version.mk 
	tar xvf $(GOMO).$(TARBALL_POSTFIX)
	tar xvf $(MOTIF).$(TARBALL_POSTFIX)

	
install::
	mkdir -p $(ROOT)/$(PKGROOT_DB)
	cp -r $(GOMO) $(ROOT)/$(PKGROOT_DB)
	cp -r $(MOTIF) $(ROOT)/$(PKGROOT_DB)
	mkdir -p $(ROOT)/$(PKGROOT)/etc
	cp $(GOMO)/gomo_db.csv $(ROOT)/$(PKGROOT)/etc
	cp $(MOTIF)/motif_db.csv $(ROOT)/$(PKGROOT)/etc

clean::
	rm -rf version.mk
	rm -rf $(GOMO) $(MOTIF)
