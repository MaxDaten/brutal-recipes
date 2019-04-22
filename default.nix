let
  nixpkgs = import <nixpkgs> { };
  inherit (nixpkgs) stdenv buildEnv haskellPackages;
  
  site-builder = haskellPackages.callPackage ./brutal-recipes.nix { };
  
  brutal-recipes = stdenv.mkDerivation rec {
    name = "brutal-recipes";
    env = buildEnv {
      name = name;
      paths = buildInputs;
      pathsToLink = [ "/share" "/bin" ];
    };
    src = ./.;
    buildInputs = [
      site-builder
    ];
    # FIXME find a way to get the binary 'site' of site-builder
    # to the path
    # builder = ./builder.sh;
  };
in brutal-recipes
