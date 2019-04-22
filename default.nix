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
    outputs = [ "_cache" "_site" "out" ];
    src = ./.;
    buildInputs = [
      site-builder
    ];
    builder = ./builder.sh;
  };
in brutal-recipes
