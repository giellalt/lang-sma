## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# always build . last here, and tagsets have to be built after morphology
SUBDIRS = phonology morphology filters phonetics hyphenation orthography syntax transcriptions tagsets .

####### Automake targets: ########

# Define target variables first, before assigning to them:
GT_ANALYSERS=
GT_GENERATORS=

#### Local modifications in *fst processing: ####
####
#### Copy the fallback targets, and rename them to the desired targets. Then:
#### Replace the 'cp' command (Xerox) / Prepend the hfst-invert command (Hfst -
#### remember to move the $<) with whatever you need to complete
#### the processing to get the final target transducer.
#### Remember to add the dependencies as well.
#### Also make sure that HFST and Xerox processing are the same.
####
#### If you add new transducers to be built, you need to add them to the
#### relevant variable, e.g.:
####
#### if CAN_HFST
#### GT_GENERATORS+=generator-oahpa-gt-norm.hfst
#### endif
####
#### NB!!!! The HFST targets should get a hyphen after 'analyser'/'generator'
#### respectively, to make the local targets minimally different from and
#### slightly more specific than the fallback targets. This is to avoid warnings
#### about duplicate targets. That is, the local targets should looke like:
####
#### analyser-%.hfst: analyser-%.tmp.hfst
#### generator-%.hfst: generator-%.tmp.hfst

##################################################################
#### BEGIN: Add local processing instructions BELOW this line ####
##################################################################

########################################################
#### Add language-specific transducer targets here: ####

#### Xerox transducers:
if CAN_XFST
GT_ANALYSERS+=
GT_GENERATORS+=
endif # CAN_XFST

#### HFST transducers
if CAN_HFST
GT_ANALYSERS+=
GT_GENERATORS+=
endif # CAN_HFST

#### FOMA transducers
if CAN_FOMA
GT_ANALYSERS+=
GT_GENERATORS+=
endif # CAN_FOMA

#################################################
#### Add language-specific build rules here: ####

# The SMA morphology has some extra tags used for testing that we want to
# remove:
generator-raw-gt-desc.hfst: generator-raw-gt-desc.tmp.hfst \
				filters/remove-test-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
				@\"filters/remove-test-tags.hfst\" \
			.o. @\"$<\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) -S --xerox-composition=ON \
		> $@

analyser-raw-gt-desc.xfst: analyser-raw-gt-desc.tmp.xfst \
				filters/remove-test-tags.xfst
	$(AM_V_XFST)$(PRINTF) "read regex \
				@\"filters/remove-test-tags.xfst\" \
			.o. @\"$<\" \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

# Dict-fst local modifications and language-specific changes:
generator-dict-gt-norm.hfst: generator-dict-gt-norm.tmp.hfst \
					filters/remove-number-string-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF)                                "\
				@\"filters/remove-number-string-tags.hfst\"  \
			.o. @\"$<\"                                      \
			;" \
		| $(HFST_REGEXP2FST) $(VERBOSITY) $(HFST_FLAGS) -S --xerox-composition=ON \
		> $@

generator-dict-gt-norm.xfst: generator-dict-gt-norm.tmp.xfst \
					filters/make-optional-variant-tags.xfst  \
					filters/remove-number-string-tags.xfst
	$(AM_V_XFST)$(PRINTF)                        "read regex \
				@\"filters/remove-number-string-tags.xfst\"  \
			.o. @\"$<\"                                      \
			;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

include $(top_srcdir)/am-shared/src-dir-include.am
