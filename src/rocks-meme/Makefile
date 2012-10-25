# @Copyright@
# @Copyright@


REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


SEDSPEC += \
        -e 's%@MEMEVER@%$(MEMEVER)%g' 

version.mk:
	cat version.mk.in ../version.mk > version.mk

meme-update-db:  meme-update-db.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

meme-jobs-cleanup:  meme-jobs-cleanup.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

build: version.mk meme-update-db meme-jobs-cleanup

install::
	mkdir -p $(ROOT)/etc/cron.daily 
	$(INSTALL) -m755 meme-jobs-cleanup $(ROOT)/etc/cron.daily/meme-jobs-cleanup-$(MEMEVER)
	mkdir -p $(ROOT)/etc/cron.monthly 
	$(INSTALL) -m755 meme-update-db $(ROOT)/etc/cron.monthly

clean::
	rm -f $(NAME).spec.in
	rm -rf meme-update-db meme-jobs-cleanup
	rm -rf version.mk 
