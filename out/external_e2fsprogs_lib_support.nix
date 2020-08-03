{ cc_library, cc_library_shared }:
let

#  Copyright 2017 The Android Open Source Project

libext2_quota = cc_library {
    name = "libext2_quota";
    host_supported = true;
    recovery_available = true;
    unique_host_soname = true;
    defaults = ["e2fsprogs-defaults"];
    srcs = [
        "dict.c"
        "mkquota.c"
        "parse_qtype.c"
        "plausible.c"
        "profile.c"
        "profile_helpers.c"
        "prof_err.c"
        "quotaio.c"
        "quotaio_tree.c"
        "quotaio_v2.c"
    ];
    shared_libs = [
        "libext2fs"
        "libext2_blkid"
        "libext2_com_err"
    ];

    target = {
        windows = {
            enabled = true;
        };
    };

    header_libs = ["libext2-headers"];
    export_include_dirs = ["."];
    export_header_lib_headers = ["libext2-headers"];
};

libext2_profile = cc_library_shared {
    name = "libext2_profile";
    host_supported = true;
    unique_host_soname = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = [
        "prof_err.c"
        "profile.c"
    ];
    shared_libs = ["libext2_com_err"];

    header_libs = ["libext2-headers"];
    export_include_dirs = ["."];
    export_header_lib_headers = ["libext2-headers"];
};

libext2_support = cc_library {
    name = "libext2_support";
    host_supported = true;
    defaults = ["e2fsprogs-defaults"];

    srcs = [
        "cstring.c"
    ];
    header_libs = ["libext2-headers"];
    export_include_dirs = ["."];
};

in { inherit libext2_profile libext2_quota libext2_support; }
