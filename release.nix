with import <nixpkgs> { };
let
    site = callPackage ./default.nix { };
in site