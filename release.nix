let
    bootstrap = import <nixpkgs> { };

    nixpkgs = builtins.fromJSON (builtins.readFile ./nixpkgs-latest.json);

    src = bootstrap.fetchFromGitHub {
        owner = "NixOS";
        repo = "nixpkgs";
        inherit (nixpkgs) rev sha256;
    };

    pkgs = import src {};

    site = pkgs.callPackage ./default.nix { };
in site