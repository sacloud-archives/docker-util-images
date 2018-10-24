#!/bin/sh

# validate parameters
if [ ! -d "$(pwd)/.git" ]; then
   echo "not a git repository (or any of the parent directories): .git"
   exit 1
fi

if [ -z "${RELEASE_FROM}" ]; then
   echo "\$RELEASE_FROM is empty"
   exit 1
fi

if [ -z "${RELEASE_TO}" ]; then
   echo "\$RELEASE_TO is empty"
   exit 1
fi

OPT_TOKEN=""
if [ -z "${GITHUB_TOKEN}" ]; then
    OPT_TOKEN="--token=${GITHUB_TOKEN}"
fi

# generate changelog
ghch -f v${RELEASE_FROM} -N v${RELEASE_TO} -F markdown ${OPT_TOKEN} > /tmp/new.md
touch CHANGELOG.md
cat CHANGELOG.md | sed -E 's/# Changelog//' | sed -E '/^$/{N; /^\n$/D;}' > /tmp/old.md

cat /header.txt /tmp/new.md /tmp/old.md > CHANGELOG.md
