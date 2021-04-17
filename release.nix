let
    pkgs = import (builtins.fetchGit {
        # Descriptive name to make the store path easier to identify
        name = "nixos-unstable-2021-04-17";
        url = "https://github.com/nixos/nixpkgs/";
        # Commit hash for nixos-unstable as of 2020-04-17
        # `git ls-remote https://github.com/nixos/nixpkgs nixos-unstable`
        ref = "refs/heads/nixos-unstable";
        rev = "dcdf30a78a523296b5f9d44fb67afac485b64737";
    }) {};

    site = pkgs.callPackage ./default.nix { };
in site