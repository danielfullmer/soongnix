{ cc_library }:
let

#  Copyright 2017 The Android Open Source Project

libext2_uuid = cc_library {
    name = "libext2_uuid";
    host_supported = true;
    recovery_available = true;
    unique_host_soname = true;
    defaults = ["e2fsprogs-defaults"];
    srcs = [
        "clear.c"
        "compare.c"
        "copy.c"
        "gen_uuid.c"
        "isnull.c"
        "pack.c"
        "parse.c"
        "unpack.c"
        "unparse.c"
        "uuid_time.c"
    ];
    cflags = [
        "-Wno-unused-function"
        "-Wno-unused-parameter"
    ];
    target = {
        windows = {
            #  Cannot suppress the _WIN32_WINNT redefined warning.
            cflags = ["-Wno-error"];
            include_dirs = ["external/e2fsprogs/include/mingw"];
            enabled = true;
        };
    };
    header_libs = ["libext2-headers"];
    export_include_dirs = ["."];
    export_header_lib_headers = ["libext2-headers"];
};

in { inherit libext2_uuid; }
