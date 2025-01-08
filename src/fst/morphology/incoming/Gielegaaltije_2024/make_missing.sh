#!/usr/bin/env sh

for i in A V N Phrase
do
    cat $i-smamul.xml | \
    grep '<l ' | \
    cut -f2 -d'<' | \
    cut -f2 -d'>' | \
    hfst-lookup -q --time-cutoff=10 $GTLANGS/lang-sma/src/fst/analyser-gt-desc.hfstol | \
    grep "?" | \
    cut -f1 | \
    rev | \
    sort -u | \
    rev | \
    awk '{print $1":"$1" TODO ;"}' > $i-missing.txt
done