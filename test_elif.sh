#!/usr/bin/env bash

GIT_COMMIT=0
commit_o=""
pr=true

if [ "$commit_o" = "" ];
then
  mc="0"
  if [ -n "$pr" ] && [ "$pr" != false ];
  then
    echo "if 1, line 12"
    echo "is a pr"
    mc="bff990372e17185c4e98bbed784e0270c6b01455 c62518a18aa4cd855f6ba8d855335f42f258bf24"
    echo "$mc"
  fi
  if [[ "$mc" =~ ^[a-z0-9]{40}[[:space:]][a-z0-9]{40}$ ]];
  then
    echo "if 2, line 18"
    echo "    Fixing merge commit SHA"
    commit=$(echo "$mc" | cut -d' ' -f2)
  elif [ "$GIT_COMMIT" != "" ];
  then
    echo "first elif, line 23"
    commit="$GIT_COMMIT"
  elif [ "$commit" = "" ];
  then
    echo "second elif, line 27"
    commit=2
  fi
else
  echo "else"
  commit="$commit_o"
fi

echo "end: GIT_COMMIT = $GIT_COMMIT, commit_o = $commit_o, commit =  $commit, pr = $pr" 