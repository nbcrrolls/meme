# @Copyright@
# @Copyright@


REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk


build:

install::
	mkdir -p $(ROOT)/etc/cron.daily 
	$(INSTALL) -m755  meme-job-cleanup $(ROOT)/etc/cron.daily


clean::
	rm -f $(NAME).spec.in
