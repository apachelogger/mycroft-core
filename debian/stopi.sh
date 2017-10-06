#!/bin/bash

if [ -z "$XDG_CACHE_HOME" ]; then
  echo 'set'
  export XDG_CACHE_HOME=$HOME/.cache
fi

MYCROFT=$XDG_CACHE_HOME/mycroft-core-neon

#export SOURCE=$MYCROFT/mycroft
export VIRTUALENV_ROOT=$MYCROFT/virtualenvs/mycroft
export PATH=$VIRTUALENV_ROOT/bin:$PATH

cd $MYCROFT
[ -d logs ] || mkdir logs
exec $MYCROFT/stop-mycroft.sh
