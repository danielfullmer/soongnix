{ cc_binary }:
let

#  Copyright 2017 The Android Open Source Project

subdirs = ["android"];

# ########################################################################
#  Build add_ext4_encrypt

add_ext4_encrypt = cc_binary {
    name = "add_ext4_encrypt";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = ["add_ext4_encrypt.c"];
    shared_libs = [
        "libext2fs"
        "libext2_com_err"
    ];
    system_shared_libs = [
        "libc"
        "libdl"
    ];
};

in { inherit add_ext4_encrypt; }
