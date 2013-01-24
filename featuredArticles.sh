#!/bin/bash
#
#

# get featured article
FA=$(GET "http://wiki.dominionstrategy.com/api.php?action=query&prop=revisions&rvprop=content&titles=Template:Featured_article")
LINK=$(echo $FA | grep -oE '(\{\{[^\}]*\}\})|(\[\[[a-zA-Z\|]*\]\])' | grep -m 1 -oE '(\{\{[^\}]*\}\})|(\[\[[a-zA-Z\|]*\]\])')


#Want english names for the month
LC_TIME=en_US.UTF-8
YEAR=$(date +%Y)
MONTH=$(date +%B)
PAGEARCHIVE="User:DStu/OldFeaturedArticles"

# todo: once a year insert new year
HEADING="Former Featured Articles"

#Add new year if current year is not in the list yet
python scripts/replace.py -page:$PAGEARCHIVE -excepttext:"=== $YEAR ===" -regex "(== $HEADING ==)" "\1\n=== $YEAR ===" -summary:"Happy new year"

#Add link to featured article if it's not in (this years) list
python scripts/replace.py -page:$PAGEARCHIVE -excepttext:"=== ($YEAR)|(($YEAR-1)) ===\n[^\n]*$LINK" -regex "(=== $YEAR ===)" "\1\n* $MONTH: $LINK" -summary:"Archived old featured articles"

