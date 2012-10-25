# $Id: Makefile,v 1.7 2012/10/25 21:55:25 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.7  2012/10/25 21:55:25  nadya
# move creattion nfs-mounted dirs for user output from nodes files,
#
# Revision 1.6  2012/09/01 04:13:15  nadya
# use version in one place
#
# Revision 1.5  2012/09/01 02:01:15  nadya
# remove original ant deployment during make install.
#
# Revision 1.4  2012/08/31 01:24:06  nadya
# move databases to /export
#
# Revision 1.3  2012/08/29 01:50:29  nadya
# clean RSATWS
#
# Revision 1.2  2012/08/22 23:53:30  nadya
# add RSATWS, update-csv.sh
#
# Revision 1.1  2012/06/30 02:19:26  nadya
# initial
#

PKGROOT = /opt/$(NAME)_$(MEMEVER)
PKGROOT_OUT = output-$(MEMEVER)
PKGROOT_USER = user-files-$(MEMEVER)

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


version.mk:
	cat version.mk.in ../version.mk > version.mk

SEDSPEC += \
        -e 's%@MEMEVER@%$(MEMEVER)%g' \
        -e 's%@NAME@%$(NAME)%g' 

SEDSPECBOOTSTRAP += \
        -e 's/=\/opt\//=.\//' \
        -e 's/BASE\/bin/BASE\/scripts/' \
        -e 's/$$BASE\/RSATWS/`pwd`\/RSATWS/'

update-csv.sh: update-csv.sh.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

update-csv-bootstrap.sh: update-csv.sh
	$(SED) $(SEDSPECBOOTSTRAP) $^ > $@
	chmod 755 $@

build: version.mk update-csv.sh update-csv-bootstrap.sh
	gunzip -c $(NAME)_$(MEMEVER).$(TARBALL_POSTFIX) | $(TAR) -xf -
	cd patch-files && find . -type f | grep -v CVS | cpio -pduv ..

	(							      \
		cd $(NAME)_$(MEMEVER);				      \
		patch -p0 -i ../patches/patch_4.8.1_1;                \
		patch -p1 -i ../patches/patch_4.8.1_2;                \
		patch -p1 -i ../patches/patch_4.8.1_3;                \
		patch -p0 -i ../patches/patch_4.8.1_4;                \
	)
	( 							      \
		cd $(NAME)_$(MEMEVER);				      \
		export CATALINA_HOME=/opt/tomcat;		      \
		./configure --prefix=$(PKGROOT)                       \
			--enable-opt                                  \
			--enable-build-libxml2                        \
			--enable-build-libxslt 			      \
			--with-mpicc=/opt/openmpi/bin/mpicc           \
			--with-python=/opt/python/bin/python2.7       \
			--with-perl=/opt/perl/bin/perl                \
			--with-contact=meme@nbcr.net                  \
			--with-url=http://rollhost/meme_$(MEMEVER)    \
			--enable-web=http://rollhost/opal2/services   \
			--enable-webservice=/opt/opal/build.xml ;     \
		$(MAKE);					      \
		$(MAKE) test;					      \
	)
	./update-csv-bootstrap.sh
	gunzip -c $(RSATWS).$(TARBALL_POSTFIX) | $(TAR) -xf -

	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	(							\
		cd $(NAME)_$(MEMEVER);				\
		$(MAKE) prefix=$(ROOT)/$(PKGROOT) install;\
	)
	mkdir -p $(ROOT)/$(PKGROOT)/bin
	$(INSTALL) -m755  update-csv.sh  $(ROOT)/$(PKGROOT)/bin
	mkdir -p $(ROOT)/$(PKGROOT)/lib/perl
	cp -r $(RSATWS) $(ROOT)/$(PKGROOT)/lib/perl
	ln -s /share/meme/db/motif_databases $(ROOT)/$(PKGROOT)/db
	ln -s /share/meme/db/gomo_databases $(ROOT)/$(PKGROOT)/db
	ln -s /share/meme/db/fasta_databases $(ROOT)/$(PKGROOT)/db

	mkdir -p $(ROOT)/state/partition1/meme/$(PKGROOT_OUT)
	chmod 777 $(ROOT)/state/partition1/meme/$(PKGROOT_OUT)
	rm -rf $(ROOT)/$(PKGROOT)/web/output
	ln -s /share/meme/$(PKGROOT_OUT) $(ROOT)/$(PKGROOT)/web/output

	mkdir -p $(ROOT)/state/partition1/meme/$(PKGROOT_USER)
	chmod 777 $(ROOT)/state/partition1/meme/$(PKGROOT_USER)
	rm -rf $(ROOT)/$(PKGROOT)/web/user-files
	ln -s /share/meme/$(PKGROOT_USER) $(ROOT)/$(PKGROOT)/web/user-files

clean::
	rm -rf version.mk
	rm -rf update-csv.sh update-csv-bootstrap.sh
	rm -rf $(NAME)_$(MEMEVER) $(RSATWS)
