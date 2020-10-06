#!/usr/bin/env bash

GIT_COMMIT=0
commit_o="empty"
pr=true

if [ "$commit_o" = "" ];
then
  mc=0
  if [ -n "$pr" ] && [ "$pr" != false ];
  then
    say "if 1, line 12"
    say "is a pr"
    mc=1
  fi
  if [[ "$mc" =~ ^[a-z0-9]{40}[[:space:]][a-z0-9]{40}$ ]];
  then
    say "if 2, line 18"
    say "    Fixing merge commit SHA"
    commit=1
  elif [ "$GIT_COMMIT" != "" ];
  then
    say "first elif, line 23"
    commit="$GIT_COMMIT"
  elif [ "$commit" = "" ];
  then
    say "second elif, line 27"
    commit=2
  fi
else
  say "else"
  commit="$commit_o"
fi

say "end: GIT_COMMIT = $GIT_COMMIT, commit_o = $commit_o, pr = $pr" 