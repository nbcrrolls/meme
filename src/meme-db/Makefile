# $Id: Makefile,v 1.2 2012/08/31 01:23:03 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.2  2012/08/31 01:23:03  nadya
# move databases to /export
#
# Revision 1.1  2012/08/23 00:01:29  nadya
# initial
#
# Revision 1.1  2012/06/30 02:19:26  nadya
# initial
#

PKGROOT = /export/meme/

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


version.mk:
	cat version.mk.in ../version.mk > version.mk


build: version.mk 
	tar xvf $(GOMO).$(TARBALL_POSTFIX)
	tar xvf $(MOTIF).$(TARBALL_POSTFIX)

	
install::
	mkdir -p $(ROOT)/$(PKGROOT)/db
	mkdir -p $(ROOT)/$(PKGROOT)/etc
	cp $(GOMO)/gomo_db.csv $(ROOT)/$(PKGROOT)/etc
	cp -r $(GOMO) $(ROOT)/$(PKGROOT)/db         
	cp $(MOTIF)/motif_db.csv $(ROOT)/$(PKGROOT)/etc
	cp -r $(MOTIF) $(ROOT)/$(PKGROOT)/db         

clean::
	rm -rf version.mk
	rm -rf $(GOMO) $(MOTIF)
