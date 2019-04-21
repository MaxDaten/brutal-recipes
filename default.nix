let
  config = {
    packageOverrides = nixpkgs: rec {
      haskellPackages = nixpkgs.haskellPackages.override {
        overrides = haskellPackagesNew: haskellPackagesOld: rec {
          pandoc = haskellPackagesNew.callPackage ./pandoc.nix { };
          hakyll = haskellPackagesNew.callPackage ./hakyll.nix { };
        };
      };
    };
  };

  

  nixpkgs = import <nixpkgs> { inherit config; };
  inherit (nixpkgs) stdenv haskellPackages;
  
  brutalRecipes = stdenv.mkDerivation {
    name = "brutal-recipes";
    buildInput = [ haskellPackages.hakyll ];
    unpackPhase = "true";
    buildPhase = "true";
    installPhase = 
    ''
      mkdir -p $out/bin
      # ${haskellPackages.hakyll}/bin/hakyll-init --help
      cp ${./index.html} $out/bin/index.html
    '';
  };
in brutalRecipes
