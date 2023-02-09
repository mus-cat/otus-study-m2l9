#!/bin/bash

exec 2>&1

if test x$PHP_FCGI_CHILDREN = x; then
  PHP_FCGI_CHILDREN=4
fi

ALLOWED_ENV="$ALLOWED_ENV RAILS_ENV"

##if test x$UID = x0; then
  EX="$SPAWNFCGI -n -s $FCGISOCKET -u $USERID -U $SOCKUSERID -C $PHP_FCGI_CHILDREN -- $FCGIPROGRAM"
##else
##  EX="$SPAWNFCGI -n -s $FCGISOCKET -C $PHP_FCGI_CHILDREN -- $FCGIPROGRAM"
##fi

# copy the allowed environment variables
E=

for i in $ALLOWED_ENV; do
  E="$E $i=${!i}"
done

# clean environment and set up a new one
exec env - $E $EX
