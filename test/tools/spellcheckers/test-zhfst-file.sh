#!/bin/bash

HFST_OSPELL=/usr/local/bin/hfst-ospell
GLANG=sma
ZHFSTFILE=../../../tools/spellcheckers/${GLANG}.zhfst

if test -x ${HFST_OSPELL} ; then
  if test -f ${ZHFSTFILE} ; then
    if ! echo nuvviDspeller | ${HFST_OSPELL} -v ${ZHFSTFILE} ; then
        exit 1
    fi
  else
      echo ${ZHFSTFILE} not found
      exit 1
  fi
else
    echo ${HFST_OSPELL} not found
    exit 77
fi

