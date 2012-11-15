StuBot
======

Bot on wiki.dominionstrategy.com

This are the scripts I run regularly on wiki.dominionstrategy.com
It's not ready-to-use, but not much has to be done to let it run.

1) Dependencies:
- pywikipedia:  http://pywikipediabot.sourceforge.net/ ; manual at http://www.mediawiki.org/wiki/Manual:Pywikipediabot
- python 2.3++ish to run pywikipedia (3++ is claimed to not work)
- some Unixish OS to run getChanges.sh
- API access to the wiki and a configured pywikipedia-bot.  In case you wonder, wiki name is 'dominion', don't know if that is documentated somewhere (else than here), I used trial and error to find out...

2) Some stuff because I was too lazy for proper coding:
- the scripts from pywikipedia have to be located in the subfolder/symlink scripts/ relative to the bot.  Or you have to change the location in runscripts.sh (and maybe somewhere else).
- Will overwrite and remove some files in the folder, so you better don't have important stuff in tmp.dat in the folder of the bot.
