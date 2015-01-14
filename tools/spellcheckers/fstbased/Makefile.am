## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# The current dir must be built first.
SUBDIRS = . hfst foma


generator-%.hfst: generator-%.tmp.hfst
	$(AM_V_HXFST)$(PRINTF) "read regex \
			[ \"@U.CmpFirst.TRUE@\" <- \"+CmpN/First\", \
			  \"@P.CmpFirst.TRUE@\" <- \"+CmpN/Pref\", \
			  \"@P.CmpLast.TRUE@\"  <- \"+CmpN/Last\", \
			  \"@U.CmpOnly.TRUE@\"  <- \"+CmpN/Only\", \
			  \"@D.CmpNone.FALSE@\" <- \"+CmpN/None\" ] \
			.o. @\"$<\" \
			; \n\
		 twosided flag-diacritics\n\
		 save stack $@\n\
		 quit\n" | $(HFST_XFST) -p $(VERBOSITY)

analyser-%.xfst: analyser-%.tmp.xfst
	$(AM_V_XFST)$(PRINTF) "read regex \
			[ \"@U.CmpFirst.TRUE@\" <- \"+CmpN/First\", \
			  \"@P.CmpFirst.TRUE@\" <- \"+CmpN/Pref\", \
			  \"@P.CmpLast.TRUE@\"  <- \"+CmpN/Last\", \
			  \"@U.CmpOnly.TRUE@\"  <- \"+CmpN/Only\", \
			  \"@D.CmpNone.FALSE@\" <- \"+CmpN/None\" ] \
			.o. @\"$<\" \
			; \n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

include $(top_srcdir)/am-shared/tools-spellcheckers-fstbased-dir-include.am
