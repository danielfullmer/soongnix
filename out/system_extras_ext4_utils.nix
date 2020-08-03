{ cc_binary_host, cc_library, prebuilt_etc, python_binary_host }:
let

#  Copyright 2010 The Android Open Source Project

libext4_utils = cc_library {
    name = "libext4_utils";
    host_supported = true;
    recovery_available = true;
    srcs = [
        "ext4_utils.cpp"
        "wipe.cpp"
        "ext4_sb.cpp"
    ];
    #  Various instances of dereferencing a type-punned pointer in extent.c
    cflags = [
        "-Werror"
        "-fno-strict-aliasing"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "libbase"
        "libsparse"
        "libz"
    ];

    target = {
        host = {
            static_libs = ["libsparse"];
        };
        not_windows = {
            static_libs = ["libselinux"];
        };
        windows = {
            host_ldlibs = ["-lws2_32"];
            enabled = true;
        };

        android = {
            shared_libs = [
                "libbase"
                "libselinux"
            ];

            shared = {
                cflags = ["-DREAL_UUID"];
                shared_libs = [
                    "libcutils"
                    "libext2_uuid"
                ];
            };
        };
    };
};

mkuserimg_mke2fs = python_binary_host {
    name = "mkuserimg_mke2fs";
    srcs = [
        "mkuserimg_mke2fs.py"
    ];

    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };

    required = [
        "mke2fs"
        "e2fsdroid"
    ];
};

"mke2fs.conf" = prebuilt_etc {
    name = "mke2fs.conf";
    recovery_available = true;
    src = "mke2fs.conf";
};

blk_alloc_to_base_fs = cc_binary_host {
    name = "blk_alloc_to_base_fs";
    srcs = ["blk_alloc_to_base_fs.cpp"];
    shared_libs = ["libcutils"];
    target = {
        host = {
            cflags = ["-DHOST"];
        };
    };
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit "mke2fs.conf" blk_alloc_to_base_fs libext4_utils mkuserimg_mke2fs; }
