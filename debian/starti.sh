#!/bin/bash

if [ -z "$XDG_CACHE_HOME" ]; then
  echo 'set'
  export XDG_CACHE_HOME=$HOME/.cache
fi

MYCROFT=/opt/mycroft
local_copy=$XDG_CACHE_HOME/mycroft-core-neon
mkdir -p mycroft-core-neon
cp -rfv $MYCROFT/. $local_copy
pushd $local_copy
  virtualenv --relocatable $PWD/virtualenvs/mycroft
  for bin in `/usr/bin/find . -type f -exec /bin/grep -Iq . {} \; -and -print`; do
    sed -i "s#${MYCROFT}#${local_copy}#g" $bin || true
  done
popd
MYCROFT=$local_copy

#export SOURCE=$MYCROFT/mycroft
export VIRTUALENV_ROOT=$MYCROFT/virtualenvs/mycroft
export PATH=$VIRTUALENV_ROOT/bin:$PATH
export VIRTUALENVWRAPPER_PYTHON=$VIRTUALENV_ROOT/bin/python

cd $MYCROFT
[ -d logs ] || mkdir logs
[ -d skills ] || mkdir skills
exec $MYCROFT/start-mycroft.sh all
