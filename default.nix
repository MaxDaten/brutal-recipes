{stdenv, callPackage, buildEnv, haskellPackages, glibcLocales}:
let
    site-generator = haskellPackages.callPackage ./site-generator { };

    # gitignoreSource to respect .gitignore for nix builds
    inherit (stdenv) mkDerivation;
    inherit (import (builtins.fetchTarball "https://github.com/hercules-ci/gitignore/archive/master.tar.gz") { }) gitignoreSource;

in mkDerivation rec {
    name = "brutal-recipes.maxdaten.io";
    env = buildEnv {
        name = name;
        paths = buildInputs;
        pathsToLink = [ "/share" "/bin" ];
    };
    src = gitignoreSource ./src;
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
