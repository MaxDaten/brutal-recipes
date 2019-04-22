source $stdenv/setup 

PATH=${site-builder}/bin:$PATH

site build
# cp _site $out