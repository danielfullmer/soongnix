let
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;

  repo = lib.importJSON ./repo-android-10.0.0_r40.json;
  _sourceDirs = lib.mapAttrs (n: v: pkgs.fetchgit { inherit (v) url rev sha256; }) repo;
  sourceDirs = lib.mapAttrs (n: v:
    if n == "system/core"
    then pkgs.applyPatches { src = v; patches = ./system_core.patch; }
    else v
  ) _sourceDirs;

  # Find the source dir with the longest name which matches a prefix of relpath
  selectDir = relpath:
  let
    matchingDirs = lib.filter (n: lib.hasPrefix n relpath) (lib.attrNames sourceDirs);
    bestDirName =
      assert lib.assertMsg ((builtins.length matchingDirs) >= 1) "Could not find soong module: ${relpath}";
      builtins.head (lib.sort (a: b: (lib.stringLength a) > (lib.stringLength b)) matchingDirs);
    remainingPath = builtins.substring (lib.stringLength bestDirName) (lib.stringLength relpath) relpath;
  in sourceDirs.${bestDirName} + remainingPath;

  callBPPackage = relpath: let
    #packageSrc = /home/danielrf/src/aosp + "/${relpath}"; # This should not reimport something already in /nix/store. Make it align with robotnix sources.dir ?
    packageSrc = selectDir relpath;
    soongModules = import ./soong.nix { inherit pkgs lib bpPkgs sourceDirs packageSrc; };
  in
    lib.callPackageWith soongModules;
  bpPkgs = import ./out/blueprint-packages.nix { inherit callBPPackage; };
in bpPkgs
