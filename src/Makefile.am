## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

SUBDIRS = fst cg3

#################################################
#### Add language-specific build rules here: ####

# The SMA morphology has some extra tags used for testing that we want to
# remove:
# Hfst - add weights to compounds:
if WITH_OFST_TROPICAL
generator-raw-gt-desc.hfst: generator-raw-gt-desc.tmp.hfst \
				filters/remove-test-tags.hfst
#	$(AM_V_RGX2FST)$(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS)
	$(AM_V_RGX2FST)$(PRINTF) "\
				@\"filters/remove-test-tags.hfst\" \
			.o. @\"$<\" \
			.o. @\"filters/change-optionally-word_boundary_to_hyphen.hfst\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) $(HFST_FORMAT) \
			-S --xerox-composition=ON \
		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
			-S '+Cmp' -a 10 --arcs-only \
		| $(HFST_REWEIGHT) $(MORE_VERBOSITY) $(HFST_FLAGS) \
			-S '-' -a 10 --arcs-only \
		> $@
else
generator-raw-gt-desc.hfst: generator-raw-gt-desc.tmp.hfst \
				filters/remove-test-tags.hfst
	$(AM_V_RGX2FST)$(PRINTF) "\
				@\"filters/remove-test-tags.hfst\" \
			.o. @\"$<\" \
			.o. @\"filters/change-optionally-word_boundary_to_hyphen.hfst\" \
			;" \
		| $(HFST_REGEXP2FST) $(HFST_FLAGS) $(HFST_FORMAT) \
			-S --xerox-composition=ON \
		> $@
endif

# Xerox & Foma:
analyser-raw-gt-desc.xfst\
analyser-raw-gt-desc.foma:\
analyser-raw-gt-desc.%: analyser-raw-gt-desc.tmp.% \
				filters/remove-test-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-test-tags.$*\" \
			.o. @\"$<\" \
			.o. @\"filters/change-optionally-word_boundary_to_hyphen.$*\" \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# We need to add processing of language-specific tags in the analysers:
analyser-gt-desc.hfst\
analyser-gt-desc.foma\
analyser-gt-desc.hfst: \
analyser-gt-desc.%: analyser-gt-desc.tmp.%                    \
					filters/remove-norm-comp-tags.%           \
					filters/remove-derivation-position-tags.% \
					filters/remove-DNorm-tags.% \
					filters/remove-usage-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-usage-tags.$*\"               \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-DNorm-tags.$*\"               \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# We need to add processing of language-specific tags in the analysers:
analyser-dict-gt-desc.hfst\
analyser-dict-gt-desc.foma\
analyser-dict-gt-desc.xfst:\
analyser-dict-gt-desc.%: analyser-dict-gt-desc.tmp.%          \
					filters/remove-norm-comp-tags.%           \
					filters/remove-derivation-position-tags.% \
					filters/remove-DNorm-tags.% \
					filters/remove-usage-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-usage-tags.$*\"               \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-DNorm-tags.$*\"               \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)


# ... and also to the normative analysers:
analyser-gt-norm.hfst\
analyser-gt-norm.foma:\
analyser-gt-norm.%: analyser-gt-norm.tmp.% \
					filters/remove-derivation-position-tags.%              \
					filters/remove-illegal-derivation-strings-flagbased.%  \
					filters/remove-MinusSpell-strings.%                    \
					filters/insert-default-compounding-tags.%              \
					filters/insert-default_left_compounding-tags.%         \
					filters/block-illegal_compound-strings.%               \
					filters/split-CmpN-tags.%                              \
					filters/convert_to_flags-CmpNP-tags.%                  \
					filters/split-CmpNP-tags.%                             \
					filters/remove-DNorm-tags.% \
					filters/remove-usage-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-usage-tags.$*\"                           \
			.o. @\"filters/remove-derivation-position-tags.$*\"             \
			.o. @\"filters/block-illegal_compound-strings.$*\"              \
			.o. @\"filters/split-CmpN-tags.$*\"                             \
			.o. @\"filters/insert-default_left_compounding-tags.$*\"        \
			.o. @\"filters/insert-default-compounding-tags.$*\"             \
			.o. @\"filters/remove-illegal-derivation-strings-flagbased.$*\" \
			.o. @\"filters/convert_to_flags-CmpNP-tags.$*\"                 \
			.o. @\"filters/split-CmpNP-tags.$*\"                            \
			.o. @\"filters/remove-MinusSpell-strings.$*\"                   \
			.o. @\"filters/remove-DNorm-tags.$*\"                           \
			.o. @\"$<\"                                                     \
			;\n\
		 twosided flag-diacritics\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# The Xerox analyser need special treatment due to bugs:
