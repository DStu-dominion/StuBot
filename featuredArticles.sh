#!/bin/bash
#
#

# get featured article/DYK
FA=$(GET "http://wiki.dominionstrategy.com/api.php?action=query&prop=revisions&rvprop=content&titles=Template:Featured_article")
DYK=$(GET "http://wiki.dominionstrategy.com/index.php?action=raw&title=Template:Did_you_know")
FALINK=$(echo $FA | grep -oE '(\{\{[^\}]*\}\})|(\[\[[a-zA-Z\|]*\]\])' | grep -m 1 -oE '(\{\{[^\}]*\}\})|(\[\[[a-zA-Z\|]*\]\])')

#Want english names for the month
export LC_TIME=en_US.UTF-8
YEAR=$(date +%Y)
MONTH=$(date +%B)
PAGEARCHIVE="Main_Page/Featured_Article/Archive"
PAGEDYK="Main_Page/Did_You_Know/Archive"

DYKHEADING="Former Did You Know"
FAHEADING="Former Featured Articles"

# Featured Articles:

#Add new year if current year is not in the list yet
python scripts/replace.py -page:$PAGEARCHIVE -excepttext:"=== $YEAR ===" -regex "(== $FAHEADING ==)" "\1\n=== $YEAR ===" -summary:"Happy new year $YEAR" -always
#Add link to featured article if it's not in the list
python scripts/replace.py -page:$PAGEARCHIVE -regex "(=== $YEAR ===)" "\1\n* $MONTH: $FALINK" -excepttext:"=== (($YEAR)|(($YEAR-1))) ===\n[^\n]*$FALINK" -summary:"Archived old featured articles" -always


# DIY:
#Add new year if current year is not in the list yet
python scripts/replace.py -page:$PAGEDYK -excepttext:"=== $YEAR ===" -regex "(== $DYKHEADING ==)" "\1\n=== $YEAR ===" -summary:"Happy new year $YEAR" -always
#Add text to former DYK if it's not in the list
python scripts/replace.py -page:$PAGEDYK -excepttext:"$DYK" -regex "(=== $YEAR ===)" "\1\n* $MONTH:\n$DYK" -summary:"Archived old DYK" -always

