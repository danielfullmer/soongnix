{ cc_test }:
let

alarm_test = cc_test {
    name = "alarm_test";
    defaults = ["grpc_defaults"];
    test_suites = ["device-tests"];
    srcs = [
        "alarm_test.cc"
    ];
    static_libs = [
        "libgpr_test_util"
    ];
    shared_libs = [
        "libgrpc++_unsecure"
    ];
};

in { inherit alarm_test; }
