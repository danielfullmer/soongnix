{ cc_binary_host }:
let

#
#  Copyright 2008 The Android Open Source Project
#
#  Zip alignment tool
#

zipalign = cc_binary_host {
    name = "zipalign";

    srcs = [
        "ZipAlign.cpp"
        "ZipEntry.cpp"
        "ZipFile.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    #  NOTE: Do not add any shared_libs dependencies because they will break the
    #  static_sdk_tools target.
    static_libs = [
        "libutils"
        "libcutils"
        "liblog"
        "libziparchive"
        "libz"
        "libbase"
        "libzopfli"
    ];

    target = {
        windows = {
            host_ldlibs = ["-lpthread"];
            enabled = true;
        };
    };
};

in { inherit zipalign; }
