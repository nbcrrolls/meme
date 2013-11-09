# This file is called from the generated spec file.
# It can also be used to debug rpm building.
# 	make -f meme.spec.mk build|install

ifndef __RULES_MK
build:
	make ROOT=/home/nadya/git/meme/src/meme491/meme.buildroot build

install:
	make ROOT=/home/nadya/git/meme/src/meme491/meme.buildroot install
endif
