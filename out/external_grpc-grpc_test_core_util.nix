{ cc_library_static }:
let

libgpr_test_util = cc_library_static {
    name = "libgpr_test_util";
    defaults = ["grpc_defaults"];
    srcs = [
        "memory_counters.cc"
        "test_config.cc"
    ];
    static_libs = [
        "gpr_base"
    ];
};

in { inherit libgpr_test_util; }
