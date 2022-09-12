## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	SYN_Delete_akte.yaml \
	Syn_Attr_Pred.yaml \
	REL_PRON_mij.yaml \
	Syn_Congr.yaml \
	Syn_gaaabpa_Comp.yaml \
	Adpos_Kasus.yaml \
	Congr_Pl.yaml \
	Neg_Congr.yaml \
	Syn_Prep_Congr.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=\
	SYN_Delete_akte.yaml \
	Syn_Attr_Pred.yaml \
	REL_PRON_mij.yaml \
	Syn_Congr.yaml \
	Adpos_Kasus.yaml \
	Congr_Pl.yaml \
	Neg_Congr.yaml \
	Syn_Prep_Congr.yaml



endif # WANT_GRAMCHECK
# passes: agreement.yaml

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
