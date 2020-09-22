{ cc_library }:
let

#  Copyright 2018 The Android Open Source Project

libfscrypt = cc_library {
    name = "libfscrypt";
    recovery_available = true;
    srcs = [
        "fscrypt.cpp"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "libbase"
        "libcutils"
        "libkeyutils"
        "liblogwrap"
    ];
};

in { inherit libfscrypt; }
