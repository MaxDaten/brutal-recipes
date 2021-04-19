{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc" }:
nixpkgs.pkgs.haskell.packages.${compiler}.callPackage ./site-generator.nix { }