#/bin/sh
nanoc compile
cd output
HOST='ftp.jeanbaptiste-arnaud.eu'
USER='jeanbaptg'
PASSWD='arnaud123'

ncftp -u $USER -p $PASSWD -P 21 $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
cd www
mput -Rf *
quit
END_SCRIPT

cd ..

ncftp -u $USER -p $PASSWD -P 21 $HOST <<END_SCRIPT
quote USER $USER
quote PASS $PASSWD
cd www
mput -Rf ressources
quit
END_SCRIPT
exit 0