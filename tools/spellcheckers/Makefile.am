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
generator-speller-gt-norm.hfst: generator-speller-gt-norm.tmp.hfst \
		$(top_builddir)/src/filters/remove-illegal-derivation-strings.hfst \
		$(top_builddir)/src/filters/remove-rel_focus-strings.hfst \
		$(top_builddir)/src/filters/remove-homonymy-tags.hfst \
		$(top_builddir)/src/filters/remove-test-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
			@\"$(top_builddir)/src/filters/remove-illegal-derivation-strings.hfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-rel_focus-strings.hfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-homonymy-tags.hfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-test-tags.hfst\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

analyser-speller-gt-norm.xfst: analyser-speller-gt-norm.tmp.xfst \
		$(top_builddir)/src/filters/remove-illegal-derivation-strings.xfst \
		$(top_builddir)/src/filters/remove-rel_focus-strings.xfst \
		$(top_builddir)/src/filters/remove-homonymy-tags.xfst \
		$(top_builddir)/src/filters/remove-test-tags.xfst
	$(AM_V_XFST)$(PRINTF)                        "read regex \
			@\"$(top_builddir)/src/filters/remove-illegal-derivation-strings.xfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-rel_focus-strings.xfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-homonymy-tags.xfst\" \
		.o. @\"$(top_builddir)/src/filters/remove-test-tags.xfst\" \
		;\n\
	 save stack $@\n\
	 quit\n" | $(XFST) $(VERBOSITY)

# END: Local processing
#########################################

include $(top_srcdir)/am-shared/tools-spellcheckers-dir-include.am
