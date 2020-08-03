{ cc_library_static, cc_test }:
let

libbroadcastring = cc_library_static {
    name = "libbroadcastring";
    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    export_include_dirs = ["include"];
    shared_libs = [
        "libbase"
    ];
    export_shared_lib_headers = [
        "libbase"
    ];
};

broadcast_ring_tests = cc_test {
    name = "broadcast_ring_tests";
    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        "broadcast_ring_test.cc"
    ];
    static_libs = [
        "libbroadcastring"
    ];
    shared_libs = [
        "libbase"
    ];
};

in { inherit broadcast_ring_tests libbroadcastring; }
