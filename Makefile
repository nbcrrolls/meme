#
# $Id: Makefile,v 1.3 2012/10/26 22:54:13 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
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

default: 
	for i in `ls nodes/*.xml.in`; do \
	    export o=`echo $$i | sed 's/\.in//'`; \
	    cp $$i $$o; \
	    sed -i "s/MEMEVER/$(MEMEVER)/g" $$o; \
	done
	$(MAKE) roll

clean::
	rm -rf extramods
	rm -rf nodes/meme-common.xml  nodes/meme-server.xml

