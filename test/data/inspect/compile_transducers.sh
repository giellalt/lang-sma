#!/bin/bash
# list of transducers used for inspecting typos and their corrections

for typo in add1 one2double del1 double2one transpose transpose1 aab2abb repetition subst1 subst1_kb_next subst_accents subst_accents_sz insert_space capitalize loansuffix vowels acrosuff samisuffix
do
  hfst-regexp2fst --format=openfst-tropical -v -S -i ${typo}.regex -o ${typo}.hfst
done

# combine transposition1 with a likely typo
printf "read regex [ @\"transpose1.hfst\" .o. [@\"transpose1.hfst\" | @\"double2one.hfst\" | @\"one2double.hfst\" ]]; \
save stack transpose1_plus.hfst\n\
quit\n" | hfst-xfst

# combine accented letter and vowel errors with a likely typo
printf "read regex [ [@\"subst_accents.hfst\" | @\"subst_accents_sz.hfst\" | @\"vowels.hfst\"] .o. [@\"transpose1.hfst\" | @\"double2one.hfst\" | @\"one2double.hfst\" ]]; \
save stack accents_plus.hfst\n\
quit\n" | hfst-xfst

# combine phone length errors: double, single, weak, strong
printf "read regex [ [@\"double2one.hfst\" | @\"one2double.hfst\" ] .o. [@\"double2one.hfst\" | @\"one2double.hfst\" ]]; \
save stack length_plus.hfst\n\
quit\n" | hfst-xfst

