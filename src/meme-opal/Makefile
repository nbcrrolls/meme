# $Id: Makefile,v 1.9 2013/02/08 00:51:16 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.9  2013/02/08 00:51:16  nadya
# mv cron jobs from rocks-meme to meme-opal
#
# Revision 1.8  2013/01/08 01:26:59  nadya
# move action to opal-server node
#
# Revision 1.7  2012/12/05 22:48:20  nadya
# enable cgi listing; rocks.conf on opal-server is minimal
#
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
        -e 's%@MEMEVER@%$(MEMEVER)%g' \
        -e 's%@MEMEPREV@%$(MEMEPREV)%g' 

version.mk:
	cat ../version.mk version.mk.in > version.mk

meme-updatedb:  meme-updatedb.in
	$(SED) $(SEDSPEC) $^ > $@

build:  meme-updatedb 
	
install::
	mkdir -p $(ROOT)/etc/httpd/conf.d
	install -m 644 meme.conf $(ROOT)/etc/httpd/conf.d
	install -m 644 meme-nbcr.conf $(ROOT)/etc/httpd/conf.d
	mkdir -p $(ROOT)/etc/cron.daily 
	$(INSTALL) -m755 meme-jobs-cleanup $(ROOT)/etc/cron.daily/
	mkdir -p $(ROOT)/etc/cron.monthly 
	$(INSTALL) -m755 meme-updatedb $(ROOT)/etc/cron.monthly/

clean::
	rm -rf version.mk 
	rm -rf meme-updatedb 
