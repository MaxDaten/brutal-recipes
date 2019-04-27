#!/bin/bash
# Based on: https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html

set -eE
set -x


restoreState()  {
    git checkout source
    git branch -D master
    git stash pop
}

# Save State and changes
git stash

# Build page from source branch
git checkout source
nix-build release.nix

# Go to gh page branch
git fetch --all
git checkout -b master --track origin/master
trap restoreState EXIT ERR INT TERM
git checkout source .gitignore

# Override page and commit
cp -a result/. .

git add -A
git commit -m "Deploy new page"

# Push
git push origin master:master

