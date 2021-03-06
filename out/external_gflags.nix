{ cc_library }:
let

libgflags = cc_library {
    name = "libgflags";
    host_supported = true;
    vendor_available = true;
    recovery_available = true;
    srcs = [
        "src/gflags.cc"
        "src/gflags_completions.cc"
        "src/gflags_reporting.cc"
    ];
    cflags = [
        "-D__STDC_FORMAT_MACROS"
        "-DHAVE_INTTYPES_H"
        "-DHAVE_SYS_STAT_H"
        "-DHAVE_PTHREAD"
        "-Wall"
        "-Werror"
        "-Wno-implicit-fallthrough"
        #  gflags_completions.cc:326,327 have unannotated fall-through
    ];
    export_include_dirs = [
        "android"
    ];
};

in { inherit libgflags; }
