{ cc_binary, cc_defaults }:
let

#  Copyright 2017 The Android Open Source Project

# ########################
#  Build the e2fsck binary

e2fsck-defaults = cc_defaults {
    name = "e2fsck-defaults";
    defaults = ["e2fsprogs-defaults"];
    srcs = [
        "e2fsck.c"
        "super.c"
        "pass1.c"
        "pass1b.c"
        "pass2.c"
        "pass3.c"
        "pass4.c"
        "pass5.c"
        "logfile.c"
        "journal.c"
        "recovery.c"
        "revoke.c"
        "badblocks.c"
        "util.c"
        "unix.c"
        "dirinfo.c"
        "dx_dirinfo.c"
        "ehandler.c"
        "problem.c"
        "message.c"
        "ea_refcount.c"
        "quota.c"
        "rehash.c"
        "region.c"
        "sigcatcher.c"
        "readahead.c"
        "extents.c"
    ];
    cflags = [
        "-Wno-sign-compare"
        "-fno-strict-aliasing"
    ];
};

e2fsck_libs = [
    "libext2fs"
    "libext2_blkid"
    "libext2_com_err"
    "libext2_uuid"
    "libext2_quota"
    "libext2_e2p"
];

e2fsck = cc_binary {
    name = "e2fsck";
    host_supported = true;
    defaults = ["e2fsck-defaults"];

    shared_libs = e2fsck_libs;
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

e2fsck_static = cc_binary {
    name = "e2fsck_static";
    static_executable = true;
    defaults = ["e2fsck-defaults"];

    static_libs = e2fsck_libs;
};

e2fsck_ramdisk = cc_binary {
    name = "e2fsck_ramdisk";
    stem = "e2fsck";
    static_executable = true;
    ramdisk = true;
    defaults = ["e2fsck-defaults"];
    system_shared_libs = [];
    static_libs = e2fsck_libs;
};

in { inherit e2fsck e2fsck-defaults e2fsck_ramdisk e2fsck_static; }
