## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	Adpos_Kasus-FAIL.yaml \
	Adverb_Verb-FAIL.yaml \
	Adverb_Verb-PASS.yaml \
	agreement-PASS.yaml \
	candidates-msyn-adj-attr-pred-FAIL.yaml \
	candidates-msyn-adj-attr-pred-PASS.yaml \
	candidates-msyn-adj-pred-attr-FAIL.yaml \
	candidates-msyn-adj-pred-attr-PASS.yaml \
	candidates-msyn-agr-other-sg1-FAIL.yaml \
	candidates-msyn-agr-other-sg1-PASS.yaml \
	candidates-msyn-pass-active-FAIL.yaml \
	candidates-msyn-pass-active-PASS.yaml \
	Congr_Pl-FAIL.yaml \
	Elativ_Genitiv_Draft-FAIL.yaml \
	Kongr_Subject_Verbal-FAIL.yaml \
	Kongr_Subject_Verbal-PASS.yaml \
	msyn_KasusValens-FAIL.yaml \
	msyn_KasusValens-PASS.yaml \
	msyn_Negation_Pret-FAIL.yaml \
	msyn_Negation_Pret-PASS.yaml \
	msyn_pass_lgidh_sidh_Ack_Nom-FAIL.yaml \
	msyn_pass_lgidh_sidh_Ack_Nom-PASS.yaml \
	msyn_Passiv-FAIL.yaml \
	msyn_Predikativ_Infinitiv_konstruksjon-FAIL.yaml \
	msyn_Predikativ_Infinitiv_konstruksjon-PASS.yaml \
	msyn_REL_PRON_mij-FAIL.yaml \
	msyn_Syn_Attr_Pred-FAIL.yaml \
	msyn_Syn_Attr_Pred-PASS.yaml \
	msyn_Syn_Congr-FAIL.yaml \
	msyn_SYN_Delete_akte-FAIL.yaml \
	msyn_SYN_Delete_akte-PASS.yaml \
	msyn_Syn_gaaabpa_Comp-PASS.yaml \
	msyn_Syn_Pred_Attr-FAIL.yaml \
	msyn_Syn_Pred_Attr-PASS.yaml \
	msyn_Syn_Prep_Congr-FAIL.yaml \
	msyn_TALLORD-FAIL.yaml \
	msyn-agr-other-sg1-FAIL.yaml \
	msyn-agr-other-sg1-PASS.yaml \
	msyn-aux-vfin-inf-FAIL.yaml \
	msyn-aux-vfin-inf-PASS.yaml \
	msyn-demphrase-congruence-plnom-FAIL.yaml \
	msyn-Neg-VFinitt-ConNeg-FAIL.yaml \
	msyn-numphrase-congruence-plnom-PASS.yaml \
	msyn-rel-mij-gie-FAIL.yaml \
	syn-delete-adv-phrasal-verb-FAIL.yaml \
	syn-delete-adv-phrasal-verb-PASS.yaml \
	syn-wo-verb_advl-advl_verb-FAIL.yaml \
	Trans_Intrans_Object-FAIL.yaml \
	various-PASS.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=\
	Adpos_Kasus-FAIL.yaml \
	Adverb_Verb-FAIL.yaml \
	candidates-msyn-adj-attr-pred-FAIL.yaml \
	candidates-msyn-adj-pred-attr-FAIL.yaml \
	candidates-msyn-agr-other-sg1-FAIL.yaml \
	candidates-msyn-pass-active-FAIL.yaml \
	Congr_Pl-FAIL.yaml \
	Elativ_Genitiv_Draft-FAIL.yaml \
	Kongr_Subject_Verbal-FAIL.yaml \
	msyn_KasusValens-FAIL.yaml \
	msyn_Negation_Pret-FAIL.yaml \
	msyn_pass_lgidh_sidh_Ack_Nom-FAIL.yaml \
	msyn_Passiv-FAIL.yaml \
	msyn_Predikativ_Infinitiv_konstruksjon-FAIL.yaml \
	msyn_REL_PRON_mij-FAIL.yaml \
	msyn_Syn_Attr_Pred-FAIL.yaml \
	msyn_Syn_Congr-FAIL.yaml \
	msyn_SYN_Delete_akte-FAIL.yaml \
	msyn_Syn_Pred_Attr-FAIL.yaml \
	msyn_Syn_Prep_Congr-FAIL.yaml \
	msyn_TALLORD-FAIL.yaml \
	msyn-agr-other-sg1-FAIL.yaml \
	msyn-aux-vfin-inf-FAIL.yaml \
	msyn-demphrase-congruence-plnom-FAIL.yaml \
	msyn-Neg-VFinitt-ConNeg-FAIL.yaml \
	msyn-numphrase-congruence-sggen-FAIL.yaml \
	msyn-rel-mij-gie-FAIL.yaml \
	syn-delete-adv-phrasal-verb-FAIL.yaml \
	syn-wo-verb_advl-advl_verb-FAIL.yaml \
	Trans_Intrans_Object-FAIL.yaml

endif # WANT_GRAMCHECK

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
include $(top_srcdir)/../giella-core/am-shared/devtest-include.am
