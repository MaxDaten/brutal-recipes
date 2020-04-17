---
title: https://brutal-recipes.maxdaten.io
ci: https://github.com/MaxDaten/brutal-recipes/workflows/CI
authors: [https://github.com/maxdaten, https://github.com/Anghostdy]
---

![CI](https://github.com/MaxDaten/brutal-recipes/workflows/CI/badge.svg)

Recipe collection curated by Andy & Jan, continuously delivered and served hot.

## Build & Development Environment

This project uses [nix][nix] as an build and dependency infrastructure.
Nix provides deterministic dependency resolution across multiple language ecosystems.
It can be used either as a "subsystem" in a unix environment (Nixpkgs) or
as a full fledged operating system (NixOS).

As a drop-in solution it is recommended to use Nixpkgs in your current environment.

### Windows

You can just use it via _Windows Subsystem for Linux (2)_ with a (small?) performance sacrifice.

### macOS since 10.15 (Catalina)

You have to prepare the `/nix` root directory before installing Nixpkgs.
Follow one of these solution mentioned [here][nix-macos-10.15] (recommended _solution 1_).

### Editor

Recommended editor ist [Visual Studio Code](https://marketplace.visualstudio.com/vscode)
with recommended extensions in [.vscode/extensions.json](.vscode/extensions.json).

## References

- <https://www.uxbrutalism.com/>
- <http://kinja-labs.com/ingredient-cutter/>

[nix-macos-10.15]: https://github.com/NixOS/nix/issues/2925#issuecomment-604501661
[nix]: https://nixos.org/nixpkgs/manual/
