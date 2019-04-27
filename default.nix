{stdenv, callPackage, buildEnv, haskellPackages, glibcLocales}:
let
    site-generator = haskellPackages.callPackage ./site-generator { };

in stdenv.mkDerivation rec {
    name = "brutal-recipes.maxdaten.io";
    env = buildEnv {
        name = name;
        paths = buildInputs;
        pathsToLink = [ "/share" "/bin" ];
    };
    src = ./src;
    buildInputs = [
        site-generator
    ];

    LOCALE_ARCHIVE = "${glibcLocales}/lib/locale/locale-archive";
    LANG = "en_US.UTF-8";

    phases = [
        "unpackPhase"
        "buildPhase"
        "installPhase"
        "distPhase"
    ];

    buildPhase = ''
        site --verbose build
    '';

    installPhase = ''
        mkdir -p $out
        cp -r _site/* $out
    '';
}
