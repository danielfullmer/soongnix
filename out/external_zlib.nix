{ cc_binary, cc_binary_host, cc_library }:
let

libz = cc_library {
    name = "libz";

    host_supported = true;
    unique_host_soname = true;
    static_ndk_lib = true;

    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    recovery_available = true;

    cflags = [
        "-O3"
        "-DUSE_MMAP"
        "-DZLIB_CONST"
        "-Wall"
        "-Werror"
    ];
    stl = "none";
    export_include_dirs = ["."];
    srcs = [
        "src/adler32.c"
        "src/compress.c"
        "src/crc32.c"
        "src/deflate.c"
        "src/gzclose.c"
        "src/gzlib.c"
        "src/gzread.c"
        "src/gzwrite.c"
        "src/infback.c"
        "src/inflate.c"
        "src/inftrees.c"
        "src/inffast.c"
        "src/trees.c"
        "src/uncompr.c"
        "src/zutil.c"
    ];

    arch = {
        arm = {
            #  measurements show that the ARM version of ZLib is about x1.17 faster
            #  than the thumb one...
            instruction_set = "arm";

            #  TODO: This is to work around b/24465209. Remove after root cause is fixed
            pack_relocations = false;
            ldflags = ["-Wl,--hash-style=both"];
        };
    };

    target = {
        linux_bionic = {
            enabled = true;
        };
        windows = {
            enabled = true;
        };
    };
};

minigzip = cc_binary_host {
    name = "minigzip";
    srcs = ["src/test/minigzip.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_libs = ["libz"];
    stl = "none";
};

zlib_example = cc_binary {
    name = "zlib_example";
    srcs = ["src/test/example.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libz"];
    stl = "none";
};

zlib_example_host = cc_binary_host {
    name = "zlib_example_host";
    srcs = ["src/test/example.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_libs = ["libz"];
    stl = "none";
};

#  This module is defined in development/ndk/Android.bp. Updating these headers
#  to be usable for any API level is going to be some work (at the very least,
#  there's a ZLIB_VERNUM that will need to be handled since early versions of
#  Android did not have all the APIs that calling code will use if this is set
#  to the current value.
#
#  The NDK never updated the zlib headers when the platform updated, so until we
#  solve this the NDK will continue shipping the old headers.
#
#  ndk_headers {
#      name: "libz_headers",
#      from: "src",
#      to: "",
#      srcs: [
#          "src/zconf.h",
#          "src/zlib.h",
#      ],
#      license: "NOTICE",
#  }

in { inherit libz minigzip zlib_example zlib_example_host; }
