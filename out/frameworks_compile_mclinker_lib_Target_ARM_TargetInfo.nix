{ cc_library_static }:
let

libmcldARMInfo = cc_library_static {
    name = "libmcldARMInfo";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = ["ARMTargetInfo.cpp"];
};

in { inherit libmcldARMInfo; }
