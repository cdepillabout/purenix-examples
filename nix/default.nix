{ ... }:

# Nixpkgs with overlays for this repo.
# This is convenient to use with `nix repl`:
#
# $ nix repl ./nix

let

  nixpkgs-src = builtins.fetchTarball {
    # Make sure to keep this at the same commit as the PureNix repo.
    url = "https://github.com/NixOS/nixpkgs/archive/5cb226a06c49f7a2d02863d0b5786a310599df6b.tar.gz";
    sha256 = "sha256-4xsVM2H8CG3d/3V+GqDDLDOmb3kdrugbqKVyrg8Q/zc=";
  };

  purenix-src = builtins.fetchTarball {
    # PureNix main branch as of 2022-01-21.
    url = "https://github.com/purenix-org/purenix/archive/b6bf56a20b26b9744b207bed75268c09dd611b79.tar.gz";
    sha256 = "1rfzqc6drxx1g38yysrr7qjlvkw01b4709i7qwjyxfl2jsshmkc5";
  };

  overlays = [
    (import ./overlay.nix)
    (import (purenix-src + "/nix/overlay.nix"))
  ];

  pkgs = import nixpkgs-src { inherit overlays; };

in

pkgs

