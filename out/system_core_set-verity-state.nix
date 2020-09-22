{ cc_binary }:
let

#  Copyright 2019 The Android Open Source Project

set-verity-state = cc_binary {
    name = "set-verity-state";
    srcs = ["set-verity-state.cpp"];
    shared_libs = [
        "libbase"
        "libcrypto"
        "libcrypto_utils"
        "libcutils"
        "libfec"
        "libfs_mgr_binder"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "libavb_user"
    ];

    cflags = ["-Werror"];
    symlinks = [
        "enable-verity"
        "disable-verity"
    ];
};

in { inherit set-verity-state; }
