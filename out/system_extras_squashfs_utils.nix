{ cc_library, sh_binary_host }:
let

#  Copyright 2015 The Android Open Source Project

libsquashfs_utils = cc_library {
    name = "libsquashfs_utils";
    cflags = ["-Werror"];
    host_supported = true;
    recovery_available = true;
    srcs = [
        "squashfs_utils.c"
    ];
    include_dirs = ["external/squashfs-tools/squashfs-tools"];
    export_include_dirs = ["."];

    shared_libs = [
        "libcutils"
    ];

    target = {
        host = {
            cflags = [
                "-Wall"
                "-Werror"
                "-D_GNU_SOURCE"
                "-DSQUASHFS_NO_KLOG"
            ];
        };
    };
};

"mksquashfsimage.sh" = sh_binary_host {
    name = "mksquashfsimage.sh";
    src = "mksquashfsimage.sh";
};

in { inherit "mksquashfsimage.sh" libsquashfs_utils; }
