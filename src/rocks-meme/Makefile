# @Copyright@
# @Copyright@


REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


SEDSPEC += \
        -e 's%MEMEVER%$(MEMEVER)%g' 


meme-update-db:  meme-update-db.in
	$(SED) $(SEDSPEC) $^ > $@
	chmod 755 $@

build: meme-update-db

install::
	mkdir -p $(ROOT)/etc/cron.daily 
	$(INSTALL) -m755 meme-jobs-cleanup $(ROOT)/etc/cron.daily
	mkdir -p $(ROOT)/etc/cron.monthly 
	$(INSTALL) -m755 meme-update-db $(ROOT)/etc/cron.monthly

clean::
	rm -f $(NAME).spec.in
	rm -rf meme-update-db
