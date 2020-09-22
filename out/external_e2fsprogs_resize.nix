{ cc_binary, cc_defaults }:
let

#  Copyright 2017 The Android Open Source Project

resize2fs_libs = [
    "libext2fs"
    "libext2_com_err"
    "libext2_e2p"
    "libext2_uuid"
    "libext2_blkid"
];

resize2fs-defaults = cc_defaults {
    name = "resize2fs-defaults";
    defaults = ["e2fsprogs-defaults"];
    srcs = [
        "extent.c"
        "resize2fs.c"
        "main.c"
        "online.c"
        "sim_progress.c"
        "resource_track.c"
    ];
};

resize2fs = cc_binary {
    name = "resize2fs";
    host_supported = true;
    defaults = ["resize2fs-defaults"];

    #  Host binaries can be compiled statically to be re-used in other environments.
    #  For android binaries, we keep shared libraries to keep the binary size smaller.
    target = {
        host = {
            static_libs = resize2fs_libs;
        };
        android = {
            shared_libs = resize2fs_libs;
        };
    };
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

resize2fs_ramdisk = cc_binary {
    name = "resize2fs_ramdisk";
    stem = "resize2fs";
    static_executable = true;
    ramdisk = true;
    defaults = ["resize2fs-defaults"];
    system_shared_libs = [];
    static_libs = resize2fs_libs;
};

in { inherit resize2fs resize2fs-defaults resize2fs_ramdisk; }
