## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

# order is always . last here
SUBDIRS = phonology morphology filters phonetics hyphenation orthography syntax transcriptions .

####### Automake targets: ########

if CAN_HFST
GT_ANALYSERS_HFST=analyser-gt-desc.hfst analyser-gt-norm.hfst
GT_GENERATORS_HFST=generator-gt-desc.hfst generator-gt-norm.hfst
GT_TRANSFORMERS_HFST=transcriptor-clock2text-desc.hfst \
					 transcriptor-date2text-desc.hfst \
					 transcriptor-numbers2text-desc.hfst
endif

if CAN_XFST
GT_ANALYSERS_XFST=analyser-gt-desc.xfst analyser-gt-norm.xfst
GT_GENERATORS_XFST=generator-gt-desc.xfst generator-gt-norm.xfst
GT_TRANSFORMERS_XFST=transcriptor-clock2text-desc.xfst \
					 transcriptor-date2text-desc.xfst \
					 transcriptor-numbers2text-desc.xfst
endif

if WANT_OAHPA
if CAN_HFST
GT_GENERATORS_HFST+=generator-oahpa-gt-norm.hfst
endif # CAN_HFST
if CAN_XFST
GT_GENERATORS_XFST+=generator-oahpa-gt-norm.xfst
endif # CAN_XFST
endif # WANT_OAHPA

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
#### GT_GENERATORS_HFST+=generator-oahpa-gt-norm.hfst
#### endif
####
#### NB!!!! The HFST targets should get a hyphen after 'analyser'/'generator'
#### respectively, to make the local targets minimally different from and
#### slightly more specific than the fallback targets. This is to avoid warnings
#### about duplicate targets. That is, the local targets should looke like:
####
#### analyser-%.hfst: analyser-%.tmp.hfst
#### generator-%.hfst: generator-%.tmp.hfst

####### Automake targets: ########

if CAN_HFST
GT_ANALYSERS_HFST=analyser-gt-desc.hfst analyser-gt-norm.hfst
GT_GENERATORS_HFST=generator-gt-desc.hfst generator-gt-norm.hfst
GT_TRANSFORMERS_HFST=transcriptor-clock2text-desc.hfst \
					 transcriptor-date2text-desc.hfst \
					 transcriptor-numbers2text-desc.hfst
endif

if CAN_XFST
GT_ANALYSERS_XFST=analyser-gt-desc.xfst analyser-gt-norm.xfst
GT_GENERATORS_XFST=generator-gt-desc.xfst generator-gt-norm.xfst
GT_TRANSFORMERS_XFST=transcriptor-clock2text-desc.xfst \
					 transcriptor-date2text-desc.xfst \
					 transcriptor-numbers2text-desc.xfst
endif

if WANT_OAHPA
if CAN_XFST
GT_GENERATORS_XFST+=generator-oahpa-gt-norm.xfst
endif # CAN_XFST
endif # WANT_OAHPA

#### BEGIN: Add local processing instructions BELOW this line ####

# Add language-specific transducer targets here:
# Xerox transducers:
if CAN_XFST
GT_ANALYSERS_XFST+=analyser-dict-gt-desc.xfst
GT_GENERATORS_XFST+=generator-dict-gt-norm.xfst
endif
# HFST transducers
if CAN_HFST
GT_ANALYSERS_HFST+=
GT_GENERATORS_HFST+=
endif

# The SMA morphology has some extra tags used for testing that we want to
# remove.
analyser-%.hfst: analyser-%.tmp.hfst \
				filters/remove-test-tags.hfst
	$(AM_V_GEN)$(HFST_COMPOSE) $(HFST_FLAGS) -F -2 $< \
			-1 filters/remove-test-tags.hfst \
		| $(HFST_INVERT) \
		| $(HFST_FST2FST) $(HFST_FLAGS) -f olw -o $@

analyser-%.xfst: analyser-%.tmp.xfst \
				filters/remove-test-tags.xfst
	$(AM_V_GEN)$(PRINTF) "read regex \
				@\"filters/remove-test-tags.xfst\" \
			.o. @\"$<\" ;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) -q

