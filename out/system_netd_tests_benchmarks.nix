{ cc_benchmark }:
let

#  APCT build target for metrics tests

netd_benchmark = cc_benchmark {
    name = "netd_benchmark";
    defaults = ["netd_defaults"];
    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "libnetd_client"
        "libnetdutils"
    ];
    static_libs = [
        "libnetd_test_dnsresponder"
        "libutils"
        "dnsresolver_aidl_interface-cpp"
        "netd_aidl_interface-cpp"
        "netd_event_listener_interface-cpp"
    ];
    aidl = {
        include_dirs = ["system/netd/server/binder"];
    };
    include_dirs = [
        "system/netd/include"
        "system/netd/client"
        "system/netd/resolv/include"
        "system/netd/server"
        "system/netd/server/binder"
        "system/netd/resolv/dns_responder"
    ];
    srcs = [
        "main.cpp"
        "connect_benchmark.cpp"
        "dns_benchmark.cpp"
    ];
};

bpf_benchmark = cc_benchmark {
    name = "bpf_benchmark";
    defaults = ["netd_defaults"];
    shared_libs = [
        "libbase"
        "libbpf_android"
        "libnetdutils"
    ];
    static_libs = [
        "libutils"
    ];
    srcs = [
        "bpf_benchmark.cpp"
    ];
};

in { inherit bpf_benchmark netd_benchmark; }
