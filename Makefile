#
# $Id: Makefile,v 1.1 2012/06/30 02:11:10 nadya Exp $
#
# @Copyright@
# @Copyright@
#
# $Log: Makefile,v $
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
	    sed -i "s/MEMEVER/4.8.1/g" $$o; \
	done
	$(MAKE) roll

