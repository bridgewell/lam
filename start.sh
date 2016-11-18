#! /bin/bash -ex

# fix logging
! test -e /var/log/apache2/access.log || rm /var/log/apache2/access.log
! test -e  /var/log/apache2/error.log || rm  /var/log/apache2/error.log
ln -sf /proc/$$/fd/1 /var/log/apache2/access.log
ln -sf /proc/$$/fd/2 /var/log/apache2/error.log

! test -f /run/apache2/apache2.pid || rm /run/apache2/apache2.pid
apache2ctl -DFOREGROUND
