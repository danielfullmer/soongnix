{ cc_library_shared, cc_test }:
let

libfdtrack = cc_library_shared {
    name = "libfdtrack";
    srcs = ["fdtrack.cpp"];
    stl = "libc++_static";

    header_libs = ["bionic_libc_platform_headers"];
    static_libs = [
        "libasync_safe"
        "libbase"
        "libunwindstack"
        "liblzma"
        "liblog"
    ];
    version_script = "libfdtrack.map.txt";

    allow_undefined_symbols = true;
    recovery_available = true;
};

fdtrack_test = cc_test {
    name = "fdtrack_test";
    srcs = ["fdtrack_test.cpp"];
    whole_static_libs = ["libBionicCtsGtestMain"];
    static_libs = ["liblog"];
    test_suites = ["device-tests"];
};

in { inherit fdtrack_test libfdtrack; }
