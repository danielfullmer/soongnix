{ cc_library_static }:
let

libmcldMipsInfo = cc_library_static {
    name = "libmcldMipsInfo";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = ["MipsTargetInfo.cpp"];
};

in { inherit libmcldMipsInfo; }
