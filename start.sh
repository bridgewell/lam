#! /bin/bash -e

echo "restore configuration"
for f in $DATA $CONFIG; do
    if [ ! -z "$(ls -A $f.original)" ]; then
        if [ -z "$(ls -A $f)" ]; then
            cp -a $f.original/* $f/
            chown -R www-data.www-data $f
        fi
        rm -rf $f.original
    fi
done

! test -f /run/apache2/apache2.pid || rm /run/apache2/apache2.pid
apache2ctl -DFOREGROUND
