{ cc_binary, cc_defaults, cc_library, cc_library_static }:
let

#  Copyright 2017 The Android Open Source Project

#  Library used to export files from this directory to other programs in this
#  project.
libext2_misc = cc_library {
    name = "libext2_misc";
    host_supported = true;
    recovery_available = true;
    defaults = ["e2fsprogs-defaults"];

    target = {
        windows = {
            include_dirs = ["external/e2fsprogs/include/mingw"];
            enabled = true;
            cflags = ["-Wno-unused-variable"];
        };
    };

    srcs = [
        "create_inode.c"
    ];
    cflags = ["-Wno-error=format-extra-args"];
    shared_libs = [
        "libext2fs"
        "libext2_com_err"
        "libext2_quota"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
    export_include_dirs = ["."];
};

# ########################################################################
#  Build mke2fs

mke2fs = cc_binary {
    name = "mke2fs";
    host_supported = true;
    recovery_available = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = [
        "mke2fs.c"
        "util.c"
        "mk_hugefiles.c"
        "default_profile.c"
    ];
    cflags = [
        "-Wno-error=format"
        "-Wno-error=type-limits"
        "-Wno-format-extra-args"
    ];
    target = {
        host = {
            static_libs = [
                "libext2_blkid"
                "libext2_misc"
                "libext2_uuid"
                "libext2_quota"
                "libext2_com_err"
                "libext2_e2p"
                "libext2fs"
                "libsparse"
                "libbase"
                "libz"
            ];
        };
        not_windows = {
            required = [
                "mke2fs.conf"
            ];
        };
        windows = {
            include_dirs = ["external/e2fsprogs/include/mingw"];
            cflags = [
                "-D_POSIX"
                "-D__USE_MINGW_ALARM"
                #  mke2fs.c has a warning from gcc which cannot be suppressed:
                #  passing argument 3 of 'ext2fs_get_device_size' from
                #  incompatible pointer type
                "-Wno-error"
            ];
            ldflags = ["-static"];
            host_ldlibs = ["-lws2_32"];
            enabled = true;
        };
        android = {
            required = [
                "mke2fs.conf"
            ];
            shared_libs = [
                "libext2fs"
                "libext2_blkid"
                "libext2_misc"
                "libext2_uuid"
                "libext2_quota"
                "libext2_com_err"
                "libext2_e2p"
            ];
            symlinks = [
                "mkfs.ext2"
                "mkfs.ext3"
                "mkfs.ext4"
            ];
        };
    };
    stl = "libc++_static";
    include_dirs = ["external/e2fsprogs/e2fsck"];
};

# ##########################################################################
#  Build tune2fs

tune2fs-defaults = cc_defaults {
    name = "tune2fs-defaults";
    defaults = ["e2fsprogs-defaults"];
    srcs = [
        "tune2fs.c"
        "util.c"
    ];
    cflags = ["-DNO_RECOVERY"];
    include_dirs = ["external/e2fsprogs/e2fsck"];
};

tune2fs_libs = [
    "libext2_blkid"
    "libext2_com_err"
    "libext2_quota"
    "libext2_uuid"
    "libext2_e2p"
    "libext2fs"
];

tune2fs = cc_binary {
    name = "tune2fs";
    host_supported = true;
    defaults = ["tune2fs-defaults"];

    shared_libs = tune2fs_libs;
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

tune2fs_static = cc_binary {
    name = "tune2fs_static";
    static_executable = true;
    defaults = ["tune2fs-defaults"];

    static_libs = tune2fs_libs;
};

tune2fs_ramdisk = cc_binary {
    name = "tune2fs_ramdisk";
    stem = "tune2fs";
    static_executable = true;
    ramdisk = true;
    defaults = ["tune2fs-defaults"];
    system_shared_libs = [];
    static_libs = tune2fs_libs;
};

libtune2fs = cc_library_static {
    name = "libtune2fs";
    defaults = ["tune2fs-defaults"];

    cflags = ["-DBUILD_AS_LIB"];
    static_libs = tune2fs_libs;
};

# ########################################################################
#  Build badblocks

badblocks = cc_binary {
    name = "badblocks";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = ["badblocks.c"];
    shared_libs = [
        "libext2fs"
        "libext2_com_err"
        "libext2_uuid"
        "libext2_blkid"
        "libext2_e2p"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

# ########################################################################
#  Build chattr

chattr-e2fsprogs = cc_binary {
    name = "chattr-e2fsprogs";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = ["chattr.c"];
    shared_libs = [
        "libext2_com_err"
        "libext2_e2p"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

# ########################################################################
#  Build lsattr

lsattr-defaults = cc_defaults {
    name = "lsattr-defaults";
    srcs = ["lsattr.c"];
    defaults = ["e2fsprogs-defaults"];
};

lsattr_libs = [
    "libext2_com_err"
    "libext2_e2p"
];

lsattr-e2fsprogs = cc_binary {
    name = "lsattr-e2fsprogs";
    host_supported = true;
    defaults = ["lsattr-defaults"];

    shared_libs = lsattr_libs;
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

lsattr_static = cc_binary {
    name = "lsattr_static";
    static_executable = true;
    defaults = ["lsattr-defaults"];

    static_libs = lsattr_libs;
};

# ########################################################################
#  Build blkid

blkid = cc_binary {
    name = "blkid";
    defaults = ["e2fsprogs-defaults"];

    srcs = ["blkid.c"];
    shared_libs = [
        "libext2fs"
        "libext2_blkid"
        "libext2_com_err"
        "libext2_e2p"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

# ########################################################################
#  Build e4crypt

e4crypt = cc_binary {
    name = "e4crypt";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = ["e4crypt.c"];
    shared_libs = [
        "libext2fs"
        "libext2_uuid"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];

    target = {
        darwin = {
            enabled = false;
        };
    };
};

# ##########################################################################
#  Build e2image

e2image = cc_binary {
    name = "e2image";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = ["e2image.c"];
    shared_libs = [
        "libext2fs"
        "libext2_blkid"
        "libext2_com_err"
        "libext2_quota"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

# ##########################################################################
#  Build filefrag

filefrag = cc_binary {
    name = "filefrag";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = ["filefrag.c"];
    shared_libs = [
        "libext2fs"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

# ##########################################################################
#  Build e2freefrag

e2freefrag = cc_binary {
    name = "e2freefrag";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = [
        "e2freefrag.c"
    ];
    header_libs = ["libext2-headers"];
    shared_libs = [
        "libext2fs"
        "libext2_com_err"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

in { inherit badblocks blkid chattr-e2fsprogs e2freefrag e2image e4crypt filefrag libext2_misc libtune2fs lsattr-defaults lsattr-e2fsprogs lsattr_static mke2fs tune2fs tune2fs-defaults tune2fs_ramdisk tune2fs_static; }
