{ cc_library_static }:
let

libmcldX86Info = cc_library_static {
    name = "libmcldX86Info";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = ["X86TargetInfo.cpp"];
};

in { inherit libmcldX86Info; }
