let
    pkgs = import (builtins.fetchGit {
        # Descriptive name to make the store path easier to identify
        name = "nixos-20.9-2021-04-17";
        url = "https://github.com/nixos/nixpkgs/";
        # Commit hash for nixos-unstable as of 2020-04-17
        # `git ls-remote https://github.com/nixos/nixpkgs nixos-20.9`
        ref = "refs/heads/nixos-20.09";
        rev = "c7e905b6a971dad2c26a31960053176c770a812a";
    }) {};

    site = pkgs.callPackage ./default.nix { };
in site