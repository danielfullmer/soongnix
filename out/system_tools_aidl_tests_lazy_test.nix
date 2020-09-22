{ aidl_interface, cc_binary, cc_test }:
let

aidl_lazy_test = cc_test {
    name = "aidl_lazy_test";
    srcs = ["main.cpp"];
    test_suites = ["general-tests"];
    require_root = true;

    shared_libs = [
        "libbase"
        "liblog"
        "libutils"
        "libbinder"
    ];

    static_libs = [
        "lazy_test_service_aidl-cpp"
    ];
};

aidl_lazy_test_server = cc_binary {
    name = "aidl_lazy_test_server";
    srcs = [
        "server.cpp"
        "LazyTestService.cpp"
    ];
    init_rc = ["aidl_lazy_test_server.rc"];
    system_ext_specific = true;

    shared_libs = [
        "libbinder"
        "liblog"
        "libutils"
    ];

    static_libs = [
        "lazy_test_service_aidl-cpp"
    ];
};

lazy_test_service_aidl = aidl_interface {
    name = "lazy_test_service_aidl";
    unstable = true;
    srcs = [
        "ILazyTestService.aidl"
    ];
};

in { inherit aidl_lazy_test aidl_lazy_test_server lazy_test_service_aidl; }
