{ cc_library_headers, cc_library_static, cc_test }:
let

libpdx_headers = cc_library_headers {
    name = "libpdx_headers";
    export_include_dirs = ["private"];
    vendor_available = true;
    min_sdk_version = "29";
};

libpdx = cc_library_static {
    name = "libpdx";
    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-DLOG_TAG=\"libpdx\""
        "-DTRACE=0"
    ];
    header_libs = ["libpdx_headers"];
    export_header_lib_headers = ["libpdx_headers"];
    srcs = [
        "client.cpp"
        "service.cpp"
        "service_dispatcher.cpp"
        "status.cpp"
    ];
    shared_libs = [
        "libbinder"
        "libcutils"
        "libutils"
        "liblog"
    ];
};

pdx_tests = cc_test {
    name = "pdx_tests";
    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        "client_tests.cpp"
        "mock_tests.cpp"
        "serialization_tests.cpp"
        "service_tests.cpp"
        "status_tests.cpp"
        "thread_local_buffer_tests.cpp"
        "variant_tests.cpp"
    ];
    static_libs = [
        "libcutils"
        "libgmock"
        "libpdx"
        "liblog"
        "libutils"
    ];
    shared_libs = [
        "libvndksupport"
    ];
};

#  Code analysis target.
pdx_encoder_performance_test = cc_test {
    name = "pdx_encoder_performance_test";
    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-O2"
    ];
    srcs = [
        "encoder_performance_test.cpp"
    ];
    static_libs = [
        "libpdx"
    ];
};

in { inherit libpdx libpdx_headers pdx_encoder_performance_test pdx_tests; }
