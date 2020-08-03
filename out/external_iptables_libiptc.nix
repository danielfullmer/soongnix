{ cc_defaults, cc_library_static }:
let

libiptc_defaults = cc_defaults {
    name = "libiptc_defaults";
    defaults = ["iptables_defaults"];

    cflags = ["-Wno-pointer-sign"];
};

libip4tc = cc_library_static {
    name = "libip4tc";
    defaults = ["libiptc_defaults"];

    srcs = ["libip4tc.c"];
};

libip6tc = cc_library_static {
    name = "libip6tc";
    defaults = ["libiptc_defaults"];

    cflags = ["-Wno-unused-function"];

    srcs = ["libip6tc.c"];
};

in { inherit libip4tc libip6tc libiptc_defaults; }