# And also for the generator:
generator-%.hfst: generator-%.tmp.hfst \
				filters/remove-test-tags.hfst
	$(AM_V_GEN)$(HFST_COMPOSE) $(HFST_FLAGS) -F $< \
			-1 filters/remove-test-tags.hfst \
		| $(HFST_FST2FST) $(HFST_FLAGS) -f olw -o $@

generator-%.xfst: generator-%.tmp.xfst \
				filters/remove-test-tags.xfst
	$(AM_V_GEN)$(PRINTF) "read regex \
				@\"$<\" \
			.o. @\"filters/remove-test-tags.xfst\".i \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) -q

# First attempt at building dictionary fsts. The analyser differs from the
# regular analyser by NOT removing variant and homonym tags.
analyser-dict-gt-desc.xfst: analyser-raw-gt-desc.xfst \
					filters/remove-derivation-position-tags.xfst \
					filters/remove-dialect-tags.xfst \
					filters/remove-norm-comp-tags.xfst \
					filters/remove-usage-tags.xfst \
					filters/remove-morph-borders.xfst \
					orthography/inituppercase.xfst \
					orthography/spellrelax.xfst
	$(AM_V_GEN)$(PRINTF) "read regex \
				@\"filters/remove-derivation-position-tags.xfst\" \
			.o. @\"filters/remove-dialect-tags.xfst\" \
			.o. @\"filters/remove-norm-comp-tags.xfst\" \
			.o. @\"filters/remove-usage-tags.xfst\" \
			.o. @\"$<\" \
			.o. @\"filters/remove-morph-borders.xfst\" \
			.o. @\"orthography/inituppercase.xfst\" \
			.o. @\"orthography/spellrelax.xfst\" \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) -q

# The generator does NOT include NG and NGminip tagged strings, since we do
# not want them in the miniparadigms generated by this transducer. At the same
# time, this transducer DOES CONTAIN the homonym and variant tags, to govern
# proper paradigm generation:
generator-dict-gt-norm.xfst: analyser-raw-gt-desc.xfst \
					filters/make-optional-semantic-tags.xfst \
					filters/make-optional-transitivity-tags.xfst \
					filters/remove-derivation-position-tags.xfst \
					filters/remove-dialect-tags.xfst \
					filters/remove-morph-borders.xfst \
					filters/remove-norm-comp-tags.xfst \
					filters/remove-usage-tags.xfst \
					filters/remove-NGminip-strings.xfst \
					filters/remove-NG-strings.xfst \
					filters/remove-sub-forms.xfst
	$(AM_V_GEN)$(PRINTF) "read regex \
				@\"filters/make-optional-semantic-tags.xfst\" \
			.o. @\"filters/make-optional-transitivity-tags.xfst\" \
			.o. @\"filters/remove-derivation-position-tags.xfst\" \
			.o. @\"filters/remove-dialect-tags.xfst\" \
			.o. @\"filters/remove-norm-comp-tags.xfst\" \
			.o. @\"filters/remove-usage-tags.xfst\" \
			.o. @\"filters/remove-NG-strings.xfst\" \
			.o. @\"filters/remove-NGminip-strings.xfst\" \
			.o. @\"filters/remove-sub-forms.xfst\" \
			.o. @\"$<\" \
			.o. @\"filters/remove-morph-borders.xfst\" ;\n\
		 invert net\n\
		 save stack $@\n\
		 quit\n" | $(XFST)


#### END: Add local processing instructions ABOVE this line ######

#### HFST transducer fallback target:
#### - inversion is needed FOR THE ANALYSER because the hfst model is upside
#### down compared to Xerox AT APPLICATION TIME. The other command makes the
#### final transducer ready for use.
analyser%.hfst: analyser%.tmp.hfst
	$(AM_V_GEN)$(HFST_INVERT) $< \
		| $(HFST_FST2FST) $(HFST_FLAGS) -f olw -o $@

generator%.hfst: generator%.tmp.hfst
	$(AM_V_GEN)$(HFST_FST2FST) $(HFST_FLAGS) -f olw -i $< -o $@

#### Xerox transducer fallback target:
%.xfst: %.tmp.xfst
	$(AM_V_GEN)cp -f $< $@

include $(top_srcdir)/am-shared/topdir-include.am
