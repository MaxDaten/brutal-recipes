{ nixpkgs ? import <nixpkgs> {}, compiler ? "ghc" }:
(import ./default.nix { inherit nixpkgs compiler; }).env