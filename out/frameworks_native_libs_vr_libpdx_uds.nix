{ cc_library_static, cc_test }:
let

libpdx_uds = cc_library_static {
    name = "libpdx_uds";
    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-DLOG_TAG=\"libpdx_uds\""
        "-DTRACE=0"
    ];
    export_include_dirs = ["private"];
    local_include_dirs = ["private"];
    srcs = [
        "channel_event_set.cpp"
        "channel_manager.cpp"
        "channel_parcelable.cpp"
        "client_channel_factory.cpp"
        "client_channel.cpp"
        "ipc_helper.cpp"
        "service_endpoint.cpp"
    ];
    static_libs = [
        "libcutils"
        "libbase"
        "libpdx"
    ];
    shared_libs = [
        "libbinder"
        "libselinux"
    ];
};

libpdx_uds_tests = cc_test {
    name = "libpdx_uds_tests";
    clang = true;
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    srcs = [
        "client_channel_tests.cpp"
        "ipc_helper_tests.cpp"
        "remote_method_tests.cpp"
        "service_framework_tests.cpp"
    ];
    static_libs = [
        "libgmock"
        "libpdx_uds"
        "libpdx"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libutils"
        "libbinder"
        "libselinux"
    ];
};

in { inherit libpdx_uds libpdx_uds_tests; }
