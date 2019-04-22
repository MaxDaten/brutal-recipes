source $stdenv/setup 

PATH=${site-builder}/bin:$PATH

cd $src

site build 
cp _site $out