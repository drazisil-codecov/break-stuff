#!/usr/bin/env bash

GIT_COMMIT=""
commit_o=""
pr=true

echo $(git show --no-patch --format="%P" 2>/dev/null || echo "")
echo "first mc = $(git show --no-patch --format=\"%P\" 2>/dev/null || echo \"\")"
echo "second mc = $(git log -1 --format=\"%H\" 2>/dev/null || hg id -i --debug 2>/dev/null | tr -d '+' || echo \"\")"

if [ "$commit_o" = "" ];
then
  mc="0"
  if [ -n "$pr" ] && [ "$pr" != false ];
  then
    echo "if 1, line 12"
    echo "is a pr"
    mc=$(git show --no-patch --format="%P" 2>/dev/null || echo "")
    echo "setting mc to $mc"
  fi
  if [[ "$mc" =~ ^[a-z0-9]{40}[[:space:]][a-z0-9]{40}$ ]];
  then
    echo "if 2, line 18"
    echo "    Fixing merge commit SHA"
    commit=$(echo "$mc" | cut -d' ' -f2)
    echo setting "commit to $commit"
  elif [ "$GIT_COMMIT" != "" ];
  then
    echo "first elif, line 23"
    commit="$GIT_COMMIT"
    echo "setting commit to $commit"
  elif [ "$commit" = "" ];
  then
    echo "commit is \"\""
    commit=$(git log -1 --format="%H" 2>/dev/null || hg id -i --debug 2>/dev/null | tr -d '+' || echo "")
    echo "setting commit to $commit"
  fi
else
  echo "else"
  commit="$commit_o"
fi

echo "end: GIT_COMMIT = $GIT_COMMIT, commit_o = $commit_o, commit =  $commit, pr = $pr" 