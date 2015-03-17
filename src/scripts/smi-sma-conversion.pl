#!/usr/bin/perl -w
#
# smi-sma-conversion.pl
# Convert names in the SMI propernoun lexicon to SMA.
# $Id$

use strict;
use utf8;

while(<>) {
	# Continuation lexicon substitutions:
	s/ C-FI-NEN/nen LONDON/g ;
	s/SUND/BERN/g ;
	s/HEIM/BERN/g ;
	s/SIJTE/ACCRA/g ;
	s/HAWAII/ACCRA/g ;

	s/b9/b/g ;
	s/d9/d/g ;
	s/g9/g/g ;
	s/h9/h/g ;
	s/j9/j/g ;
	s/k9/k/g ;
	s/m9/m/g ;
	s/n9/n/g ;
	s/p9/p/g ;
	s/r9/r/g ;
	s/s9/s/g ;
	s/t9/t/g ;
	s/z9/z/g ;
	s/æ9/æ/g ;
	s/'7/'/g ;
	s/7 / /g ;
	s/8 / /g ;
	s/9 / /g ;
	s/7#/#/g ;
	s/8#/#/g ;
	s/9#/#/g ;

	# Substitutions due to orthographic differences between SMJ and SME:
	s/t:(.*)h /t:$1d9 /g ;
	s/čč/ttj/g ;
	s/Č/Tj/g ;
	# Andreevič -> Andreevitj:
#	s/^(.*)č /$1tj:$1t9j /g ;
	s/č/tj/g ;
	s/šž/sjtj/g ;
	s/Šž/Sjtj/g ;
	s/šš/ssj/g ;
	s/žž/dtj/g ;
	s/Š/Sj/g ;
	s/š/sj/g ;
	s/ž/dj/g ;
	# j->i || Vow i .* : .* Vow _ ; Heaika:Heajka -> Heaika:Heaika. But Majken 	
#	s/([ÁAEIOUaáeiou])i(.*):(.*)([ÁAEIOUaáeiou])j/$1i$2:$3$4i/g ;
    s/([ÁAEIOUaáeiou])i([^j].*):(.*)([ÁAEIOUaáeiou])j([^ÁAEIOUaáeiou])/$1i$2:$3$4i$5/g ;
    
	my $line = $_;

	print $line;
}

