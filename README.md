---
title: 'Brutal Recipes'
---

![CI](https://github.com/MaxDaten/brutal-recipes/workflows/CI/badge.svg)

Recipe collection curated by Andy & Jan, continuously delivered and served hot.

## Authors

- [MaxDaten](https://github.com/maxdaten)
- [Anghostdy](https://github.com/Anghostdy)

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

## Project Organization

To produce the static sites (html, css, js, etc) of brutal-recipes, a own binary executable tool `site-generator` is used.

It's _input_ is the content in directory `./src`. Recipes are written in markdown format (pandoc flavor) and should follow some
rules and structures (still has to be defined).
Images and other created content can be included to some extend.

It's _output_ is the set of static files to be deployed to the github pages service.

This follows a process implemented via github actions and git branches. While github actions are doing the heavy work in building & executing the `site-generator` to generate the static site, the process of creating updates has to be follow by the content creators.

### Git Branches

- `source`: Integration branch
- `master`: Release branch

`source` is the shared state for all contributors. Changes can be introduced here directly (preferred & encouraged) or via spike out branches in combination with pull request (PR) or merges on `source`.

Every branch will be _build_ by github actions, but only `source` will be _deployed_ to `master`, if the _build_ was successful.

Own spike out branches can be used for experiments or collecting async feedback in a PR. But it is preferred to discuss ideas first directly.

_But beware the **Peter Parker principle**_:

> With great power there must also come great responsibility

If you commit directly to the integration branch `source` and it breaks the build & deployment, it will break it for everyone which blocks everyone from working. So observe your changes and how they will evolve to a deployment and a public visible site. Be responsible. Revert your changes if necessary.

### Nix Infrastructure

TBD

### Site Generator

TBD

### Site Content

TBD

## Work-Mode

### Content Creation

<!-- FIXME: how to create a new recipe -->
<!-- FIXME: Markdown guidelines -->

TBD

### Content Presentation

<!-- FIXME: `site-generator` rules -->
<!-- FIXME: Adjusting templates -->

TBD

## References

- <https://www.uxbrutalism.com/>
- <http://kinja-labs.com/ingredient-cutter/>

[nix-macos-10.15]: https://github.com/NixOS/nix/issues/2925#issuecomment-604501661
[nix]: https://nixos.org/nixpkgs/manual/
