## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	Adverb_Verb-PASS.yaml \
	agreement-PASS.yaml \
	candidates-msyn-adj-attr-pred-PASS.yaml \
	candidates-msyn-adj-pred-attr-PASS.yaml \
	candidates-msyn-agr-other-sg1-PASS.yaml \
	candidates-msyn-pass-active-PASS.yaml \
	Kongr_Subject_Verbal-PASS.yaml \
	msyn_KasusValens-PASS.yaml \
	msyn_Negation_Pret-PASS.yaml \
	msyn_pass_lgidh_sidh_Ack_Nom-PASS.yaml \
	msyn_Predikativ_Infinitiv_konstruksjon-PASS.yaml \
	msyn_Syn_Attr_Pred-PASS.yaml \
	msyn_SYN_Delete_akte-PASS.yaml \
	msyn_Syn_gaaabpa_Comp-PASS.yaml \
	msyn_Syn_Pred_Attr-PASS.yaml \
	msyn-agr-other-sg1-PASS.yaml \
	msyn-aux-vfin-inf-PASS.yaml \
	msyn-numphrase-congruence-plnom-PASS.yaml \
	syn-delete-adv-phrasal-verb-PASS.yaml \
	various-PASS.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=
endif # WANT_GRAMCHECK

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
