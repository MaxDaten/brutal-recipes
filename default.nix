{stdenv, callPackage, buildEnv, haskellPackages, glibcLocales}:
let
  site-builder = haskellPackages.callPackage ./generator { };

in stdenv.mkDerivation rec {
    name = "brutal-recipes.maxdaten.io";
    env = buildEnv {
      name = name;
      paths = buildInputs;
      pathsToLink = [ "/share" "/bin" ];
    };
    src = ./.;
    buildInputs = [
      site-builder
    ];

    LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
    LANG = "en_US.UTF-8";
  
    phases = "unpackPhase buildPhase";

    buildPhase = ''
      site --verbose build
      mkdir -p $out
      cp -r _site/* $out
    '';
}
