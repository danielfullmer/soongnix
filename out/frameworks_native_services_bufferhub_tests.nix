{ cc_test }:
let

BufferHubServer_test = cc_test {
    name = "BufferHubServer_test";
    srcs = [
        "BufferNode_test.cpp"
        "BufferHubIdGenerator_test.cpp"
    ];
    cflags = [
        "-DLOG_TAG=\"BufferHubServer_test\""
        "-DTRACE=0"
        "-DATRACE_TAG=ATRACE_TAG_GRAPHICS"
        "-Wall"
        "-Werror"
    ];
    compile_multilib = "first";
    header_libs = [
        "libdvr_headers"
        "libnativewindow_headers"
    ];
    shared_libs = [
        "libbufferhubservice"
        "libui"
    ];
    static_libs = [
        "libgmock"
    ];
};

in { inherit BufferHubServer_test; }
