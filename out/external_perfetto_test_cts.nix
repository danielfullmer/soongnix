{ cc_test }:
let

CtsPerfettoTestCases = cc_test {
    name = "CtsPerfettoTestCases";
    srcs = [
        "device_feature_test_cts.cc"
        "end_to_end_integrationtest_cts.cc"
        "heapprofd_test_cts.cc"
    ];
    static_libs = [
        "libgmock"
        "libprotobuf-cpp-lite"
        "perfetto_src_tracing_ipc"
        "perfetto_trace_protos"
    ];
    shared_libs = [
        "libandroid"
        "liblog"
    ];
    whole_static_libs = [
        "perfetto_cts_deps"
    ];
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    stl = "libc++_static";
    cflags = [
        "-DPERFETTO_BUILD_WITH_ANDROID"
    ];
};

in { inherit CtsPerfettoTestCases; }
