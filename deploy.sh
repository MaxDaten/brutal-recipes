#!/bin/bash
# Based on: https://jaspervdj.be/hakyll/tutorials/github-pages-tutorial.html

set -e
set -x

# Save State and changes
git stash

# Build page from source branch
git checkout source
nix-build release.nix

# Go to gh page branch
git fetch --all
git checkout master
git checkout source .gitignore
# git checkout -b master --track origin/master

# Override page and commit
cp -a result/. .

git add -A
git commit -m "Deploy new page"

# Push
# git push origin master:master

# # Restoration
# git checkout develop
# git branch -D master
# git stash pop