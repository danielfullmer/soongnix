{ cc_defaults, cc_library }:
let

libfuse_default_flags = cc_defaults {
    name = "libfuse_default_flags";
    local_include_dirs = [
        "include/"
        "lib/"
    ];
    cflags = [
        "-D_FILE_OFFSET_BITS=64"
        "-DFUSERMOUNT_DIR=\"/system/bin\""
        "-DFUSE_USE_VERSION=34"
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-sign-compare"
        "-Wno-incompatible-pointer-types"
        "-Wno-missing-field-initializers"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];

    clang = true;
    sdk_version = "current";

    ldflags = [
    ];
};

libfuse = cc_library {
    name = "libfuse";
    defaults = [
        "libfuse_default_flags"
    ];

    export_include_dirs = [
        "include"
        "lib"
    ];

    version_script = "lib/fuse_versionscript";

    vendor_available = true;

    srcs = [
        "lib/buffer.c"
        "lib/cuse_lowlevel.c"
        "lib/fuse.c"
        "lib/fuse_log.c"
        "lib/fuse_loop.c"
        "lib/fuse_loop_mt.c"
        "lib/fuse_lowlevel.c"
        "lib/fuse_opt.c"
        "lib/fuse_signals.c"
        "lib/helper.c"
        "lib/modules/subdir.c"
        "lib/modules/iconv.c"
        "lib/mount.c"
        "lib/mount_util.c"
    ];
};

in { inherit libfuse libfuse_default_flags; }