analyser-gt-norm.xfst: analyser-gt-norm.tmp.xfst \
					 filters/remove-norm-comp-tags.xfst             \
					 filters/remove-derivation-position-tags.xfst   \
					 filters/remove-illegal-derivation-strings.xfst \
					 filters/remove-DNorm-tags.xfst \
					filters/remove-usage-tags.xfst
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-usage-tags.xfst\"                 \
			.o. @\"filters/remove-derivation-position-tags.xfst\"   \
			.o. @\"filters/remove-norm-comp-tags.xfst\"             \
			.o. @\"filters/remove-illegal-derivation-strings.xfst\" \
			.o. @\"filters/remove-DNorm-tags.xfst\"                 \
			.o. @\"$<\"                                             \
			;\n\
		 save stack $@\n\
		 quit\n" | $(XFST) $(VERBOSITY)

# ... and also in the Oahpa analyser:
analyser-oahpa-gt-norm.hfst\
analyser-oahpa-gt-norm.foma\
analyser-oahpa-gt-norm.xfst:\
analyser-oahpa-gt-norm.%: analyser-gt-norm.tmp.% \
					 filters/remove-norm-comp-tags.%             \
					 filters/remove-derivation-position-tags.%   \
					 filters/remove-illegal-derivation-strings.% \
					 filters/remove-DNorm-tags.% \
					 filters/remove-usage-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
			    @\"filters/remove-usage-tags.$*\"                 \
			.o. @\"filters/remove-derivation-position-tags.$*\"   \
			.o. @\"filters/remove-norm-comp-tags.$*\"             \
			.o. @\"filters/remove-illegal-derivation-strings.$*\" \
			.o. @\"filters/remove-DNorm-tags.$*\"                 \
			.o. @\"$<\"                                           \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# ... as well as in the HFST Grammar Checker analyser:
# (keep the Err/SpaceCmp strings here)
analyser-gramcheck-gt-desc.hfst: analyser-gramcheck-gt-desc.tmp.hfst \
				filters/remove-norm-comp-tags.hfst                   \
				filters/remove-dialect-tags.hfst                     \
				filters/remove-derivation-position-tags.hfst         \
				filters/rename-POS_before_Der-tags.hfst              \
				filters/remove-word-boundary.hfst                    \
				filters/remove-DNorm-tags.hfst                       \
				filters/remove-usage-tags.hfst                       \
				filters/remove-usage-tags.hfst                       \
				orthography/spellrelax-with-flagtags.compose.hfst
	$(AM_V_HXFST)$(PRINTF) "\
	set encode-weights ON\n\
	read regex \
			@\"filters/remove-usage-tags.hfst\"               \
		.o. @\"filters/remove-derivation-position-tags.hfst\" \
		.o. @\"filters/remove-norm-comp-tags.hfst\"           \
		.o. @\"filters/remove-dialect-tags.hfst\"             \
		.o. @\"filters/rename-POS_before_Der-tags.hfst\"      \
		.o. @\"filters/remove-DNorm-tags.hfst\"               \
		.o. @\"$<\"                                           \
		.o. @\"orthography/spellrelax-with-flagtags.compose.hfst\" \
		.o. @\"filters/remove-word-boundary.hfst\"            \
		;\n\
	twosided flag-diacritics\n\
	invert net\n\
	save stack $@\n\
	quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)

# The pmatch disamb analyser. Filtering should be identical to the general
# disamb analyser below. Special target needed because of the filename.
analyser-pmatchdisamb-gt-desc.hfst\
analyser-pmatchdisamb-gt-desc.foma\
analyser-pmatchdisamb-gt-desc.xfst:\
analyser-pmatchdisamb-gt-desc.%: analyser-pmatchdisamb-gt-desc.tmp.% \
					filters/remove-orig_lang-tags.%           \
					filters/remove-dialect-tags.%             \
					filters/remove-norm-comp-tags.%           \
					filters/remove-homonymy-tags.%           \
					filters/remove-derivation-position-tags.% \
					filters/rename-POS_before_Der-tags.%      \
					filters/remove-DNorm-tags.% \
					filters/remove-usage-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-usage-tags.$*\"               \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-dialect-tags.$*\"             \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-homonymy-tags.$*\"           \
			.o. @\"filters/remove-orig_lang-tags.$*\"           \
			.o. @\"filters/rename-POS_before_Der-tags.$*\"      \
			.o. @\"filters/remove-DNorm-tags.$*\"               \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# ... as well as in the XEROX/FOMA disambiguation analyser
# (remove the Err/SpaceCmp thing here):
analyser-disamb-gt-desc.hfst\
analyser-disamb-gt-desc.foma\
analyser-disamb-gt-desc.xfst:\
analyser-disamb-gt-desc.%: analyser-disamb-gt-desc.tmp.% \
					filters/remove-orig_lang-tags.%           \
					filters/remove-dialect-tags.%             \
					filters/remove-norm-comp-tags.%           \
					filters/remove-homonymy-tags.%            \
					filters/remove-derivation-position-tags.% \
					filters/rename-POS_before_Der-tags.%      \
					filters/remove-DNorm-tags.%               \
					filters/remove-usage-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-usage-tags.$*\"               \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-dialect-tags.$*\"             \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/remove-homonymy-tags.$*\"            \
			.o. @\"filters/remove-orig_lang-tags.$*\"           \
			.o. @\"filters/rename-POS_before_Der-tags.$*\"      \
			.o. @\"filters/remove-DNorm-tags.$*\"               \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_HFST)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# We need to add processing of language-specific tags in the generator:
