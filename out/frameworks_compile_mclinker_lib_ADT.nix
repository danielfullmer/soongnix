{ cc_library_static }:
let

libmcldADT = cc_library_static {
    name = "libmcldADT";
    defaults = ["mcld-defaults"];
    host_supported = true;
    srcs = ["StringEntry.cpp"];
};

in { inherit libmcldADT; }
