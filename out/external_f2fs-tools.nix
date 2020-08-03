{ cc_binary, cc_defaults, cc_library_host_static, cc_library_static }:
let

#  Copyright 2017 The Android Open Source Project

f2fs-tools-defaults = cc_defaults {
    name = "f2fs-tools-defaults";
    cflags = [
        "-DF2FS_MAJOR_VERSION=1"
        "-DF2FS_MINOR_VERSION=11"
        "-DF2FS_TOOLS_VERSION=\"1.12.0\""
        "-DF2FS_TOOLS_DATE=\"2018-11-12\""
        "-DWITH_ANDROID"
        "-Wall"
        "-Werror"
        "-Wno-format"
        "-Wno-macro-redefined"
        "-Wno-missing-field-initializers"
        "-Wno-pointer-arith"
        "-Wno-sign-compare"
        "-Wno-unused-function"
        "-Wno-string-plus-int"
    ];
    local_include_dirs = [
        "include"
        "mkfs"
        "fsck"
    ];
    include_dirs = [
        "external/e2fsprogs/lib/"
        "system/core/libsparse/include"
    ];
    target = {
        windows = {
            enabled = false;
        };
    };
};

libf2fs_src_files = cc_defaults {
    name = "libf2fs_src_files";
    cflags = ["-DWITH_BLKDISCARD"];
    srcs = [
        "lib/libf2fs.c"
        "mkfs/f2fs_format.c"
        "mkfs/f2fs_format_utils.c"
        "lib/libf2fs_zoned.c"
    ];
};

make_f2fs_src_files = cc_defaults {
    name = "make_f2fs_src_files";
    srcs = [
        "lib/libf2fs_io.c"
        "mkfs/f2fs_format_main.c"
    ];
};

fsck_main_src_files = cc_defaults {
    name = "fsck_main_src_files";
    srcs = [
        "fsck/dir.c"
        "fsck/dict.c"
        "fsck/mkquota.c"
        "fsck/quotaio.c"
        "fsck/quotaio_tree.c"
        "fsck/quotaio_v2.c"
        "fsck/node.c"
        "fsck/segment.c"
        "fsck/xattr.c"
        "fsck/main.c"
        "fsck/mount.c"
        "lib/libf2fs.c"
        "lib/libf2fs_io.c"
    ];
};

libf2fs_fmt = cc_library_static {
    name = "libf2fs_fmt";
    recovery_available = true;
    defaults = [
        "f2fs-tools-defaults"
        "libf2fs_src_files"
    ];
};

libf2fs_fmt_host = cc_library_host_static {
    name = "libf2fs_fmt_host";
    defaults = [
        "f2fs-tools-defaults"
        "libf2fs_src_files"
    ];
    target = {
        windows = {
            include_dirs = ["external/e2fsprogs/include/mingw"];
            cflags = [
                "-DANDROID_WINDOWS_HOST"
                "-Wno-typedef-redefinition"
                "-Wno-unused-parameter"
            ];
            enabled = true;
        };
    };
};

make_f2fs = cc_binary {
    name = "make_f2fs";
    defaults = [
        "f2fs-tools-defaults"
        "make_f2fs_src_files"
    ];
    host_supported = true;
    recovery_available = true;
    target = {
        android = {
            static_libs = [
                "libf2fs_fmt"
            ];
            shared_libs = [
                "libext2_uuid"
                "libsparse"
                "libbase"
            ];
        };
        host = {
            static_libs = [
                "libf2fs_fmt_host"
                "libext2_uuid"
                "libsparse"
                "libbase"
                "libz"
            ];
        };
        windows = {
            include_dirs = ["external/e2fsprogs/include/mingw"];
            cflags = ["-DANDROID_WINDOWS_HOST"];
            ldflags = ["-static"];
            host_ldlibs = ["-lws2_32"];
            enabled = true;
        };
    };
};

"fsck.f2fs" = cc_binary {
    name = "fsck.f2fs";
    defaults = [
        "f2fs-tools-defaults"
        "fsck_main_src_files"
    ];
    host_supported = true;
    cflags = [
        "-DWITH_RESIZE"
        "-DWITH_DEFRAG"
    ];
    srcs = [
        "fsck/fsck.c"
        "fsck/resize.c"
        "fsck/defrag.c"
    ];
    shared_libs = [
        "libext2_uuid"
        "libsparse"
        "libbase"
    ];
    symlinks = [
        "resize.f2fs"
        "defrag.f2fs"
    ];
};

sload_f2fs = cc_binary {
    name = "sload_f2fs";
    defaults = [
        "f2fs-tools-defaults"
        "fsck_main_src_files"
    ];
    host_supported = true;
    recovery_available = true;
    cflags = ["-DWITH_SLOAD"];
    srcs = [
        "fsck/fsck.c"
        "fsck/sload.c"
    ];
    target = {
        android = {
            shared_libs = [
                "libext2_uuid"
                "libsparse"
                "libbase"
                "libcrypto"
                "libselinux"
                "libcutils"
                "liblog"
            ];
        };
        host = {
            static_libs = [
                "libext2_uuid"
                "libsparse"
                "libbase"
                "libcrypto"
                "libselinux"
                "libcutils"
                "liblog"
                "libz"
            ];
        };
    };
    stl = "libc++_static";
};

check_f2fs = cc_binary {
    name = "check_f2fs";
    host_supported = false;
    cflags = ["--static"];
    srcs = ["tools/check_f2fs.c"];
    product_specific = true;
};

tools-defaults = cc_defaults {
    name = "tools-defaults";
    cflags = [
        "-Wno-unused-function"
    ];
    local_include_dirs = [
        "include"
    ];
    target = {
        windows = {
            enabled = false;
        };
        darwin = {
            enabled = false;
        };
    };
    product_specific = true;
};

f2fscrypt = cc_binary {
    name = "f2fscrypt";
    defaults = [
        "tools-defaults"
    ];
    shared_libs = [
        "libext2_uuid"
    ];
    srcs = [
        "tools/f2fscrypt.c"
        "tools/sha512.c"
    ];
};

f2fsstat = cc_binary {
    name = "f2fsstat";
    defaults = [
        "tools-defaults"
    ];
    srcs = [
        "tools/f2fstat.c"
    ];
};

"f2fs.fibmap" = cc_binary {
    name = "f2fs.fibmap";
    defaults = [
        "tools-defaults"
    ];
    srcs = [
        "tools/fibmap.c"
    ];
};

in { inherit "f2fs.fibmap" "fsck.f2fs" check_f2fs f2fs-tools-defaults f2fscrypt f2fsstat fsck_main_src_files libf2fs_fmt libf2fs_fmt_host libf2fs_src_files make_f2fs make_f2fs_src_files sload_f2fs tools-defaults; }
