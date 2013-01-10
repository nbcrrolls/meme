# @Copyright@
# @Copyright@


REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

PKGROOT = /opt/meme_$(MEMEVER)/rocks

SEDSPEC += \
        -e 's%@MEMEVER@%$(MEMEVER)%g' \
        -e 's%@MEMEPREV@%$(MEMEPREV)%g' 

version.mk:
	cat ../version.mk version.mk.in > version.mk

meme-update-db:  meme-update-db.in
	$(SED) $(SEDSPEC) $^ > $@

meme-jobs-cleanup:  meme-jobs-cleanup.in
	$(SED) $(SEDSPEC) $^ > $@

meme-logrotate:  meme-logrotate.in
	$(SED) $(SEDSPEC) $^ > $@

meme-nfs.sh:  meme-nfs.sh.in
	$(SED) $(SEDSPEC) $^ > $@

build: version.mk meme-update-db meme-jobs-cleanup \
	meme-logrotate meme-nfs.sh 


install::
	mkdir -p $(ROOT)/etc/cron.daily 
	$(INSTALL) -m755 meme-jobs-cleanup $(ROOT)/etc/cron.daily/
	mkdir -p $(ROOT)/etc/cron.monthly 
	$(INSTALL) -m755 meme-update-db $(ROOT)/etc/cron.monthly/
	mkdir -p $(ROOT)/$(PKGROOT)
	$(INSTALL) -m644 meme-logrotate $(ROOT)/$(PKGROOT)
	$(INSTALL) -m755 meme-nfs.sh $(ROOT)/$(PKGROOT)

clean::
	rm -f $(NAME).spec.in version.mk
	rm -rf meme-update-db meme-jobs-cleanup meme-logrotate meme-nfs.sh
