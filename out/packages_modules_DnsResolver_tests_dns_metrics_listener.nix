{ cc_test_library }:
let

libnetd_test_metrics_listener = cc_test_library {
    name = "libnetd_test_metrics_listener";
    defaults = [
        "netd_defaults"
        "resolv_test_defaults"
    ];
    srcs = [
        "base_metrics_listener.cpp"
        "dns_metrics_listener.cpp"
        "test_metrics.cpp"
    ];
    shared_libs = [
        "libbinder_ndk"
    ];
    static_libs = [
        "libutils"
        "netd_event_listener_interface-ndk_platform"
    ];
};

in { inherit libnetd_test_metrics_listener; }
