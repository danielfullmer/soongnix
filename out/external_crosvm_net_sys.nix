{ rust_library_host_rlib }:
let

#  This file is generated by cargo2android.py.

libnet_sys = rust_library_host_rlib {
    name = "libnet_sys";
    crate_name = "net_sys";
    srcs = ["src/lib.rs"];
    defaults = ["crosvm_defaults"];
    rlibs = [
        "libsys_util"
    ];
};

in { inherit libnet_sys; }