FROM lnl7/nix:2.2

RUN nix-channel --add https://nixos.org/channels/nixpkgs-unstable && nix-channel --update
RUN nix-env -iA \
 nixpkgs.stdenv \
 nixpkgs.gzip \
 nixpkgs.gnutar \
 nixpkgs.git \
 nixpkgs.procps \
 nixpkgs.lsb-release \
 nixpkgs.yarn