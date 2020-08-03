{ aidl_interface, cc_library, cc_library_headers, cc_library_static, cc_test, cc_test_library, genrule }:
let

libnetd_resolv_headers = cc_library_headers {
    name = "libnetd_resolv_headers";
    export_include_dirs = ["include"];
};

dnsresolver_aidl_interface = aidl_interface {
    name = "dnsresolver_aidl_interface";
    local_include_dir = "binder";
    srcs = [
        "binder/android/net/IDnsResolver.aidl"
        "binder/android/net/ResolverParamsParcel.aidl"
    ];
    imports = [
        "netd_event_listener_interface"
    ];
    backend = {
        ndk = {
            gen_log = true;
        };
    };
    api_dir = "aidl/dnsresolver";
    versions = [
        "1"
        "2"
    ];
};

libnetd_test_metrics_listener = cc_test_library {
    name = "libnetd_test_metrics_listener";
    defaults = ["netd_defaults"];
    srcs = [
        "tests/BaseTestMetricsListener.cpp"
        "tests/TestMetrics.cpp"
    ];
    include_dirs = [
        "system/netd/include"
    ];
    shared_libs = [
        "libbinder"
        "libutils"
        "netd_event_listener_interface-V1-cpp"
    ];
};

libnetd_resolv = cc_library {
    name = "libnetd_resolv";
    version_script = "libnetd_resolv.map.txt";
    defaults = ["netd_defaults"];
    srcs = [
        "getaddrinfo.cpp"
        "gethnamaddr.cpp"
        "sethostent.cpp"
        "res_cache.cpp"
        "res_comp.cpp"
        "res_debug.cpp"
        "res_init.cpp"
        "res_mkquery.cpp"
        "res_query.cpp"
        "res_send.cpp"
        "res_state.cpp"
        "res_stats.cpp"
        "Dns64Configuration.cpp"
        "DnsProxyListener.cpp"
        "DnsResolver.cpp"
        "DnsResolverService.cpp"
        "DnsTlsDispatcher.cpp"
        "DnsTlsQueryMap.cpp"
        "DnsTlsTransport.cpp"
        "DnsTlsServer.cpp"
        "DnsTlsSessionCache.cpp"
        "DnsTlsSocket.cpp"
        "PrivateDnsConfiguration.cpp"
        "ResolverController.cpp"
        "ResolverEventReporter.cpp"
    ];
    #  Link everything statically (except for libc) to minimize our dependence
    #  on system ABIs
    stl = "libc++_static";
    static_libs = [
        "libbase"
        "libcrypto"
        "libcutils"
        "libjsoncpp"
        "liblog"
        "libnetdutils"
        "libssl"
        "libstatslog_resolv"
        "libstatssocket"
        "libsysutils"
        "libutils"
        "netd_event_listener_interface-ndk_platform"
        "dnsresolver_aidl_interface-ndk_platform"
        "server_configurable_flags"
        "stats_proto"
        "libprotobuf-cpp-lite"
    ];
    shared_libs = [
        "libbinder_ndk"
    ];
    include_dirs = [
        "system/netd/include"
        "system/netd/server"
    ];
    export_include_dirs = ["include"];
    #  TODO: pie in the sky: make this code clang-tidy clean
    tidy = false;
    product_variables = {
        debuggable = {
            cppflags = [
                "-DRESOLV_ALLOW_VERBOSE_LOGGING=1"
            ];
        };
    };
};

stats_proto = cc_library_static {
    name = "stats_proto";
    defaults = ["netd_defaults"];
    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    srcs = [
        "stats.proto"
    ];
};

"statslog_resolv.h" = genrule {
    name = "statslog_resolv.h";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --header $(genDir)/statslog_resolv.h --module resolv --namespace android,net,stats";
    out = [
        "statslog_resolv.h"
    ];
};

"statslog_resolv.cpp" = genrule {
    name = "statslog_resolv.cpp";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --cpp $(genDir)/statslog_resolv.cpp --module resolv --namespace android,net,stats --importHeader statslog_resolv.h";
    out = [
        "statslog_resolv.cpp"
    ];
};

libstatslog_resolv = cc_library_static {
    name = "libstatslog_resolv";
    generated_sources = ["statslog_resolv.cpp"];
    generated_headers = ["statslog_resolv.h"];
    defaults = ["netd_defaults"];
    export_generated_headers = ["statslog_resolv.h"];
    static_libs = [
        "libcutils"
        "liblog"
        "libstatssocket"
        "libutils"
    ];
};

resolv_integration_test = cc_test {
    name = "resolv_integration_test";
    test_suites = ["device-tests"];
    require_root = true;
    defaults = ["netd_defaults"];
    srcs = [
        "dns_responder/dns_responder.cpp"
        "resolver_test.cpp"
        "dnsresolver_binder_test.cpp"
    ];
    include_dirs = [
        "system/netd/resolv/include"
        "system/netd/server"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcrypto"
        "liblog"
        "libnetd_client"
        "libssl"
        "libutils"
    ];
    static_libs = [
        "libgmock"
        "libnetd_test_dnsresponder"
        "libnetd_test_metrics_listener"
        "libnetd_test_tun_interface"
        "liblogwrap"
        "libnetdutils"
        "netd_aidl_interface-V2-cpp"
        "netd_event_listener_interface-V1-cpp"
        "dnsresolver_aidl_interface-V2-cpp"
    ];
    tidy = false;
    compile_multilib = "both";
};

resolv_unit_test = cc_test {
    name = "resolv_unit_test";
    test_suites = ["device-tests"];
    defaults = ["netd_defaults"];
    srcs = [
        "dns_tls_test.cpp"
        "libnetd_resolv_test.cpp"
        "res_cache_test.cpp"
    ];
    shared_libs = [
        "libbase"
        "libcrypto"
        "libcutils"
        "liblog"
        "libssl"
    ];
    static_libs = [
        "libgmock"
        "libnetd_resolv"
        "libnetd_test_dnsresponder"
        "libnetdutils"
        "libprotobuf-cpp-lite"
        "server_configurable_flags"
        "stats_proto"
    ];
};

in { inherit "statslog_resolv.cpp" "statslog_resolv.h" dnsresolver_aidl_interface libnetd_resolv libnetd_resolv_headers libnetd_test_metrics_listener libstatslog_resolv resolv_integration_test resolv_unit_test stats_proto; }
