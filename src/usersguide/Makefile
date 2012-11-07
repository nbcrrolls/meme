# @Copyright@
# @Copyright@

PKGROOT = /var/www/html/roll-documentation/meme/$(ROCKS_VERSION)

REDHAT.ROOT = $(PWD)/../../
-include $(ROCKSROOT)/etc/Rules.mk
include Rules.mk

SEDSPEC += \
	-e 's%@PUBDATE@%$(PUBDATE)%g' \
	-e 's%@YEAR@%$(YEAR)%g' \
	-e 's%@NAME@%$(NAME)%g' \
	-e 's%@MEMEVER@%$(MEMEVER)%g' \
	-e 's%@MEMEPREV@%$(MEMEPREV)%g' \
	-e 's%@ROCKS_VERSION@%$(ROCKS_VERSION)%g' 

version.mk:
	cat version.mk.in ../version.mk > version.mk

default: $(NAME).spec 

html: version.mk after-install.sgml preface.sgml requirements.sgml predoc 
	jw --backend html --dsl $(PWD)/rocks.dsl#html index.sgml

pdf: version.mk after-install.sgml preface.sgml requirements.sgml predoc 
	jw --backend pdf --dsl $(PWD)/rocks.dsl#print index.sgml

after-install.sgml: after-install.sgml.in
	$(SED) $(SEDSPEC) $^ > $@

preface.sgml: preface.sgml.in
	$(SED) $(SEDSPEC) $^ > $@

requirements.sgml: requirements.sgml.in
	$(SED) $(SEDSPEC) $^ > $@

build: html pdf

install:: build
	mkdir -p $(ROOT)/$(PKGROOT)/images
	mkdir -p $(ROOT)/$(PKGROOT)/stylesheet-images
	install -ma+r index.pdf 	$(ROOT)/$(PKGROOT)/$(NAME).pdf
	install -ma+r *.html    	$(ROOT)/$(PKGROOT)/
	install -ma+r images/*.png	$(ROOT)/$(PKGROOT)/images/
	install -ma+r stylesheet-images/{*.gif,*.png} \
		$(ROOT)/$(PKGROOT)/stylesheet-images/
	install -ma+r rocks.css $(ROOT)/$(PKGROOT)/

clean::
	rm -f index.pdf
	rm -rf *.html
	rm -rf images/*.png version.mk
	rm -rf after-install.sgml preface.sgml requirements.sgml
