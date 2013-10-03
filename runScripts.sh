#!/bin/bash
#
# fetches new updates from ATOM-feed
# runs scripst over updates
#
./getChanges.sh
python scripts/replace.py -file:rss.txt -pt:5 -summary:"Pedantic on some spellings" -regex -replacementfile:"apostrophe.txt" -always -log:"apostrophe.log"
python scripts/replace.py -file:rss.txt -pt:5 -regex '\{\{card\|' '{{Card|' '\{\{coin\|' '{{Coin|' '\{\{cost\|' '{{Cost|' '( |[^0-9][,\:\;\.])([0-9]|1[0-9]|20|[xX])\$' "\1{{Cost|\2}}" '\$([0-9]|1[0-9]|20|[xX])( |[,\:\;\.][^0-9])' "{{Cost|\1}}\2" '\$([08]\*)' "{{Cost|\1}}" '\$\?|\?\$' '{{Cost|?}}' '\{\{[cC]oin\|([0-9]*)\}\}' '{{Cost|\1}}' "\{\{[cC]ard\|([^\}]*)\}\}(\'?[a-zA-Z]+)" '{{Card|\1|\1\2}}' '\{\{card\|' '{{Card|' '\{\{coin\|' '{{Coin|' '\{\{cost\|' '{{Cost|' '\{\{Cost\|([0-9]*)\}\}P' '{{Cost|\1P}}' '\$([0-9]\.[0-9]+)' '\1{{Cost|}}' '([0-9]\.[0-9]+)\$' '\1{{Cost|}}' '(\n\*+)([0-9a-zA-Z\{\[]+)' '\1 \2' '(\n\={2,})([^ \=][^\=]+)' '\1 \2' '([^\=\n]+[^ \=\n])(\={2,})' '\1 \2' '\$([0-9]\+)( |$)' '{{Cost|\1}}\2' -pt:3 -summary:'Tiedy up Coin/Potion/Card-Template and internal links, lists and headlines' -always -exceptinside:'\[\[[^\]]*\]\]' -log:"misc.log" -excepttitle:'^Goko$'
python scripts/replace.py -file:rss.txt -pt:5 -regex -replacementfile:"cardTemplate.txt" -summary:"Transformed internal links of cards to Template:Card" -exceptinside:'\{\{Infobox((\{\{[^\}]*\}\})|[^\{\}])*\}\}' -log:"cardTemplate.log" -always
./featuredArticles.sh
# TODO
