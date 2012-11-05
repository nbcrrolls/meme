# @Copyright@
# @Copyright@


REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


SEDSPEC += \
        -e 's%@MEMEVER@%$(MEMEVER)%g' 

SEDSPECPREV += \
        -e 's%@MEMEVER@%$(MEMEPREV)%g' 

version.mk:
	cat ../version.mk version.mk.in > version.mk

meme-update-db-$(MEMEVER):  meme-update-db.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

meme-update-db-$(MEMEPREV):  meme-update-db.in
	$(SED) $(SEDSPECPREV) $^ > $@
	chmod 755 $@

meme-jobs-cleanup-$(MEMEVER):  meme-jobs-cleanup.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

meme-jobs-cleanup-$(MEMEPREV):  meme-jobs-cleanup.in
	$(SED) $(SEDSPECPREV) $^ > $@
	chmod 755 $@

build: version.mk meme-update-db-$(MEMEVER) meme-update-db-$(MEMEPREV) \
	meme-jobs-cleanup-$(MEMEVER) meme-jobs-cleanup-$(MEMEPREV)

install::
	mkdir -p $(ROOT)/etc/cron.daily 
	$(INSTALL) -m755 meme-jobs-cleanup-$(MEMEVER) $(ROOT)/etc/cron.daily/
	$(INSTALL) -m755 meme-jobs-cleanup-$(MEMEPREV) $(ROOT)/etc/cron.daily/
	mkdir -p $(ROOT)/etc/cron.monthly 
	$(INSTALL) -m755 meme-update-db-$(MEMEVER) $(ROOT)/etc/cron.monthly/
	$(INSTALL) -m755 meme-update-db-$(MEMEPREV) $(ROOT)/etc/cron.monthly/
	mkdir -p $(ROOT)/var/www/html/downloads
	$(INSTALL) -m644 index.html $(ROOT)/var/www/html/downloads

clean::
	rm -f $(NAME).spec.in
	rm -rf meme-update-db-$(MEMEVER) meme-jobs-cleanup-$(MEMEVER)
	rm -rf meme-update-db-$(MEMEPREV) meme-jobs-cleanup-$(MEMEPREV)
	rm -rf version.mk 
