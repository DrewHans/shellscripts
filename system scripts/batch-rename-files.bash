#!/usr/bin/env bash
# Author: Drew Hans (github.com/drewhans555)

rename "s/SEARCH/REPLACE/g" *
# this will replace the string SEARCH with REPLACE in every file (*).

# /g => global: SEARCH_SEARCH.jpg will be renamed REPLACE_REPLACE.jpg
# leave off /g if you only want one substitution
# add /i at the end for case-insensitive (rename "s/SEARCH/REPLACE/gi" *)
