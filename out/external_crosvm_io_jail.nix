{ rust_library_host_rlib }:
let

#  This file is generated by cargo2android.py.

libio_jail = rust_library_host_rlib {
    name = "libio_jail";
    crate_name = "io_jail";
    srcs = ["src/lib.rs"];
    defaults = ["crosvm_defaults"];
    rlibs = [
        "liblibc"
    ];
};

in { inherit libio_jail; }