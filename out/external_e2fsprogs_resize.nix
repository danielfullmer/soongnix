{ cc_binary }:
let

#  Copyright 2017 The Android Open Source Project

resize2fs = cc_binary {
    name = "resize2fs";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = [
        "extent.c"
        "resize2fs.c"
        "main.c"
        "online.c"
        "sim_progress.c"
        "resource_track.c"
    ];
    shared_libs = [
        "libext2fs"
        "libext2_com_err"
        "libext2_e2p"
        "libext2_uuid"
        "libext2_blkid"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

in { inherit resize2fs; }
