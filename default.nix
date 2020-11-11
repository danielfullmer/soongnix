let
  pkgs = import <nixpkgs> {};
  lib = pkgs.lib;

  repo = lib.importJSON ./repo-android-11.0.0_r1.json;
  _sourceDirs = lib.mapAttrs (n: v: pkgs.fetchgit { inherit (v) url rev sha256; }) repo;
  sourceDirs = lib.mapAttrs (n: v:
    if n == "system/core"
    then pkgs.applyPatches { src = v; patches = ./system_core.patch; }
    else if n == "system/tools/aidl"
    then pkgs.applyPatches { src = v; patches = ./system_tools_aidl.patch; }
    else if n == "art"
    then pkgs.applyPatches { src = v; patches = ./art.patch; }
    else if n == "bionic"
    then pkgs.runCommand "bionic-libc-patched" { nativeBuildInputs = [ pkgs.python ]; } ''
      cp -r ${v} $out
      chmod u+w -R $out
      rm $out/libc/fs_config_generator.py
      cp ${_sourceDirs."build/make"}/tools/fs_config/fs_config_generator.py $out/libc/
      patchShebangs $out/libc/fs_config_generator.py
    ''
    else v
  ) _sourceDirs;

  callBPPackage = relpath: let
    soongModules = import ./soong.nix { inherit pkgs lib bpPkgs sourceDirs relpath; };
  in
    lib.callPackageWith soongModules;
  bpPkgs = import ./out/blueprint-packages.nix { inherit callBPPackage; };
in bpPkgs
