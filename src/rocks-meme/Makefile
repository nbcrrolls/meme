# @Copyright@
# @Copyright@


REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


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

meme-rocks.sh:  meme-rocks.sh.in
	$(SED) $(SEDSPEC) $^ > $@

build: version.mk meme-update-db meme-jobs-cleanup \
	meme-logrotate meme-rocks.sh 

PKGROOT = /opt/$(NAME)_$(MEMEVER)/rocks

install::
	mkdir -p $(ROOT)/etc/cron.daily 
	$(INSTALL) -m755 meme-jobs-cleanup $(ROOT)/etc/cron.daily/
	mkdir -p $(ROOT)/etc/cron.monthly 
	$(INSTALL) -m755 meme-update-db $(ROOT)/etc/cron.monthly/
	mkdir -p $(ROOT)/var/www/html/downloads
	$(INSTALL) -m644 index.html $(ROOT)/var/www/html/downloads
	mkdir -p $(ROOT)/opt/meme_$(MEMEVER)/rocks
	$(INSTALL) -m644 meme-logrotate $(ROOT)/opt/$(NAME)_$(MEMEVER)/rocks
	$(INSTALL) -m755 meme-rocks.sh $(ROOT)/opt/$(NAME)_$(MEMEVER)/rocks

clean::
	rm -f $(NAME).spec.in version.mk
	rm -rf meme-update-db meme-jobs-cleanup meme-logrotate meme-rocks.sh
