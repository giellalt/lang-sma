#!/usr/bin/make
#
# This is a makefile to automatise most of the testing.

# Now local, later: ../../script/testing
BINDIR = ../../script/testing

# Copied from old LS makefile:
# Bond, James Bond
UMASK=umask 007

# Default target:
all: n-gen-report

# Clean up all the mess created during a test pass, to prepare for new tests:
clean:
	rm -f *test
	rm -f *facit
	rm -f *~
	rm -f *report
	rm -f *result

# Create all the noun test files (later)
# We start with the simple case, and generalise later:
n-eq-row1ie-full.test: n-codes.txt n-eq-row1ie-full.txt
	rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codes\&forms.pl n-codes.txt n-eq-row1ie-full.txt \
	> $@
	chmod 660 $@

# Make test cases for noun word form generation tests,
# based on the general noun test files; also make a facit
# file containing the expected output from the test run:
n-eq-row1ie-full.gentest: n-eq-row1ie-full.test
	rm -f $@
	rm -f $@.facit
	$(UMASK) && \
	$(BINDIR)/make-gen-test.pl n-eq-row1ie-full.test > $@
	$(UMASK) && \
	$(BINDIR)/make-gen-test-facit.pl n-eq-row1ie-full.test > $@.facit
	chmod 660 $@
	chmod 660 $@.facit

# Here we run the actual generation test:
n-eq-row1ie-full.gentest.result: n-eq-row1ie-full.gentest
	@echo
	@echo "*** Running the word form generator test for nouns ***"
	@echo
	@printf "load ../sma.save \n\
	apply down <n-eq-row1ie-full.gentest \n\
	quit \n" > /tmp/n-gentest-script
	@xfst < /tmp/n-gentest-script > $@
	@rm -f /tmp/n-gentest-script

# Finally, we compare with the facit, and report any differences:
n-gen-report: n-eq-row1ie-full.gentest.result
	diff n-eq-row1ie-full.gentest.result \
	n-eq-row1ie-full.gentest.facit | tee $@ | less

# Now we turn to analysis testing:
# First, create the needed test & facit files
# NB! The sorting specified does not work completely as intended!
# This will lead to small differences between the facit file and
# the analysis output. This happens when one input string gives
# more than one analysis. The expected output is according to the
# order in the inflection lexicon, but the tags in the facit file
# are sorted alphabetically (due to the way sorting is performed -
# there is no way to tell GNU sort to ONLY sort on a specified key).
# For a completely satisfactory result we need a different solution.
# The present solution will have to be good enough for now.
n-eq-row1ie-full.anatest: n-eq-row1ie-full.test
	rm -f $@
	rm -f $@.facit
	$(UMASK) && \
	$(BINDIR)/make-ana-test.pl n-eq-row1ie-full.test \
	| sort -t '\t' -k 1 | cut -f 1 | uniq > $@
	$(UMASK) && \
	$(BINDIR)/make-ana-test.pl n-eq-row1ie-full.test \
	| sort -t '\t' -k 1 | cut -f 2 > $@.facit
	chmod 660 $@
	chmod 660 $@.facit

# Here we run the actual analysis test:
n-eq-row1ie-full.anatest.result: n-eq-row1ie-full.anatest
	@echo
	@echo "*** Running the word form analysis test for nouns ***"
	@echo
	@printf "load ../sma.save \n\
	apply up <n-eq-row1ie-full.anatest \n\
	quit \n" > /tmp/n-anatest-script
	@xfst < /tmp/n-anatest-script > $@
	@rm -f /tmp/n-anatest-script

# Finally, we compare with the facit, and report any differences:
# Due to the sorting problems mentioned above, there will always (?)
# be (small) differences.
n-ana-report: n-eq-row1ie-full.anatest.result
	diff n-eq-row1ie-full.anatest.result \
	n-eq-row1ie-full.anatest.facit | tee $@ | less

