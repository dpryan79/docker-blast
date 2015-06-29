#!/bin/bash

cd /var/www/html/blast/db
#.html files
if [ -f *.html ]
then
    for html in `ls *.html`
    do
        rm /var/www/html/blast/$html
        cp $html /var/www/html/blast/$html
    done
fi

#.rc files
if [ -f *.rc ]
then
    for rc in `ls *.rc`
    do
        rm /var/www/html/blast/$rc
        cp $rc /var/www/html/blast/$rc
    done
fi

#/etc/group
if [ -f /var/www/html/db/group ]
then
    rm /etc/group
    ln -s /var/www/html/db/group /etc/group
fi

a2enmod cgi
service apache2 start

tail -f /var/log/apache2/*.log /var/www/html/blast/wwwblast.log
