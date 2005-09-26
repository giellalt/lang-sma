
# This is a makefile that builds the Southern Sami morphological parser
# *****************************************************************

# Here we build the inverted transducer, to allow for generation

isma.fst: ../bin/isma.fst
../bin/isma.fst: ../bin/sma.fst ../bin/sma.save
	@echo
	@echo "*** Building the inverse isma.fst ***"
	@echo
	@printf "load ../bin/sma.save \n\
	invert net \n\
	save stack ../bin/isma.fst \n\
	quit \n" > ../../tmp/isma-fst-script
	@xfst -utf8 < ../../tmp/isma-fst-script
	@rm -f ../../tmp/isma-fst-script

# Here we build the final transducer. The goal depends upon the tokenizer,
# the spellrelaxer, the caseconverter and the bare transducer

sma.fst: ../bin/sma.fst
../bin/sma.fst: ../bin/sma.save ../bin/caseconv.fst \
	../bin/spellrelax.fst ../bin/tok.fst
	@echo
	@echo "*** Building sma.fst ***" ;
	@echo
	@printf "read regex @\"../bin/sma.save\" .o. \
	@\"../bin/caseconv.fst\" .o. @\"../bin/spellrelax.fst\" ; \n\
	save stack ../bin/sma.fst \n\
	quit \n" > ../../tmp/sma-fst-script
	@xfst -utf8 < ../../tmp/sma-fst-script
	@rm -f ../../tmp/sma-fst-script

# This goal is to allow for i instead of ï, and for ä/æ and ö/ø mix

spellrelax.fst: ../bin/spellrelax.fst
../bin/spellrelax.fst: spellrelax.regex
	@echo
	@echo "*** Building spellrelax.fst ***" ;
	@echo
	@printf "read regex < spellrelax.regex \n\
	save stack ../bin/spellrelax.fst \n\
	quit \n" > ../../tmp/spellrelax-sma-script
	@xfst -utf8 < ../../tmp/spellrelax-sma-script
	@rm -f ../../tmp/spellrelax-sma-script


# The second goal is to build the caseconv.fst file
# This goal depends on case.regex

caseconv.fst: ../bin/caseconv.fst
../bin/caseconv.fst: case.regex
	@echo
	@echo "*** Building caseconv.fst ***" ;
	@echo
	@printf "read regex < case.regex \n\
	save stack ../bin/caseconv.fst \n\
	quit \n" > ../../tmp/caseconv-sma-script
	@xfst -utf8 < ../../tmp/caseconv-sma-script
	@rm -f ../../tmp/caseconv-sma-script


# Another goal is to build a preprocessor.This goal depends on tok.txt

tok.fst: ../bin/tok.fst
../bin/tok.fst: tok.txt
	@echo
	@echo "*** Building the tokenizer tok.fst ***" ;
	@echo
	@printf "source tok.txt \n\
	save stack ../bin/tok.fst \n\
	quit \n" > ../../tmp/tok-sma-script
	@xfst -utf8 < ../../tmp/tok-sma-script
	@rm -f ../../tmp/tok-sma-script



# The first goal is to build sma.save
# This goal depends on twol-sma.bin and a bunch of lexicon files

sma.save: ../bin/sma.save
../bin/sma.save: ../bin/twol-sma.bin sma-lex.txt noun-sma-lex.txt \
	closed-sma-lex.txt pp-sma-lex.txt adv-sma-lex.txt \
	verb-sma-lex.txt propernoun-sma-lex.txt punct-sma-lex.txt
	@echo
	@echo "*** Building sma.save ***" ;
	@echo
	printf "compile-source sma-lex.txt noun-sma-lex.txt \
	closed-sma-lex.txt pp-sma-lex.txt adv-sma-lex.txt \
	verb-sma-lex.txt propernoun-sma-lex.txt punct-sma-lex.txt \n\
	read-rules ../bin/twol-sma.bin \n\
	compose-result \n\
	save-result ../bin/sma.save \n\
	quit \n" > ../../tmp/sma-save-script
	@lexc -utf8 < ../../tmp/sma-save-script
	@rm -f ../../tmp/sma-save-script

# The second goal is to build twol-sma.bin
# This goal depends on twol-sma.txt

twol-sma.bin: ../bin/twol-sma.bin
../bin/twol-sma.bin: twol-sma.txt
	@echo
	@echo "*** Building twol-sma.bin ***" ;
	@echo
	@printf "read-grammar twol-sma.txt \n\
	compile \n\
	save-binary ../bin/twol-sma.bin \n\
	quit \n" > ../../tmp/twol-sma-script
	@twolc -utf8 < ../../tmp/twol-sma-script
	@rm -f ../../tmp/twol-sma-script


# Manual clean command, removing the binary files

clean:
	@rm -f ../bin/*.fst ../bin/*.save ../bin/*.bin

# ##############################################################


# Then, the intermediate files will be cleaned up
# I leave twol-sma.bin because I need it for twolc, and tok.fst
# because that is used seperately on the command line.

#.PHONY: clean
#clean:
#	@echo
#	@echo "*** Now deleting all *.fst, *.save and *.bin files ***"
#	@echo
#	@rm -f \
#	*.fst \
#	*.save \
#	*.bin
