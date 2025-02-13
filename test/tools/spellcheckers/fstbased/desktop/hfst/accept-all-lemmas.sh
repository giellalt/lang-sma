#!/bin/bash
# test/tools/spellcheckers/fstbased/desktop/hfst/accept-all-lemmas.sh.  Generated from accept-all-lemmas.sh.in by configure.

# Automake interprets the exit status as follows:
# - an exit status of 0 will denote a success
# - an exit status of 77 a skipped test
# - an exit status of 99 a hard error
# - any other exit status will denote a failure.

# To run this test script only, do:
#
# make check TESTS=accept-all-lemmas.sh

# This test script will test that all lemmas are accepted by the speller

###### Variables: #######
GIELLA_LANG=sma
ospell=/usr/local/bin/hfst-ospell
### in ###
source_files="${srcdir}/../../../../../../src/fst/morphology/stems/*.lexc \
             ../../../../../../src/fst/morphology/generated_files/smi-sma-a[bc]*.lexc
             ../../../../../../src/fst/morphology/generated_files/smi-sma-proper*.lexc"
speller_dir=./../../../../../../tools/spellcheckers

### out ###
lemmas=./filtered-lemmas.txt
rejected_lemmas=rejected_lemmas.txt
checked_lemmas=checked_lemmas.txt

##### Extract lemmas - add additional egrep pattern as parameters: #####
##### --include "(pattern1|pattern2|...)"                          #####
##### --exclude "(pattern1|pattern2|...)"                          #####
/Users/mka055/langtech/GitHub/giellalt/lang-sma/./../giella-core/scripts/extract-lemmas.sh \
    --exclude "(CmpN/Only|ShCmp|\+Cmp\/SplitR| Rreal | R | Rnoun |\+V\+|NOT-TO-LEMMATEST)" \
    $source_files > $lemmas

####### Start testing: #######

$ospell $speller_dir/${GIELLA_LANG}.zhfst < $lemmas > $checked_lemmas

grep 'is NOT in the lexicon' $checked_lemmas > $rejected_lemmas

if [ -s $rejected_lemmas ] ; then
    exit 1
fi

rm -f $lemmas $rejected_lemmas
