{ cc_defaults }:
let

#  Autogenerated by aosp-gen-bp.sh
mesa_version_defaults = cc_defaults {
    name = "mesa_version_defaults";
    cflags = ["-DPACKAGE_VERSION=\"19.1.3\""];
};

in { inherit mesa_version_defaults; }