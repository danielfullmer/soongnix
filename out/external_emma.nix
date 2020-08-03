{ java_library }:
let

#  Copyright 2008 The Android Open Source Project
#  the custom dex'ed emma library ready to put on a device.
#  ============================================================
emma = java_library {
    name = "emma";
    srcs = [
        "core/**/*.java"
        "pregenerated/**/*.java"
    ];
    java_resource_dirs = [
        "core/res"
        "pregenerated/res"
    ];
    sdk_version = "9";
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"];
    };
    host_supported = true;
};

in { inherit emma; }
