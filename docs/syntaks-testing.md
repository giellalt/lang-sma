# Syntaks-testmateriale

[Tekst henta frå e-post frå Lene med tittel `CG og missing`]

I mappa `art/corp/sma/syntaxwork/corrected/` finnes det en del filer med syntaktisk analyse:

```
1_tjaebpemes_laevnadahke_func.txt
1ficti_trondelagfylke_func.txt
daelvie_pluppen_luvnie_func.txt
mannoeh_riepieh_min_venn_reven_og_jeg_func.txt
pluppen_luvnie_func.txt
skuvlahist1_jonar_func.txt
smacorp2010_func.txt
staaloe_trollboka_asta_vangberg_func.txt
teskjekjerringa_pa_julehandel_func.txt
```
 
Dette er filer som Anja arbeidet med før sommerferien [2018]. Vi lagde også en del regler i `disambiguator.cg3` og `functions.cg3`.
 
Filene kan brukes for testing i CG-arbeid, originaltekstene er i `art/corp/sma/syntaxwork/orig/`.
 
I filene er det en del analyser som er merket med `§`, f.eks.:

```
"slæjhtoes" ? @>N  §M Føre opp denne, "slitsom" står i ordb.
```
 
Disse ordene burde vært lagt til i lexc, og da kan man enda bedre bruke filene som utgangspunkt for en gullstandard for morfologi og syntaktisk analyse.
