Test results for the morphology and lexicon files
=================================================

This document documents the testing of the parser and disambiguator.
Background info and test plan is found in the [test plan
document.](docu-sma-testplan.html)What is found here is an overview of
what has been tested, both vocabulary testing, testing of the
disambiguator, and testing of the morphological analysis.

Test results for morphology and lexicon
---------------------------------------

### Vocabualry testing

The following table records recall for word forms in various texts. Here
we measure coverage of the vocabulary, by recording all word forms that
are not recognised.

    ---------------------------------------------------------
    Don jih daan bijre
    Test    Wftot Wf-tkn %-recall   Tytot  Wf-typ  %-recall
    090902  80546  68386   84.9 %   11430    6328   55.4 %

    ----------------------------------------------------------
            

#### Explaining the table

Lower token than type percentage indicates that the parser misses common
words more often than seldom ones.

Lower type than token percentage (which is the case) indicates that the
parser is good at the core vocabulary, but has

Each text is given a separate section in the table, ordered
chronologically, with the oldest test case (Test 1) at the bottom. The
first line of each section gives the name of the file (note: the files
of the test cases 2 and 3 are so changed that these two test cases are
closed). Each line represents a test run. The first colum gives the test
date (in the format ddmmyy), the second (WFtot) the total number of
words in the file question, the third (Wf-tkn) the number of recognised
word form tokens, and the percentage compared to the total. The next
columns does the same for wordform types (cf. below for the commands
used to calculate the numbers).

    -------------------------------------------------------------------------
    Wftot:
    cat filename | preprocess | wc -l

    Non_recognised_wf:
    cat filename | preprocess | lookup -flags mbTT -utf8 bin/sma.fst
     | grep '\?' | grep -v CLB | wc -l

    Wf-tkn = Wftot - Non_recognised_wf

    %-recall = Wf-tkn * 100 / Wftot
    -------------------------------------------------------------------------
    Tytot (Total number of wordform types):
    cat filename | preprocess | sort | uniq | wc -l

    Non_recognised_wt (Number of non-analysed wordform types:
    cat filename | preprocess | sort | uniq |
    lookup -flags mbTT -utf8 bin/sma.fst | grep '\?' | grep -v CLB | wc -l

    Wf-typ (Number of recognised wordform types)
    Wf-typ = Tytot - Non_recognised_wt

    %-recall = Wf-typ * 100 / Tytot
    -------------------------------------------------------------------------
