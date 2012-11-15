#!/bin/bash
#
# Get's recent changes from the wiki's ATOM-FEED, extracts the titles of the pages
# I know I shouldn't write this from hand, but ...
#
OUTPUT=rss.txt
TMP=rss.tmp
LASTTIMEFILE="lastrss.txt"
LASTTIME=`less $LASTTIMEFILE`
URL="http://wiki.dominionstrategy.com/api.php?action=query&list=recentchanges&rclimit=500&rcprop=title|timestamp&rcnamespace=0&rcdir=newer&rcshow=!bot|!redirect&rcstart=$LASTTIME" 
echo "Fetching updates since $LASTTIME"
GET $URL | grep -oE '(title=|timestemp=)\&quot\;(.*)\&quot\;' | sed 's/\&quot\;//g' > $TMP
less $TMP | sed -r 's/title\=(.*) timestamp\=.*/\1/g' | tail -n +2 | sort | uniq > $OUTPUT
cat $OUTPUT
echo
tail -n1 $TMP | grep -oE "timestamp\=(.*)" | sed 's/[^0-9]//g' > $LASTTIMEFILE
echo "Fetched updates until  `less $LASTTIMEFILE`"
rm $TMP

