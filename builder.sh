declare -xp
source $stdenv/setup 

set -e

mkdir -p $out
cp -R $src .

site build || ls -R
cp -r _site $out