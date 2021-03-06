{ cc_library_shared }:
let

libRSSupportIO = cc_library_shared {
    name = "libRSSupportIO";
    defaults = ["rs_support_defaults"];

    sdk_version = "14";

    srcs = [
        "android_rscompat_usage_io.cpp"
        "android_rscompat_usage_io_driver.cpp"
    ];

    include_dirs = [
        "frameworks/rs"
        "frameworks/rs/cpp"
        "frameworks/rs/driver"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
        "-DRS_COMPATIBILITY_LIB"
    ];

    shared_libs = [
        "libandroid"
        "libdl"
    ];

    ldflags = [
        "-Wl,--exclude-libs,libc++_static.a"
        "-Wl,--hash-style=sysv"
    ];
    stl = "c++_static";
};

librsjni = cc_library_shared {
    name = "librsjni";
    defaults = ["rs_support_defaults"];

    sdk_version = "9";

    srcs = ["android_renderscript_RenderScript.cpp"];

    shared_libs = [
        "libdl"
        "libjnigraphics"
        "liblog"
    ];

    static_libs = ["libRSDispatch"];

    include_dirs = [
        "frameworks/rs"
        "frameworks/rs/cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
        "-Wno-unused-parameter"
        "-DRS_COMPATIBILITY_LIB"
    ];

    required = ["libRSSupport"];

    ldflags = [
        "-Wl,--exclude-libs,libc++_static.a"
        "-Wl,--hash-style=sysv"
    ];

    stl = "c++_static";
};

in { inherit libRSSupportIO librsjni; }
