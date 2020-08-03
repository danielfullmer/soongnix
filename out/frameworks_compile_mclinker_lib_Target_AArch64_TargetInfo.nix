{ cc_library_static }:
let

libmcldAArch64Info = cc_library_static {
    name = "libmcldAArch64Info";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = ["AArch64TargetInfo.cpp"];
};

in { inherit libmcldAArch64Info; }
