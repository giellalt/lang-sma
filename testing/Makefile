SHELL = /bin/sh
#!/usr/bin/make
#
# This is a makefile to automatise most of the testing.

# Where all the perl scripts are:
BINDIR = ../../script/testing

# Copied from old LS makefile:
# Bond, James Bond
UMASK=@umask 007

# Default target:
.PHONY: all
all: n.gsummary
# n.asummary

# Clean up all the mess created during a test pass, to prepare for new tests:
#		  *.tgz	\	# just to remove archive files used for file transfering
#		  *~		# to remove backup copies that may clutter the directory
.PHONY: clean
clean:
	@echo
	@echo "*** Now deleting all generated files ***"
	@echo
	@rm -f *.testbase \
		  *.gtest \
		  *.atest \
		  *.gfacit \
		  *.afacit \
		  *.greport \
		  *.areport \
		  *.gresult \
		  *.aresult \
		  *summary \
		  *.tgz	\
		  *~ \
		  /tmp/*test-script

# These variables define  the relationship between the source files
# and the final output files (the reports), such that one can con-
# struct a list of targets for the main target
NGenFiles := $(patsubst %.txt,%.greport,$(wildcard n-*.txt))
NAnaFiles := $(patsubst %.txt,%.areport,$(wildcard n-*.txt))
VGenFiles := $(patsubst %.txt,%.greport,$(wildcard v-*.txt))
VAnaFiles := $(patsubst %.txt,%.areport,$(wildcard v-*.txt))

# Debugging of the variable $(NGenFiles)
test: $(NGenFiles)
	@echo "*** NGenFiles: ***"
	@printf $^
	@printf "\n"

# Create all the noun test file bases:
n-%.testbase: n-%.txt noun-codes.txt
	@echo
	@echo "*** Creating the test base for n-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/merge-codesNforms.pl noun-codes.txt $< > $@
	@chmod 660 $@

# Make test cases for noun word form generation tests,
# based on the noun test file bases:
n-%.gtest: n-%.testbase
	@echo
	@echo "*** Creating test cases for word form generation for n-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/make-gen-test.pl $< > $@
	@chmod 660 $@

# Make facit files containing the expected output from the
# noun, word form generation test run:
n-%.gfacit: n-%.testbase
	@echo
	@echo "*** Creating facit file for word form generation for n-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/make-gen-test-facit.pl $< > $@
	@chmod 660 $@

# Here we run the actual generation test:
n-%.gresult: n-%.gtest
	@echo
	@echo "*** Running the word form generator test for n-$*.txt ***"
	@echo
	@printf "load ../sma.save \n\
	apply down <$< \n\
	quit \n" > /tmp/n-$*-gtest-script
	@xfst < /tmp/n-$*-gtest-script > $@
	@rm -f /tmp/n-$*-gtest-script

# Then we compare with the facit, and report any differences:
n-%.greport: n-%.gresult n-%.gfacit
	@echo
	@echo "*** Diffing the test result and the facit file for   ***"
	@echo "*** word form generation for n-$*.txt ***"
	@echo
	@echo "*** Now diffing: ***"
	rm -f $@
	$(UMASK) && \
	diff $< n-$*.gfacit > $@
	chmod 660 $@
	@echo "*** Test: finished greport ***"

# Finally, we concatenate all greports, and display them:
n.gsummary: $(NGenFiles)
#	cat $^ > $@
#	cat n-*.greport > $@
	@echo
	@echo "*** All noun word form generation testing is done.     ***"
	@echo "*** The concatenated reports are stored in n.gsummary, ***"
	@echo "*** and is also less-ed now. Type C-z to continue.     ***"
	@echo
#	@cat
#	@less $@

# Now we turn to analysis testing:
# First, create the needed test file
# NB! The sorting specified does not work completely as intended!
# This will lead to small differences between the facit file and
# the analysis output. This happens when one input string gives
# more than one analysis. The expected output is according to the
# order in the inflection lexicon, but the tags in the facit file
# are sorted alphabetically (due to the way sorting is performed -
# there is no way to tell GNU sort to ONLY sort on a specified key).
# For a completely satisfactory result we need a different solution.
# The present solution will have to be good enough for now.
n-%.atest: n-%.testbase
	@echo
	@echo "*** Creating test cases for word form analysis for n-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/make-ana-test.pl $< \
	| sort -t '\t' -k 1 | cut -f 1 | uniq > $@
	@chmod 660 $@

# Make facit files containing the expected output from the
# noun word form analysis test run:
n-%.afacit: n-%.testbase
	@echo
	@echo "*** Creating facit file for word form analysis for n-$*.txt ***"
	@echo
	@rm -f $@
	$(UMASK) && \
	$(BINDIR)/make-ana-test.pl $< \
	| sort -t '\t' -k 1 | cut -f 2 > $@
	@chmod 660 $@

# Here we run the actual analysis test:
n-%.aresult: n-%.atest
	@echo
	@echo "*** Running the word form analysis test for nouns ***"
	@echo
	@printf "load ../sma.save \n\
	apply up <$< \n\
	quit \n" > /tmp/n-$*-atest-script
	@xfst < /tmp/n-$*-atest-script > $@
	@rm -f /tmp/n-$*-atest-script

# Finally, we compare with the facit, and report any differences:
# Due to the sorting problems mentioned above, there will always (?)
# be (small) differences.
n-%.areport: n-%.aresult n-%.afacit
	@echo
	@echo "*** Diffing the test result and the facit file for ***"
	@echo "*** word form analysis for n-$*.txt       ***"
	@echo
	@diff $< n-$*.afacit > $@

# Finally, we concatenate all n-areports, and display them:
n.asummary: $(NAnaFiles)
	cat $^ > $@
#	or: cat n-*.areport > $@
	@echo
	@echo "*** All noun word form analysis testing is done.       ***"
	@echo "*** The concatenated reports are stored in n.asummary, ***"
	@echo "*** and is also less-ed now. Type C-z to continue.     ***"
	@echo
	@cat
	@less $@

