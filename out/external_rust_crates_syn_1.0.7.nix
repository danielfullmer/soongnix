{ rust_library_host_rlib }:
let

#  This file is generated by cargo2android.py.

"libsyn-1.0.7" = rust_library_host_rlib {
    name = "libsyn-1.0.7";
    crate_name = "syn";
    srcs = ["src/lib.rs"];
    edition = "2018";
    features = [
        "clone-impls"
        "default"
        "derive"
        "extra-traits"
        "full"
        "parsing"
        "printing"
        "proc-macro"
        "quote"
        "visit"
        "visit-mut"
    ];
    flags = [
        "--cfg syn_disable_nightly_tests"
    ];
    rlibs = [
        "libproc_macro2"
        "libquote"
        "libunicode_xid"
    ];
};

in { inherit "libsyn-1.0.7"; }
