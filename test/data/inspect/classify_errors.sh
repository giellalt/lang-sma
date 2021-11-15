#!/bin/bash
# try to figure out what kind of modifications are needed to turn a typo into a correct word
# input: typos.txt file
# output: 3 column file: typo correct #modification_type(s)
#
# uses hfst transducers; be sure to compile them beforehand! 

# algorithm:
# (create the rows of a table: 1 row per 1 typo from the input file) 
# 1) from typos.txt, remove everything except: _typo_ <tab> _correct_
# 2) for any number of possible modification type, do 
#     2.1) use a speciali${SED} transducer to generate correction candidates
#     2.2) if one of the candidates was the _correct_ one, make a mark #_modification_type
#     2.3) save the #_modification_type in a file
# 3) combine all the files to arrive at 3 columns: typo correct #modification_type(s)

typos_source=../typos.txt

SED=sed
if [ "$(uname)" == "Darwin" ]; then SED=gsed; fi

# create the column of typos
cat ${typos_source} \
| ${SED} 's/#.*$//' \
| ${SED} 's/!.*$//' \
| grep -v '^$' \
| grep '.' \
| cut -f 1 \
> only_typos.txt

# create the column of known corrects
cat ${typos_source} \
| ${SED} 's/#.*$//' \
| ${SED} 's/!.*$//' \
| grep -v '^$' \
| grep '.' \
| cut -f 2 \
> only_corrects.txt

# sanity check: find rows where typo = correct 
paste only_typos.txt only_corrects.txt \
| ${SED} 's/\t/@ /' \
| ${SED} 's/$/ /' \
| ${SED} '/^\([^@]*\)@.* \1 /s/$/#_no_error/' \
| ${SED} 's/^.*#/#/' \
| ${SED} 's/^[^#]*$//' \
> success_no_error.txt

# prepare typos for subsequent processing:
# add a special symbol @ to separate candidates of one typo from those of the next one
cat only_typos.txt \
| ${SED} 's/$/\n@/' \
> typos_tmp.txt

# start with tmp file for including all the errors (resulting in a table)
paste only_typos.txt only_corrects.txt \
| paste - success_no_error.txt \
> tmp_errors_marked.txt

# for every kind of a typo (add_one, delete_one etc.), ... 

for typo in aab2abb add1 capitalize del1 double2one insert_space one2double repetition subst1 subst1_kb_next subst_accents subst_accents_sz transpose transpose1 loansuffix vowels acrosuff
do

  # 1) create all the possible modifications of this type

  cat typos_tmp.txt \
  | hfst-lookup -s ${typo}.hfst \
  | ${SED} '/^@/s/^@.*$/@/' \
  | ${SED} 's/\t[^\t]*$//' \
  | ${SED} 's/^[^\t]*\t//' \
  | tr '\n' ' ' \
  | ${SED} 's/@ /@/g' \
  | tr -s '@' \
  | ${SED} 's/@/\n/g' \
  > tmp1.txt

  # 2) check if some of the suggested corrections was indeed the known correct one
  # ... and mark the file line accordingly, i.e. with the type of the correction
  # (add1, del1 etc)
  
  paste only_corrects.txt tmp1.txt \
  | ${SED} 's/\t/@ /' \
  | ${SED} 's/$/ /' \
  | LC_COLLATE=C ${SED} "/^\([^@]*\)@.* \1 /s/$/#_${typo}/" \
  | ${SED} 's/^.*#/#/' \
  | ${SED} 's/^[^#]*$//' \
  > tmp2.txt

  # collect all the classifications
  paste tmp_errors_marked.txt tmp2.txt \
  > tmp3
  mv -f tmp3 tmp_errors_marked.txt
done

# remove some redundant classifications
# (they are here because of the way we made the transducers,
# while experimenting with different ideas on how to classify)

# notice that the removal requires you to know how the "columns" of the tmp file were created; 
# look at the for-cycle 

cat tmp_errors_marked.txt \
| tr -s '\t' \
| ${SED} 's/\t#/@#/' \
| ${SED} 's/\t#/ #/g' \
| ${SED} 's/\t$//' \
| ${SED} 's/@#/\t#/' \
| ${SED} 's/#_no_error.*$/#_no_error/' \
| ${SED} 's/#_transpose #_transpose1/#_transpose1/' \
| ${SED} 's/#_add1 #_one2double/#_one2double/' \
| ${SED} 's/#_del1 #_double2one/#_double2one/' \
| ${SED} 's/#_subst1 #_subst1_kb_next/#_subst1_kb_next/' \
| ${SED} 's/#_subst1 #_subst_accents/#_subst_accents/' \
> errors_marked.txt

exit

# for counting the tags:
cat errors_marked.txt | grep '#' | ${SED} 's/^[^#]*#/#/' | ${SED} 's/#/\n#/g' | ${SED} 's/ $//' | sort | uniq -c | sort -nr


