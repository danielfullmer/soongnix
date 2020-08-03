{ cc_binary, cc_library_shared, sh_binary }:
let

#  Copyright 2017 The Android Open Source Project

libf2fs_sparseblock = cc_library_shared {
    name = "libf2fs_sparseblock";
    cflags = ["-Werror"];

    srcs = ["f2fs_sparseblock.c"];

    shared_libs = [
        "liblog"
        "libcutils"
    ];

    include_dirs = [
        "external/f2fs-tools/include"
        "system/core/include/log"
    ];

    export_include_dirs = ["."];
};

f2fs_sparseblock = cc_binary {
    name = "f2fs_sparseblock";
    cflags = ["-Werror"];

    srcs = ["f2fs_sparseblock.c"];

    shared_libs = [
        "liblog"
        "libcutils"
    ];

    include_dirs = [
        "external/f2fs-tools/include"
        "system/core/include/log"
    ];
};

"mkf2fsuserimg.sh" = sh_binary {
    name = "mkf2fsuserimg.sh";

    src = "mkf2fsuserimg.sh";
    required = [
        "make_f2fs"
        "sload_f2fs"
    ];
    host_supported = true;
};

in { inherit "mkf2fsuserimg.sh" f2fs_sparseblock libf2fs_sparseblock; }
