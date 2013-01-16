## Process this file with automake to produce Makefile.in
## Copyright: Sámediggi/Divvun/UiT
## Licence: GPL v3+

if CAN_DOCC

# INSTALL these files:
doc_DATA=sma.rst sma.html sma.tex sma.jspwiki

DOCC2RST=$(top_srcdir)/src/scripts/doccomments2rst.awk
DOCC2TEX=$(top_srcdir)/src/scripts/doccomments2tex.awk
DOCC2JSPWIKI=$(top_srcdir)/src/scripts/doccomments2jspwiki.awk

RST2HTML=rst2html
LATEX=xelatex

sma.jspwiki: preamble.jspwiki doc-comments.conf
	-rm -f $@
	cat $(srcdir)/preamble.jspwiki > $@
	cat `grep -v '^#' doc-comments.conf | sed -e 's:^:$(top_srcdir)/src/:'` | $(AWK) -f $(DOCC2JSPWIKI) >> $@

sma.tex: preamble.tex doc-comments.conf
	-rm -f $@
	cat $(srcdir)/preamble.tex > $@
	cat `grep -v '^#'  doc-comments.conf | sed -e 's:^:$(top_srcdir)/src/:'` | $(AWK) -f $(DOCC2TEX) >> $@


sma.rst: preamble.rst doc-comments.conf
	-rm -f $@
	cat $(srcdir)/preamble.rst > $@
	cat `grep -v '^#' doc-comments.conf | sed -e 's:^:$(top_srcdir)/src/:'` | $(AWK) -f $(DOCC2RST) >> $@

%.html: %.rst
	$(RST2HTML) < $< > $@

%.pdf: %.tex
	$(LATEX) $<
	$(LATEX) $<
	$(LATEX) $<

endif # CAN_DOCC
