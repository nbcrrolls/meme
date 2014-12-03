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
	cat ../version.mk version.mk.in > version.mk

build: version.mk 
	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	mkdir -p $(ROOT)/$(PKGROOT)/fasta_databases
	tar xvf $(GOMO).$(GOMO_VERSION).$(TARBALL_POSTFIX) -C $(ROOT)/$(PKGROOT)
	tar xvf $(MOTIF).$(MOTIF_VERSION).$(TARBALL_POSTFIX) -C $(ROOT)/$(PKGROOT)

clean::
	rm -rf version.mk
	rm -rf $(GOMO) $(MOTIF)
