# Dette skriptet tester at nesten alle lemmaene i $GTHOME/newinfra/langs/sma/src/morphology/stems/adjectives.lexc  kan genereres. De som ikke kan genereres, kopieres til missingadjLemmas.txt

grep ";" $GTHOME/newinfra/langs/sma/src/morphology/stems/adjectives.lexc  | grep -v "^\!" | egrep -v "(PRED|CASE| MES|EVTEBE)" | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > adjs
cat adjs | sed 's/$/+A+Attr/' | $LOOKUP $GTHOME/newinfra/langs/sma/src/generator.gt.xfst  | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u > analadjs 
grep ";" $GTHOME/newinfra/langs/sma/src/morphology/stems/adjectives.lexc  | grep -v "^\!" | egrep "(PRED|CASE)" | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > predadjs
cat predadjs | sed 's/$/+A+Sg+Nom/' | $LOOKUP $GTHOME/newinfra/langs/sma/src/generator.gt.xfst  | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
grep ";" $GTHOME/newinfra/langs/sma/src/morphology/stems/adjectives.lexc  | grep -v "^\!" | grep " MES" | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > superladjs
cat superladjs | sed 's/$/+A+Superl+Sg+Nom/' | $LOOKUP $GTHOME/newinfra/langs/sma/src/generator.gt.xfst  | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
grep ";" $GTHOME/newinfra/langs/sma/src/morphology/stems/adjectives.lexc  | grep -v "^\!" | grep "EVTEBE" | tr ":+" " " | cut -d " " -f1 | tr -d "#" | sort -u > compladjs
cat compladjs | sed 's/$/+A+Comp+Sg+Nom/' | $LOOKUP $GTHOME/newinfra/langs/sma/src/generator.gt.xfst  | cut -f2 | grep -v "A+" | grep -v "^$" | sort -u >> analadjs 
cat predadjs superladjs compladjs >> adjs
sort -u -o adjs adjs 
sort -u -o analadjs analadjs 
comm -23 adjs analadjs > missingadjLemmas.txt
rm *adjs
open missingadjLemmas.txt
