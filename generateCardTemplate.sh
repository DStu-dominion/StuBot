#!/bin/bash
#
# Generates the regexes to replace internal links with cardlists from the list of cards in cardlist.txt
#
less cardlist.txt | sed -r 's/(.*)/\(\[^a-zA-Z\]\)\\\[\\\[\1\\\]\\\]\(\[^a-zA-Z\]\)\n\\1{\{Card\|\1\}\}\\2\n\(\[a-zA-Z\]\*\)\\\[\\\[\1\\\]\\\]\(\[a-zA-Z\]\*\)\n\{\{Card\|\1\|\\1\1\\2}}\n\\\[\\\[\1\\\|\(\[^\\\]\]\*\)\\\]\\\]\n\{\{Card\|\1\|\\1\}\}/g' > out.txt
