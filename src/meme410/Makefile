# $Id: Makefile,v 1.14 2013/02/01 16:57:16 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.14  2013/02/01 16:57:16  nadya
# rm user-files/
#
# Revision 1.13  2013/01/14 22:15:26  nadya
# correct xmls are in meme distro now
#
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

PKGROOT = /opt/$(PKGNAME)_$(MEMEVER)
PKGROOT_LOGS = LOGS-$(MEMEVER)

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

version.mk:
	cat ../version.mk version.mk.in  > version.mk

SEDSPEC += \
        -e 's%@MEMEVER@%$(MEMEVER)%g' 

SCRIPTS = add-wrapper.sh
WEBSERVICE_WRAPPERS = *_webservice.wrap

add-wrapper.sh: add-wrapper.sh.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

build: version.mk $(SCRIPTS)
	gunzip -c $(PKGNAME)_$(MEMEVER)$(MEMEPATCH).$(TARBALL_POSTFIX) | $(TAR) -xf -
	#cd patch-files && find . -type f | grep -v CVS | cpio -pduv ..
	( 							      \
		cd $(PKGNAME)_$(MEMEVER);			      \
		export CATALINA_HOME=/opt/tomcat;		      \
		./configure                                           \
			--prefix=$(PKGROOT)                           \
			--enable-opt                                  \
			--with-mpidir=/opt/openmpi                    \
			--with-python=/opt/python/bin/python2.7       \
			--with-perl=/opt/perl/bin/perl                \
			--with-contact=meme@nbcr.net                  \
			--with-url=http://rollhost/meme_$(MEMEVER)    \
			--enable-web=http://rollhost/opal2/services   \
			--enable-webservice=/opt/opal/deployed;       \
		$(MAKE);					      \
		$(MAKE) test;					      \
	)

	
install::
	mkdir -p $(ROOT)/$(PKGROOT)
	mkdir -p $(ROOT)/$(PKGROOT)/build-website
	(									\
		cd $(PKGNAME)_$(MEMEVER);					\
		$(MAKE) DESTDIR=$(ROOT) install;				\
		cp build.xml  $(ROOT)/$(PKGROOT)/build-website;			\
		cp MemeSuite.properties  $(ROOT)/$(PKGROOT)/build-website;	\
		cp -r website $(ROOT)/$(PKGROOT)/build-website;			\
		cp -r doc $(ROOT)/$(PKGROOT)/build-website 			\
	)
	./add-wrapper.sh
	mkdir -p $(ROOT)/$(PKGROOT)/bin
	$(INSTALL) -m755 $(WEBSERVICE_WRAPPERS) $(ROOT)/$(PKGROOT)/bin
	mkdir -p /state/partition1/meme/LOGS-$(MEMEVER)
	ls /share/meme 
	mkdir -p $(ROOT)/$(PKGROOT)/db
	ln -s /share/meme/db/motif_databases $(ROOT)/$(PKGROOT)/db/motif_databases
	ln -s /share/meme/db/gomo_databases $(ROOT)/$(PKGROOT)/db/gomo_databases
	ln -s /share/meme/db/fasta_databases $(ROOT)/$(PKGROOT)/db/fasta_databases
	rm -rf $(ROOT)/$(PKGROOT)/LOGS
	ln -s /share/meme/$(PKGROOT_LOGS) $(ROOT)/$(PKGROOT)/LOGS

clean::
	rm -rf version.mk 
	rm -rf $(SCRIPTS) $(WEBSERVICE_WRAPPERS)
	rm -rf $(PKGNAME)_$(MEMEVER) 
