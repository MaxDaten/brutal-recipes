with import <nixpkgs> {};

let
  site-builder = haskellPackages.callPackage ./brutal-recipes.nix { };

in stdenv.mkDerivation rec {
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
  
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    inherit tree;
}
