{ cc_binary }:
let

#  Copyright 2017 The Android Open Source Project

# ##########################################################################
#  Build e2fsdroid

e2fsdroid = cc_binary {
    name = "e2fsdroid";
    host_supported = true;
    recovery_available = true;
    defaults = ["e2fsprogs-defaults"];
    cflags = ["-Wno-error=tautological-constant-out-of-range-compare"];

    srcs = [
        "e2fsdroid.c"
        "block_range.c"
        "fsmap.c"
        "block_list.c"
        "base_fs.c"
        "perms.c"
        "basefs_allocator.c"
    ];
    target = {
        host = {
            static_libs = [
                "libext2_com_err"
                "libext2_misc"
                "libext2fs"
                "libsparse"
                "libz"
                "libcutils"
                "libbase"
                "libselinux"
                "libcrypto"
                "liblog"
            ];
            sanitize = {
                address = false; #  http://b/68387795 - heap overflow in e2fsdroid
            };
        };
        android = {
            shared_libs = [
                "libext2fs"
                "libext2_com_err"
                "libext2_misc"
                "libcutils"
                "libbase"
                "libselinux"
                "libcrypto"
            ];
        };
    };
    stl = "libc++_static";
};

# ##########################################################################
#  Build ext2simg

ext2simg = cc_binary {
    name = "ext2simg";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = ["ext2simg.c"];
    shared_libs = [
        "libext2fs"
        "libext2_com_err"
        "libsparse"
        "libz"
    ];
};

in { inherit e2fsdroid ext2simg; }
