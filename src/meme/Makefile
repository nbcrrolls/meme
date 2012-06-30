# $Id: Makefile,v 1.1 2012/06/30 02:19:26 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.1  2012/06/30 02:19:26  nadya
# initial
#

PKGROOT = /opt/meme_$(VERSION)

REDHAT.ROOT = $(CURDIR)/../../

-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


version.mk:
	cat version.mk.in ../version.mk > version.mk


build: version.mk
#cd patch-files && find . -type f | grep -v CVS | cpio -pduv ../
	gunzip -c $(NAME)_$(VERSION).$(TARBALL_POSTFIX) | $(TAR) -xf -
	(							      \
		cd $(NAME)_$(VERSION);				      \
		patch -p0 -i ../patches/patch_4.8.1_1;                \
		patch -p1 -i ../patches/patch_4.8.1_2;                \
		patch -p1 -i ../patches/patch_4.8.1_3;                \
		patch -p0 -i ../patches/patch_4.8.1_4;                \
	)
	( 							      \
		cd $(NAME)_$(VERSION);				      \
		export CATALINA_HOME=/opt/tomcat;		      \
		./configure --prefix=$(PKGROOT)/$(NAME) 	      \
			--enable-opt                                  \
			--enable-build-libxml2                        \
			--enable-build-libxslt 			      \
			--with-mpicc=/opt/openmpi/bin/mpicc           \
			--with-python=/opt/python/bin/python2.7       \
			--with-contact=meme@nbcr.net                  \
			--with-url=http://rollhost/meme_$(VERSION)    \
			--enable-web=http://rollhost/opal2/services   \
			--enable-webservice=/opt/opal/build.xml ;     \
		$(MAKE);					      \
		$(MAKE) test;					      \
	)
	
install::
	mkdir -p $(ROOT)/$(PKGROOT)/$(NAME)
	(							\
		cd $(NAME)_$(VERSION);				\
		$(MAKE) prefix=$(ROOT)/$(PKGROOT)/$(NAME) install;\
	)

clean::
	rm -rf version.mk
	rm -rf $(NAME)_$(VERSION)
