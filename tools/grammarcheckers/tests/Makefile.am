## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	Adpos_Kasus.yaml \
	Adverb_Verb.yaml \
	Congr_Pl.yaml \
	Kongr_Subject_Verbal.yaml \
	Neg_Congr.yaml \
	REL_PRON_mij.yaml \
	SYN_Delete_akte.yaml \
	Syn_Attr_Pred.yaml \
	Syn_Congr.yaml \
	Syn_Prep_Congr.yaml \
	Syn_gaaabpa_Comp.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=\
	Adpos_Kasus.yaml \
	Adverb_Verb.yaml \
	Congr_Pl.yaml \
	Kongr_Subject_Verbal.yaml \
	Neg_Congr.yaml \
	REL_PRON_mij.yaml \
	SYN_Delete_akte.yaml \
	Syn_Attr_Pred.yaml \
	Syn_Congr.yaml \
	Syn_Prep_Congr.yaml



endif # WANT_GRAMCHECK
# passes: agreement.yaml

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
