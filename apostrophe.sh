#!/bin/bash
#
# replaces 'wrong' spellings of KC, PS, WV, FG with 'correct' apostrophes
# also removes additional spaces in internal links
#
python scripts/replace.py -start:! -pt:3 -summary:"Correcting apostrophes, internal links" -regex -replacementfile:"apostrophe.txt"
