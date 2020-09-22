{ cc_test }:
let

CtsPerfettoTestCases = cc_test {
    name = "CtsPerfettoTestCases";
    srcs = [
        "device_feature_test_cts.cc"
        "end_to_end_integrationtest_cts.cc"
        "heapprofd_java_test_cts.cc"
        "heapprofd_test_cts.cc"
        "traced_perf_test_cts.cc"
        "utils.cc"
        ":perfetto_protos_perfetto_config_cpp_gen"
    ];
    generated_headers = [
        "perfetto_protos_perfetto_config_cpp_gen_headers"
    ];
    static_libs = [
        "libgmock"
        "libprotobuf-cpp-lite"
        "libperfetto_client_experimental"
        "perfetto_cts_deps"
        "perfetto_trace_protos"
    ];
    whole_static_libs = [
        "perfetto_gtest_logcat_printer"
    ];
    shared_libs = [
        "libandroid"
        "liblog"
    ];
    test_suites = [
        "cts"
        "vts10"
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
    defaults = [
        "perfetto_defaults"
    ];
};

in { inherit CtsPerfettoTestCases; }
