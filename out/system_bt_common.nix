{ cc_benchmark, cc_library_static, cc_test }:
let

libbt-common = cc_library_static {
    name = "libbt-common";
    defaults = [
        "fluoride_defaults"
        "clang_file_coverage"
    ];
    host_supported = true;
    include_dirs = [
        "system/bt"
        "system/bt/stack/include"
    ];
    srcs = [
        "address_obfuscator.cc"
        "message_loop_thread.cc"
        "metric_id_allocator.cc"
        "metrics.cc"
        "once_timer.cc"
        "repeating_timer.cc"
        "time_util.cc"
    ];
    shared_libs = [
        "libcrypto"
    ];
    static_libs = [
        "libbt-protos-lite"
    ];
};

bluetooth_test_common = cc_test {
    name = "bluetooth_test_common";
    test_suites = ["device-tests"];
    defaults = [
        "fluoride_defaults"
        "clang_coverage_bin"
    ];
    host_supported = true;
    include_dirs = [
        "system/bt"
        "system/bt/stack/include"
    ];
    srcs = [
        "address_obfuscator_unittest.cc"
        "leaky_bonded_queue_unittest.cc"
        "lru_unittest.cc"
        "message_loop_thread_unittest.cc"
        "metrics_unittest.cc"
        "metric_id_allocator_unittest.cc"
        "once_timer_unittest.cc"
        "repeating_timer_unittest.cc"
        "state_machine_unittest.cc"
        "time_util_unittest.cc"
        "id_generator_unittest.cc"
    ];
    shared_libs = [
        "libprotobuf-cpp-lite"
        "libcrypto"
    ];
    static_libs = [
        "libgmock"
        "libbt-common"
        "libbt-protos-lite"
    ];
    sanitize = {
        cfi = false;
    };
};

net_test_performance = cc_test {
    name = "net_test_performance";
    defaults = ["fluoride_defaults"];
    test_suites = ["device-tests"];
    include_dirs = ["system/bt"];
    host_supported = true;
    srcs = [
        "test/thread_performance_test.cc"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libgmock"
        "libosi"
        "libbt-common"
    ];
};

bluetooth_benchmark_thread_performance = cc_benchmark {
    name = "bluetooth_benchmark_thread_performance";
    defaults = [
        "fluoride_defaults"
    ];
    host_supported = true;
    include_dirs = ["system/bt"];
    srcs = [
        "benchmark/thread_performance_benchmark.cc"
    ];
    shared_libs = [
        "libcrypto"
        "liblog"
    ];
    static_libs = [
        "libosi"
        "libbt-common"
    ];
};

bluetooth_benchmark_timer_performance = cc_benchmark {
    name = "bluetooth_benchmark_timer_performance";
    defaults = [
        "fluoride_defaults"
    ];
    host_supported = false;
    include_dirs = ["system/bt"];
    srcs = [
        "benchmark/timer_performance_benchmark.cc"
    ];
    shared_libs = [
        "liblog"
        "libcrypto"
        "libprotobuf-cpp-lite"
        "libcrypto"
        "libcutils"
    ];
    static_libs = [
        "libosi"
        "libbt-common"
        "libbt-protos-lite"
    ];
};

in { inherit bluetooth_benchmark_thread_performance bluetooth_benchmark_timer_performance bluetooth_test_common libbt-common net_test_performance; }
