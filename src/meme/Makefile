# $Id: Makefile,v 1.12 2013/01/09 22:36:14 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.12  2013/01/09 22:36:14  nadya
# do cgi links on opal server
# do mkdir on /export on frontend
#
# Revision 1.11  2013/01/08 01:26:09  nadya
# patching of etc files was added via meme patch 3
#
# Revision 1.10  2013/01/07 22:50:23  nadya
# move making directories to server only
#
# Revision 1.9  2012/11/03 00:47:44  nadya
# clean old meme distro.
#
# Revision 1.8  2012/10/30 21:15:52  nadya
# fix paths used by update script during compile
#
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
PKGROOT_LOGS = LOGS-$(MEMEVER)

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


version.mk:
	cat ../version.mk version.mk.in  > version.mk

SEDSPEC += \
        -e 's%@MEMEVER@%$(MEMEVER)%g' \
        -e 's%@MEMEPREV@%$(MEMEPREV)%g' \
        -e 's%@NAME@%$(NAME)%g' 

SEDSPECBOOTSTRAP += \
        -e 's/=\/opt\//=`pwd`\//' \
        -e 's/BASE\/bin/BASE\/scripts/' \
        -e 's/LIB=$$BASE\/lib\/perl/LIB=$$BASE\/scripts/' \
        -e 's/$$BASE\/lib\/perl\/RSATWS/`pwd`\/RSATWS/'

update-csv.sh: update-csv.sh.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

update-csv-bootstrap.sh: update-csv.sh
	$(SED) $(SEDSPECBOOTSTRAP) $^ > $@
	chmod 755 $@

meme-www.sh: meme-www.sh.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

build: version.mk update-csv.sh update-csv-bootstrap.sh
	gunzip -c $(NAME)_$(MEMEVER).$(TARBALL_POSTFIX) | $(TAR) -xf -
	#cd patch-files && find . -type f | grep -v CVS | cpio -pduv ..

	(							      \
		cd $(NAME)_$(MEMEVER);				      \
		../patch-$(MEMEVER);                                  \
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
	gunzip -c $(RSATWS).$(TARBALL_POSTFIX) | $(TAR) -xf -
	./update-csv-bootstrap.sh

	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	(							\
		cd $(NAME)_$(MEMEVER);				\
		$(MAKE) prefix=$(ROOT)/$(PKGROOT) install;\
	)
	mkdir -p $(ROOT)/$(PKGROOT)/bin
	$(INSTALL) -m755  update-csv.sh  $(ROOT)/$(PKGROOT)/bin
	mkdir -p $(ROOT)/$(PKGROOT)/rocks
	$(INSTALL) -m755  meme-www.sh  $(ROOT)/$(PKGROOT)/rocks
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
	rm -rf version.mk
	rm -rf update-csv.sh update-csv-bootstrap.sh meme-www.sh
	rm -rf $(NAME)_$(MEMEVER) $(RSATWS)  $(NAME)_$(MEMEPREV)
