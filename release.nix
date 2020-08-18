with (import <nixpkgs> {});
let
  bpPkgs = import ./default.nix;
in
  lib.filterAttrs (n: v: v.host_supported or false) bpPkgs