define giella_generators
generator-gt-%.$(1): generator-gt-%.tmp.$(1) \
					 filters/remove-norm-comp-tags.$(1)           \
					 filters/remove-derivation-position-tags.$(1) \
					 filters/remove-DNorm-tags.$(1)               \
					filters/remove-usage-tags.$(1)
	$$(AM_V_XFST_TOOL)$$(PRINTF) "read regex \
				@\"filters/remove-usage-tags.$(1)\"               \
			.o. @\"filters/remove-derivation-position-tags.$(1)\" \
			.o. @\"filters/remove-norm-comp-tags.$(1)\"           \
			.o. @\"filters/remove-DNorm-tags.$(1)\"               \
			.o. @\"$$<\"                                          \
			;\n\
		 $$(INVERT_XFST)$$(INVERT_FOMA)\
		 save stack $$@\n\
		 quit\n" | $$(XFST_TOOL)
endef
$(foreach fst,hfst xfst foma,$(eval $(call giella_generators,$(fst))))

# Dict-fst local modifications and language-specific changes:
generator-dict-gt-norm.hfst\
generator-dict-gt-norm.foma\
generator-dict-gt-norm.xfst:\
generator-dict-gt-norm.%: generator-dict-gt-norm.tmp.% \
					filters/remove-norm-comp-tags.%           \
					filters/remove-derivation-position-tags.% \
					filters/make-optional-variant-tags.%      \
					filters/remove-number-string-tags.%       \
					filters/remove-DNorm-tags.%               \
					filters/remove-usage-tags.%
	$(AM_V_XFST_TOOL)$(PRINTF) "read regex \
				@\"filters/remove-usage-tags.$*\"               \
			.o. @\"filters/remove-number-string-tags.$*\"       \
			.o. @\"filters/remove-derivation-position-tags.$*\" \
			.o. @\"filters/remove-norm-comp-tags.$*\"           \
			.o. @\"filters/make-optional-variant-tags.$*\"      \
			.o. @\"filters/remove-DNorm-tags.$*\"               \
			.o. @\"$<\"                                         \
			;\n\
		 $(INVERT_XFST)$(INVERT_FOMA)\
		 save stack $@\n\
		 quit\n" | $(XFST_TOOL)

# ... as well as in the HFST Grammar Checker generator:
generator-gramcheck-gt-norm.hfst: generator-gramcheck-gt-norm.tmp.hfst   \
				filters/remove-norm-comp-tags.hfst                       \
				filters/remove-derivation-position-tags.hfst             \
				filters/make-optional-grammatical-tags.hfst              \
				filters/block-illegal_compound-strings.hfst              \
				filters/split-CmpN-tags.hfst                             \
				filters/insert-default_left_compounding-tags.hfst        \
				filters/insert-default-compounding-tags.hfst             \
				filters/remove-illegal-derivation-strings-flagbased.hfst \
				filters/convert_to_flags-CmpNP-tags.hfst                 \
				filters/split-CmpNP-tags.hfst                            \
				filters/remove-usage-tags.hfst
	$(AM_V_HXFST)$(PRINTF) "\
	set encode-weights ON\n\
	read regex \
			@\"filters/remove-usage-tags.hfst\"               \
		.o. @\"filters/make-optional-grammatical-tags.hfst\"  \
		.o. @\"filters/remove-norm-comp-tags.hfst\"           \
		.o. @\"filters/remove-derivation-position-tags.hfst\" \
		.o. @\"filters/rename-POS_before_Der-tags.hfst\"      \
		.o. @\"filters/block-illegal_compound-strings.hfst\"       \
	.o. @\"filters/split-CmpN-tags.hfst\"                      \
	.o. @\"filters/insert-default_left_compounding-tags.hfst\" \
	.o. @\"filters/insert-default-compounding-tags.hfst\"      \
	.o. @\"filters/remove-illegal-derivation-strings-flagbased.hfst\" \
	.o. @\"filters/convert_to_flags-CmpNP-tags.hfst\"             \
	.o. @\"filters/split-CmpNP-tags.hfst\"                        \
		.o. @\"$<\"                                           \
		;\n\
	twosided flag-diacritics\n\
	save stack $@\n\
	quit\n" | $(HFST_XFST) -p $(MORE_VERBOSITY)


##################################################################
#### END: Add local processing instructions ABOVE this line ######
##################################################################

include $(top_srcdir)/../giella-core/am-shared/src-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
