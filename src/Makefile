# This is a makefile that builds the Southern Sami morphological parser
# *****************************************************************


sma.fst: sma.save caseconv.fst spellrelax.fst
	@echo
	@echo "*** Building sma.fst ***" ;
	@echo
	@printf "read regex @\"sma.save\" .o. @\"caseconv.fst\" \
	.o. @\"spellrelax.fst\" ; \n\
	save stack sma.fst \n\
	quit \n" > /tmp/sma-fst-script
	@xfst < /tmp/sma-fst-script
	@rm -f /tmp/sma-fst-script

# This goal is to allow for i instead of ï, and for ä/æ and ö/ø mix

spellrelax.fst: spellrelax.regex
	@echo
	@echo "*** Building spellrelax.fst ***" ;
	@echo
	@printf "read regex < spellrelax.regex \n\
	save stack spellrelax.fst \n\
	quit \n" > /tmp/spellrelax-script
	@xfst < /tmp/spellrelax-script
	@rm -f /tmp/spellrelax-script


# The second goal il to build the caseconv.fst file
# This goal depends on case.regex

caseconv.fst: case.regex
	@echo
	@echo "*** Building caseconv.fst ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack caseconv.fst \n\
	quit \n" > /tmp/caseconv-script
	@xfst < /tmp/caseconv-script
	@rm -f /tmp/caseconv-script



# The first goal is to build sma.save
# This goal depends on twol-sma.bin and a bunch of lexicon files

sma.save: twol-sma.bin sma-lex.txt noun-sma-lex.txt
	@echo
	@echo
	@echo
	@echo "*** Building sma.save ***" ;
	@echo
	@echo
	@echo
	printf "compile-source sma-lex.txt noun-sma-lex.txt \n\
	read-rules twol-sma.bin \n\
	compose-result \n\
	save-result sma.save \n\
	quit \n" > /tmp/sma-save-script
	@lexc < /tmp/sma-save-script
	rm -f /tmp/sma-save-script

# The second goal is to build twol-sma.bin
# This goal depends on twol-sma.txt

twol-sma.bin: twol-sma.txt
	@echo
	@echo
	@echo
	@echo "*** Building twol-sma.bin ***" ;
	@echo
	@echo
	@echo
	@printf "read-grammar twol-sma.txt \n\
	compile \n\
	save-binary twol-sma.bin \n\
	quit \n" > /tmp/twol-sma-script
	@twolc < /tmp/twol-sma-script
	@rm -f /tmp/twol-sma-script



# ##############################################################


# What follows is copied from the sme makefile. It will be
# relevant as the Lule Sami project grows, but at this point
# it is just commented out.


# Then, the intermediate files will be cleaned up
# I leave twol-sma.bin because I need it for twolc, and tok.fst
# because that is used seperately on the command line.


#clean:
#	@rm -f caseconv.fst sma.save




# The first goal is to build sma.fst
# This goal depends on sma.save and caseconv.fst being up to date

#sma.fst: sma.save caseconv.fst
#	@echo
#	@echo "*** Building sma.fst ***" ;
#	@echo
#	@printf "read regex @\"sma.save\" .o. @\"caseconv.fst\" ; \n\
#	save stack sma.fst \n\
#	quit \n" > /tmp/sma-fst-script
#	@xfst < /tmp/sma-fst-script
#	@rm -f /tmp/sma-fst-script

# The second goal il to build the caseconv.fst file
# This goal depends on case.regex

#caseconv.fst: case.regex
#	@echo
#	@echo "*** Building caseconv.fst ***" ;
#	@echo
#	@printf "read regex < case.regex \n\
#	save stack caseconv.fst \n\
#	quit \n" > /tmp/caseconv-script
#	@xfst < /tmp/caseconv-script
#	@rm -f /tmp/caseconv-script


# If sma.fst had included the preprocessor, this part would have come in.
# Now, it does not, and this must wait for a new makefile.
# This goal depends on tok.txt

#tok.fst: tok.txt
#	@echo
#	@echo "*** Building the tokenizer tok.fst ***" ;
#	@echo
#	@printf "source tok.txt \n\
#	save stack tok.fst \n\
#	quit \n" > /tmp/tok-script
#	@xfst < /tmp/tok-script
#	@rm -f /tmp/tok-script

