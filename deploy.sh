#!/bin/bash
# Based on: https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html

set -eE
set -x


restoreState()  {
    git checkout source
    git branch -D master
    if [ "$STASH" != "No local changes to save" ]; then
		git stash pop
	fi
}

# Save State and changes
STASH=`git stash`
echo $STASH

# Build page from source branch
git checkout source
nix-build release.nix

trap restoreState EXIT ERR INT TERM

# Go to gh page branch
git fetch --all
git checkout -b master --track origin/master
git checkout source .gitignore

# Override page and commit
cp -a result/. .

git add -A
git commit -m "Deploy new page"

# Push
git push origin master:master
