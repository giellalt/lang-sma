Collecting developer texts
==========================

In order to test precision, we need texts for development. is described [here](https://giellalt.github.io/proof/gramcheck/GrammarCheckerDocumentation.html).

The South Saami development sentences should be taken from corpus texts not in use for gold corpus. The following texts are available (remove the newlines and collect the result as one file (`corpustext.txt`) of appr. - words). Then, analyse the file as explained [in this document](https://giellalt.github.io/proof/gramcheck/extracting-precision-sentences.html). The result will be files containing sentences with error alarms.

The files reserved for developer test corpus are listed here. These should **not** be used for gold corpus annotation. Gold corpus files are listed at the end of this document.

```
ccat -l sma 
~/freecorpus/converted/sma/admin 
~/freecorpus/converted/sma/bible 
~/freecorpus/converted/sma/news 
~/freecorpus/converted/sma/science 
~/boundcorpus/converted/sma/admin
~/boundcorpus/converted/sma/bible
~/boundcorpus/converted/sma/news
~/boundcorpus/converted/sma/science
```


In both free- and boundcorpus the ficti and facta catalogues contain correct corpora, and are not used as developer corpus.


