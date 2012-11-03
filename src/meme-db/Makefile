# $Id: Makefile,v 1.4 2012/11/03 00:55:07 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.4  2012/11/03 00:55:07  nadya
# don't copy 2 db files, add them via patch mechanism.
# at compile time correct index files are created where needed
#
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

PKGROOT = /state/partition1/meme/db

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


version.mk:
	cat version.mk.in ../version.mk > version.mk


build: version.mk 
	tar xvf $(GOMO).$(TARBALL_POSTFIX)
	tar xvf $(MOTIF).$(TARBALL_POSTFIX)

	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	cp -r $(GOMO) $(ROOT)/$(PKGROOT)
	cp -r $(MOTIF) $(ROOT)/$(PKGROOT)

clean::
	rm -rf version.mk
	rm -rf $(GOMO) $(MOTIF)
