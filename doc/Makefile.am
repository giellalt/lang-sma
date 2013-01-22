## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

if CAN_DOCC

# INSTALL these files:
JSP_PAGES=root-all.jspwiki

# clitics-all.jspwiki
# compounding-all.jspwiki
# 
# abbreviations-stems.jspwiki
# acronyms-stems.jspwiki
# adjectives-oahpa-stems.jspwiki
# adjectives-stems.jspwiki
# adpositions-stems.jspwiki
# adverbs-stems.jspwiki
# conjunctions-stems.jspwiki
# interjections-stems.jspwiki
# nouns-oahpa-stems.jspwiki
# nouns-stems.jspwiki
# numerals-stems.jspwiki
# particles-stems.jspwiki
# pronouns-stems.jspwiki
# propernouns-stems.jspwiki
# punctuation-stems.jspwiki
# smi-propernouns-stems.jspwiki
# subjunctions-stems.jspwiki
# verbs-stems.jspwiki
# 
# adjectives-oahpa-affixes.jspwiki
# adjectives-affixes.jspwiki
# nouns-affixes.jspwiki
# propernouns-affixes.jspwiki
# verbs-affixes.jspwiki

doc_DATA=$(JSP_PAGES) sma.jspwiki

DOCC2RST=$(GTCORE)/scripts/doccomments2rst.awk
DOCC2TEX=$(GTCORE)/scripts/doccomments2tex.awk
DOCC2JSPWIKI=$(GTCORE)/scripts/doccomments2jspwiki.awk

RST2HTML=rst2html
LATEX=xelatex

%-all.jspwiki: $(top_srcdir)/src/morphology/%.lexc
	$(AWK) -f $(DOCC2JSPWIKI) < $< > $@

%-stems.jspwiki: $(top_srcdir)/src/morphology/stems/%.lexc
	$(AWK) -f $(DOCC2JSPWIKI) < $< > $@

%-affixes.jspwiki: $(top_srcdir)/src/morphology/affixes/%.lexc
	$(AWK) -f $(DOCC2JSPWIKI) < $< > $@

sma.jspwiki: preamble.jspwiki $(JSP_PAGES)
	-rm -f $@
	cat $(srcdir)/preamble.jspwiki $(JSP_PAGES) > $@

sma.tex: preamble.tex doc-comments.conf
	-rm -f $@
	cat $(srcdir)/preamble.tex > $@


sma.rst: preamble.rst doc-comments.conf
	-rm -f $@
	cat $(srcdir)/preamble.rst > $@

%.html: %.rst
	$(RST2HTML) < $< > $@

%.pdf: %.tex
	$(LATEX) $<
	$(LATEX) $<
	$(LATEX) $<

endif # CAN_DOCC
