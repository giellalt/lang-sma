## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# Process subdirs first:
SUBDIRS = filters tagsets .

##################################################################
#### BEGIN: Add local processing instructions BELOW this line ####
##################################################################

# Apertium-related language-specific targets:
analyser-mt-gt-desc.hfst: analyser-mt-gt-desc.tmp.hfst \
			$(top_builddir)/src/filters/remove-dialect-tags.hfst \
			$(top_builddir)/src/filters/remove-test-tags.hfst
	$(AM_V_GEN)$(PRINTF) "\
		@\"$(top_builddir)/src/filters/remove-dialect-tags.hfst\" \
	.o. @\"$(top_builddir)/src/filters/remove-test-tags.hfst\"    \
   	.o. @\"$<\" \
    	;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		| $(HFST_INVERT)
		> $@

# And also for the generator:
generator-mt-gt-norm.hfst: generator-mt-gt-norm.tmp.hfst \
			$(top_builddir)/src/filters/remove-Dial_L-strings.hfst \
			$(top_builddir)/src/filters/remove-dialect-tags.hfst   \
			$(top_builddir)/src/filters/remove-test-tags.hfst
	$(AM_V_GEN)$(PRINTF) "\
		@\"$(top_builddir)/src/filters/remove-dialect-tags.hfst\"   \
	.o. @\"$(top_builddir)/src/filters/remove-Dial_L-strings.hfst\" \
	.o. @\"$(top_builddir)/src/filters/remove-test-tags.hfst\"      \
   	.o. @\"$<\" \
    	;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --harmonize-flags \
		> $@

##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

####### Other targets: ###########

# cleaning
clean-local:
	-rm -f *.hfst *.gz *.cg3 *.bin

include $(top_srcdir)/am-shared/tools-mt-apertium-dir-include.am
