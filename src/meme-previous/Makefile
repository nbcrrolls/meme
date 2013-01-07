# $Id: Makefile,v 1.2 2013/01/07 22:50:24 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.2  2013/01/07 22:50:24  nadya
# move making directories to server only
#
# Revision 1.1  2012/11/03 00:51:19  nadya
# make separate rpm for previous version
#

PKGROOT = /opt/$(PKGNAME)_$(MEMEPREV)
PKGROOT_OUT = output-$(MEMEPREV)
PKGROOT_USER = user-files-$(MEMEPREV)
PKGROOT_LOGS = LOGS-$(MEMEPREV)

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


version.mk:
	cat ../version.mk version.mk.in  > version.mk

SEDSPEC += \
        -e 's%@MEMEPREV@%$(MEMEPREV)%g' \
        -e 's%@MEMEPREV@%$(MEMEPREV)%g' \
        -e 's%@PKGNAME@%$(PKGNAME)%g' 

update-csv.sh: update-csv.sh.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

pretar::
	mkdir -p patch-files
	cp ../meme/patch-$(MEMEPREV) .
	cp ../meme/update-csv.sh.in .
	cp -p -r ../meme/patches/ .
	cp -p -r ../meme/patch-files/$(PKGNAME)_$(MEMEPREV) patch-files
	cp -p ../meme/$(PKGNAME)_$(MEMEPREV).$(TARBALL_POSTFIX) .
	cp -p ../meme/$(RSATWS).$(TARBALL_POSTFIX) .

build: version.mk update-csv.sh patch-$(MEMEPREV)
	gunzip -c $(PKGNAME)_$(MEMEPREV).$(TARBALL_POSTFIX) | $(TAR) -xf -
	cd patch-files && find . -type f | grep -v CVS | cpio -pduv ..

	(							      \
		cd $(PKGNAME)_$(MEMEPREV);			      \
		../patch-$(MEMEPREV);                                 \
	)
	( 							      \
		cd $(PKGNAME)_$(MEMEPREV);			      \
		export CATALINA_HOME=/opt/tomcat;		      \
		./configure --prefix=$(PKGROOT)                       \
			--enable-opt                                  \
			--enable-build-libxml2                        \
			--enable-build-libxslt 			      \
			--with-mpicc=/opt/openmpi/bin/mpicc           \
			--with-python=/opt/python/bin/python2.7       \
			--with-perl=/opt/perl/bin/perl                \
			--with-contact=meme@nbcr.net                  \
			--with-url=http://rollhost/meme_$(MEMEPREV)    \
			--enable-web=http://rollhost/opal2/services   \
			--enable-webservice=/opt/opal/build.xml ;     \
		$(MAKE);					      \
		$(MAKE) test;					      \
	)

	gunzip -c $(RSATWS).$(TARBALL_POSTFIX) | $(TAR) -xf -

	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	(							\
		cd $(PKGNAME)_$(MEMEPREV);				\
		$(MAKE) prefix=$(ROOT)/$(PKGROOT) install;\
	)
	mkdir -p $(ROOT)/$(PKGROOT)/bin
	$(INSTALL) -m755  update-csv.sh  $(ROOT)/$(PKGROOT)/bin
	mkdir -p $(ROOT)/$(PKGROOT)/lib/perl
	cp -r $(RSATWS) $(ROOT)/$(PKGROOT)/lib/perl
	ln -s /share/meme/db/motif_databases $(ROOT)/$(PKGROOT)/db
	ln -s /share/meme/db/gomo_databases $(ROOT)/$(PKGROOT)/db
	ln -s /share/meme/db/fasta_databases $(ROOT)/$(PKGROOT)/db

	rm -rf $(ROOT)/$(PKGROOT)/web/output
	ln -s /share/meme/$(PKGROOT_OUT) $(ROOT)/$(PKGROOT)/web/output

	rm -rf $(ROOT)/$(PKGROOT)/web/user-files
	ln -s /share/meme/$(PKGROOT_USER) $(ROOT)/$(PKGROOT)/web/user-files

	rm -rf $(ROOT)/$(PKGROOT)/LOGS
	ln -s /share/meme/$(PKGROOT_LOGS) $(ROOT)/$(PKGROOT)/LOGS


clean::
	rm -rf version.mk update-csv.sh*  
	rm -rf patches patch-files patch-$(MEMEPREV)
	rm -rf $(PKGNAME)_$(MEMEPREV)* $(RSATWS)*
