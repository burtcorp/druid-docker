#!/bin/bash -eu

if [[ $# -lt 1 ]]; then
  echo "Usage: node.sh nodeType"
  exit 1
fi

nodeType="$1"
shift

exec java \
  `cat conf/druid/$nodeType/jvm.config | xargs` \
  -cp conf/druid/_common:conf/druid/$nodeType:lib/* \
  "$@" \
  io.druid.cli.Main \
  server \
  $nodeType
