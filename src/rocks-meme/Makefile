# @Copyright@
# @Copyright@


REDHAT.ROOT = $(CURDIR)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

PKGROOT = /opt/meme_$(MEMEVER)/rocks

SCRIPTS = meme-logrotate meme-nfs.sh 

SEDSPEC += \
        -e 's%@MEMEVER@%$(MEMEVER)%g' \
        -e 's%@MEMEPREV@%$(MEMEPREV)%g' 

version.mk:
	cat ../version.mk version.mk.in > version.mk

meme-logrotate:  meme-logrotate.in
	$(SED) $(SEDSPEC) $^ > $@

meme-nfs.sh:  meme-nfs.sh.in
	$(SED) $(SEDSPEC) $^ > $@

build: version.mk  $(SCRIPTS)


install::
	mkdir -p $(ROOT)/$(PKGROOT)
	$(INSTALL) -m644 meme-logrotate $(ROOT)/$(PKGROOT)
	$(INSTALL) -m755 meme-nfs.sh $(ROOT)/$(PKGROOT)
	
clean::
	rm -f $(NAME).spec.in version.mk
	rm -rf $(SCRIPTS)
