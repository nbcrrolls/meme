#
# $Id: Makefile,v 1.5 2012/11/07 22:49:21 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
# Revision 1.5  2012/11/07 22:49:21  nadya
# add regex for MEMEPREV in sed. add cleaning
#
# Revision 1.4  2012/10/30 21:22:32  nadya
# don't clean nodes/
#
# Revision 1.3  2012/10/26 22:54:13  nadya
# can't include file from subdirectories, add needed locally
#
# Revision 1.2  2012/09/01 04:18:02  nadya
# use verson in one place, update cleaning
#
# Revision 1.1  2012/06/30 02:11:10  nadya
# initial
#
#

-include $(ROLLSROOT)/etc/Rolls.mk
include Rolls.mk

version.mk:
	grep "MEMEVER" src/version.mk > version.mk
	grep "MEMEPREV" src/version.mk >> version.mk
	cat version.mk.in >> version.mk


default: roll

preroll::
	for i in `ls nodes/*.xml.in`; do \
	    export o=`echo $$i | sed 's/\.in//'`; \
	    cp $$i $$o; \
	    sed -i -e "s/MEMEVER/$(MEMEVER)/g" -e "s/MEMEPREV/$(MEMEPREV)/g" $$o; \
	done


clean::
	rm -rf extramods _arch bootstrap.py
	rm -rf version.mk

cvsclean:: clean
	for i in `ls nodes/*.in`; do \
	    export o=`echo $$i | sed 's/\.in//'`; \
	    rm -rf  $$o; \
	done
