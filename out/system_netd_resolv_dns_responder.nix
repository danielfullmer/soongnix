{ cc_library_static }:
let

libnetd_test_dnsresponder = cc_library_static {
    name = "libnetd_test_dnsresponder";
    defaults = ["netd_defaults"];
    shared_libs = [
        "libbase"
        "libbinder"
        "liblog"
        "libnetd_client"
        "libnetdutils"
        "libssl"
        "dnsresolver_aidl_interface-V2-cpp"
        "netd_aidl_interface-V2-cpp"
    ];
    static_libs = ["libutils"];
    include_dirs = [
        "system/netd/server"
    ];
    srcs = [
        "dns_responder.cpp"
        "dns_responder_client.cpp"
        "dns_tls_frontend.cpp"
    ];
    export_include_dirs = ["."];
};

in { inherit libnetd_test_dnsresponder; }
