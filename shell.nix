{ nixpkgs ? import <nixpkgs> {}, compiler ? "default", doBenchmark ? false }:

let

  inherit (nixpkgs) pkgs;

  site-generator = { mkDerivation, base, hakyll, stdenv }:
      mkDerivation {
        pname = "site-generator";
        version = "0.1.0.0";
        src = ./site-generator;
        isLibrary = false;
        isExecutable = true;
        executableHaskellDepends = [ base hakyll ];
        license = "unknown";
        hydraPlatforms = stdenv.lib.platforms.none;
      };

  haskellPackages = if compiler == "default"
                       then pkgs.haskellPackages
                       else pkgs.haskell.packages.${compiler};

  variant = if doBenchmark then pkgs.haskell.lib.doBenchmark else pkgs.lib.id;

  drv = variant (haskellPackages.callPackage site-generator {});

in

  if pkgs.lib.inNixShell then drv.env else drv
