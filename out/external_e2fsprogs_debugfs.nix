{ cc_binary, cc_defaults }:
let

#  Copyright 2017 The Android Open Source Project

# ########################
#  Build the debugfs binary

debugfs-defaults = cc_defaults {
    name = "debugfs-defaults";
    defaults = ["e2fsprogs-defaults"];
    srcs = [
        "debug_cmds.c"
        "debugfs.c"
        "util.c"
        "ncheck.c"
        "icheck.c"
        "ls.c"
        "lsdel.c"
        "dump.c"
        "set_fields.c"
        "logdump.c"
        "htree.c"
        "unused.c"
        "e2freefrag.c"
        "filefrag.c"
        "extent_cmds.c"
        "extent_inode.c"
        "zap.c"
        "quota.c"
        "xattrs.c"
        "journal.c"
        "revoke.c"
        "recovery.c"
        "do_journal.c"
    ];
    cflags = [
        "-Wno-unused-variable"
        "-fno-strict-aliasing"
        "-DDEBUGFS"
    ];
    include_dirs = [
        "external/e2fsprogs/misc"
        "external/e2fsprogs/e2fsck"
    ];
};

debugfs_libs = [
    "libext2_misc"
    "libext2fs"
    "libext2_blkid"
    "libext2_uuid"
    "libext2_ss"
    "libext2_quota"
    "libext2_com_err"
    "libext2_e2p"
    "libext2_support"
];

debugfs = cc_binary {
    name = "debugfs";
    host_supported = true;
    defaults = ["debugfs-defaults"];

    shared_libs = debugfs_libs;
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

debugfs_static = cc_binary {
    name = "debugfs_static";
    static_executable = true;
    defaults = ["debugfs-defaults"];

    static_libs = debugfs_libs;
};

in { inherit debugfs debugfs-defaults debugfs_static; }
