## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# The current dir must be built first.
SUBDIRS = . fstbased listbased

#########################################
# BEGIN: Local processing
#
# Target template:
#
# generator-speller-gt-norm.hfst: generator-speller-gt-norm.tmp.hfst
#	build rules
#
# analyser-speller-gt-norm.xfst: analyser-speller-gt-norm.tmp.xfst
#	build rules

# Language specific processing of speller fst's:
generator-speller-gt-norm.hfst: analyser-speller-gt-norm.tmp.hfst \
		$(top_builddir)/src/filters/remove-rel_focus-strings.hfst \
		$(top_builddir)/src/filters/remove-homonymy-tags.hfst     \
		$(top_builddir)/src/filters/remove-test-tags.hfst
	$(AM_V_HXFST)$(PRINTF) "read regex                                        \
			@\"$(top_builddir)/src/filters/remove-rel_focus-strings.hfst\"    \
		.o. @\"$(top_builddir)/src/filters/remove-homonymy-tags.hfst\"        \
		.o. @\"$(top_builddir)/src/filters/remove-test-tags.hfst\"            \
		.o. @\"$<\" \
		; \n\
		save stack $@\n\
		quit\n" | $(HFST_XFST) -p $(VERBOSITY)

analyser-speller-gt-norm.hfst: analyser-speller-gt-norm.tmp.hfst  \
		$(top_builddir)/src/filters/remove-rel_focus-strings.hfst \
		$(top_builddir)/src/filters/remove-homonymy-tags.hfst     \
		$(top_builddir)/src/filters/remove-test-tags.hfst         \
		$(top_builddir)/src/filters/remove-hyphenation-marks.hfst \
		$(top_builddir)/src/filters/remove-infl_deriv-borders.hfst
	$(AM_V_HXFST)$(PRINTF) "read regex                                        \
			@\"$(top_builddir)/src/filters/remove-rel_focus-strings.hfst\"    \
		.o. @\"$(top_builddir)/src/filters/remove-homonymy-tags.hfst\"        \
		.o. @\"$(top_builddir)/src/filters/remove-test-tags.hfst\"            \
		.o. @\"$<\" \
		.o. @\"$(top_builddir)/src/filters/remove-hyphenation-marks.hfst\"    \
		.o. @\"$(top_builddir)/src/filters/remove-infl_deriv-borders.hfst\"   \
		; \n\
		invert \n\
		save stack $@\n\
		quit\n" | $(HFST_XFST) -p $(VERBOSITY)

analyser-speller-gt-norm.xfst: analyser-speller-gt-norm.tmp.xfst  \
		$(top_builddir)/src/filters/remove-rel_focus-strings.xfst \
		$(top_builddir)/src/filters/remove-homonymy-tags.xfst     \
		$(top_builddir)/src/filters/remove-test-tags.xfst         \
		$(top_builddir)/src/filters/remove-hyphenation-marks.xfst \
		$(top_builddir)/src/filters/remove-infl_deriv-borders.xfst
	$(AM_V_XFST)$(PRINTF)                        "read regex \
			@\"$(top_builddir)/src/filters/remove-rel_focus-strings.xfst\"    \
		.o. @\"$(top_builddir)/src/filters/remove-homonymy-tags.xfst\"        \
		.o. @\"$(top_builddir)/src/filters/remove-test-tags.xfst\"            \
		.o. @\"$<\" \
		.o. @\"$(top_builddir)/src/filters/remove-hyphenation-marks.xfst\"    \
		.o. @\"$(top_builddir)/src/filters/remove-infl_deriv-borders.xfst\"   \
		;\n\
	 save stack $@\n\
	 quit\n" | $(XFST) $(VERBOSITY)

generator-speller-gt-norm.xfst: analyser-speller-gt-norm.tmp.xfst \
		$(top_builddir)/src/filters/remove-rel_focus-strings.xfst \
		$(top_builddir)/src/filters/remove-homonymy-tags.xfst     \
		$(top_builddir)/src/filters/remove-test-tags.xfst
	$(AM_V_XFST)$(PRINTF)                        "read regex \
			@\"$(top_builddir)/src/filters/remove-rel_focus-strings.xfst\"    \
		.o. @\"$(top_builddir)/src/filters/remove-homonymy-tags.xfst\"        \
		.o. @\"$(top_builddir)/src/filters/remove-test-tags.xfst\"            \
		.o. @\"$<\" \
		;\n\
	invert net\n\
	save stack $@\n\
	quit\n" | $(XFST) $(VERBOSITY)

analyser-speller-gt-norm.foma: analyser-speller-gt-norm.tmp.foma  \
		$(top_builddir)/src/filters/remove-rel_focus-strings.foma \
		$(top_builddir)/src/filters/remove-homonymy-tags.foma     \
		$(top_builddir)/src/filters/remove-test-tags.foma         \
		$(top_builddir)/src/filters/remove-hyphenation-marks.foma \
		$(top_builddir)/src/filters/remove-infl_deriv-borders.foma
	$(AM_V_XFST)$(PRINTF)                        "read regex \
			@\"$(top_builddir)/src/filters/remove-rel_focus-strings.foma\"    \
		.o. @\"$(top_builddir)/src/filters/remove-homonymy-tags.foma\"        \
		.o. @\"$(top_builddir)/src/filters/remove-test-tags.foma\"            \
		.o. @\"$<\" \
		.o. @\"$(top_builddir)/src/filters/remove-hyphenation-marks.foma\"    \
		.o. @\"$(top_builddir)/src/filters/remove-infl_deriv-borders.foma\"   \
		;\n\
	 save stack $@\n\
	 quit\n" | $(FOMA) $(VERBOSITY)

generator-speller-gt-norm.foma: analyser-speller-gt-norm.tmp.foma \
		$(top_builddir)/src/filters/remove-rel_focus-strings.foma \
		$(top_builddir)/src/filters/remove-homonymy-tags.foma     \
		$(top_builddir)/src/filters/remove-test-tags.foma
	$(AM_V_XFST)$(PRINTF)                        "read regex \
			@\"$(top_builddir)/src/filters/remove-rel_focus-strings.foma\"    \
		.o. @\"$(top_builddir)/src/filters/remove-homonymy-tags.foma\"        \
		.o. @\"$(top_builddir)/src/filters/remove-test-tags.foma\"            \
		.o. @\"$<\" \
		;\n\
	invert net\n\
	save stack $@\n\
	quit\n" | $(FOMA) $(VERBOSITY)

# END: Local processing
#########################################

include $(top_srcdir)/am-shared/tools-spellcheckers-dir-include.am
