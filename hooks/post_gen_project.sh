#!/bin/sh
##

command -v git > /dev/null 2>&1 || {
    echo "git: command not found"
}

echo
git init > /dev/null
git add . > /dev/null
git commit -q -m "Initial Commit"

git status

exit 0
