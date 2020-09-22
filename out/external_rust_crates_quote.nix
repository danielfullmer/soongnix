{ rust_library_host_rlib }:
let

#  This file is generated by cargo2android.py.

libquote = rust_library_host_rlib {
    name = "libquote";
    crate_name = "quote";
    srcs = ["src/lib.rs"];
    edition = "2018";
    features = [
        "default"
        "proc-macro"
    ];
    rlibs = [
        "libproc_macro2"
    ];
};

in { inherit libquote; }