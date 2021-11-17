# Typos

There are three files:

- `typos-original.txt`  
  \- the typos file before being filtered.
- `typos.txt`  
  \- the present file, used in testing, with false positives and false negatives removed (we only want to test the error model/suggestion quality)
- `typos-correct.txt`  
  \- list of typos gathered automatically from the correct corpus, used for ML modelling (with some splits for evaluation and testing)
- `typos_correct_rejected.txt`  
  \- corrections in the original file not accepted by the speller
- `typos_error_accepted.txt`  
  \- typos in the original file not flagged by the speller

To arrive at the (updated) lists of problem entries, the following commands where used:

```sh
grep -v '^[#!]' typos.txt | grep -v '^\s*$' | cut -f1 \
| divvunspell suggest -a ../../tools/spellcheckers/sma.zhfst \
| grep '\[CORRECT' | cut -d' ' -f2 | cut -f1 > typos_error_accepted.txt
```

and:

```sh
grep -v '^[#!]' typos.txt | grep -v '^\s*$' | cut -f2 \
| divvunspell suggest -a ../../tools/spellcheckers/sma.zhfst \
| grep INCORRECT | cut -d' ' -f2 | cut -f1 > typos_correct_rejected.txt
```