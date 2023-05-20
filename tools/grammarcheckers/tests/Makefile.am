## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

######## Test targets: ###########

if WANT_GRAMCHECK

# List here (space separated) all yaml files to be run as part of make check:
TESTS=\
	Adpos_Kasus.yaml                            \
	Adverb_Verb.yaml                            \
	Congr_Pl.yaml                               \
	Elativ_Genitiv_Draft.yaml                   \
	Kongr_Subject_Verbal.yaml                   \
	Trans_Intrans_Object.yaml                   \
	agreement.yaml                              \
	candidates-msyn-adj-attr-pred.yaml          \
	candidates-msyn-adj-pred-attr.yaml          \
	candidates-msyn-agr-other-sg1.yaml          \
	candidates-msyn-pass-active.yaml            \
	msyn_Negation_Pret.yaml                     \
	msyn_Passiv.yaml                            \
	msyn_Predikativ_Infinitiv_konstruksjon.yaml \
	msyn_REL_PRON_mij.yaml                      \
	msyn_SYN_Delete_akte.yaml                   \
	msyn_Syn_Attr_Pred.yaml                     \
	msyn_Syn_Congr.yaml                         \
	msyn_Syn_Pred_Attr.yaml                     \
	msyn_Syn_Prep_Congr.yaml                    \
	msyn_Syn_gaaabpa_Comp.yaml                  \
	msyn_TALLORD.yaml                           \
	msyn_pass_lgidh_sidh_Ack_Nom.yaml

# List tests that are presently (expected) failures here, ie things that should
# be fixed *later*, but is not critical at the moment:
XFAIL_TESTS=\
	Adpos_Kasus.yaml                            \
	Adverb_Verb.yaml                            \
	Congr_Pl.yaml                               \
	Elativ_Genitiv_Draft.yaml                   \
	Kongr_Subject_Verbal.yaml                   \
	Trans_Intrans_Object.yaml                   \
	agreement.yaml                              \
	candidates-msyn-adj-attr-pred.yaml          \
	candidates-msyn-adj-pred-attr.yaml          \
	candidates-msyn-agr-other-sg1.yaml          \
	candidates-msyn-pass-active.yaml            \
	msyn_Negation_Pret.yaml                     \
	msyn_Passiv.yaml                            \
	msyn_Predikativ_Infinitiv_konstruksjon.yaml \
	msyn_REL_PRON_mij.yaml                      \
	msyn_SYN_Delete_akte.yaml                   \
	msyn_Syn_Attr_Pred.yaml                     \
	msyn_Syn_Congr.yaml                         \
	msyn_Syn_Pred_Attr.yaml                     \
	msyn_Syn_Prep_Congr.yaml                    \
	msyn_Syn_gaaabpa_Comp.yaml                  \
	msyn_TALLORD.yaml                           \
	msyn_pass_lgidh_sidh_Ack_Nom.yaml



endif # WANT_GRAMCHECK
# passes: agreement.yaml

#### Do NOT edit below here: ####
include $(top_srcdir)/../giella-core/am-shared/tools-grammarcheckers-tests-dir-include.am
