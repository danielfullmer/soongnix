{ aidl_interface, cc_binary, cc_library_static, cc_test, filegroup }:
let

#  AIDL interface between netd and services.core
netd_event_listener_interface = aidl_interface {
    name = "netd_event_listener_interface";
    local_include_dir = "binder";
    srcs = [
        "binder/android/net/metrics/INetdEventListener.aidl"
    ];
    api_dir = "aidl/netdeventlistener";
    versions = ["1"];
};

#  These are used in netd_integration_test
#  TODO: fold these into a cc_library_static after converting netd/server to Android.bp
netd_integration_test_shared = filegroup {
    name = "netd_integration_test_shared";
    srcs = [
        "NetdConstants.cpp"
        "InterfaceController.cpp"
        "NetlinkCommands.cpp"
        "NetlinkListener.cpp"
        "XfrmController.cpp"
        "TrafficController.cpp"
    ];
};

netd_aidl_interface = aidl_interface {
    name = "netd_aidl_interface";
    local_include_dir = "binder";
    srcs = [
        "binder/android/net/INetd.aidl"
        #  AIDL interface that callers can implement to receive networking events from netd.
        "binder/android/net/INetdUnsolicitedEventListener.aidl"
        "binder/android/net/InterfaceConfigurationParcel.aidl"
        "binder/android/net/TetherStatsParcel.aidl"
        "binder/android/net/UidRangeParcel.aidl"
    ];
    api_dir = "aidl/netd";
    backend = {
        cpp = {
            gen_log = true;
        };
    };
    versions = [
        "1"
        "2"
    ];
};

oemnetd_aidl_interface = aidl_interface {
    #  This interface is for OEM calls to netd and vice versa that do not exist in AOSP.
    #  Those calls cannot be part of INetd.aidl and INetdUnsolicitedEventListener.aidl
    #  because those interfaces are versioned.
    #  These interfaces must never be versioned or OEMs will not be able to change them.
    name = "oemnetd_aidl_interface";
    local_include_dir = "binder";
    srcs = [
        "binder/com/android/internal/net/IOemNetd.aidl"
        "binder/com/android/internal/net/IOemNetdUnsolicitedEventListener.aidl"
    ];
};

#  Modules common to both netd and netd_unit_test
libnetd_server = cc_library_static {
    name = "libnetd_server";
    defaults = ["netd_defaults"];
    include_dirs = [
        "system/netd/include"
        "system/netd/server/binder"
    ];
    srcs = [
        "BandwidthController.cpp"
        "ClatdController.cpp"
        "ClatUtils.cpp"
        "Controllers.cpp"
        "NetdConstants.cpp"
        "FirewallController.cpp"
        "IdletimerController.cpp"
        "InterfaceController.cpp"
        "IptablesRestoreController.cpp"
        "NFLogListener.cpp"
        "NetlinkCommands.cpp"
        "NetlinkListener.cpp"
        "NetlinkManager.cpp"
        "RouteController.cpp"
        "SockDiag.cpp"
        "StrictController.cpp"
        "TcpSocketMonitor.cpp"
        "TetherController.cpp"
        "TrafficController.cpp"
        "UidRanges.cpp"
        "WakeupController.cpp"
        "XfrmController.cpp"
    ];
    shared_libs = [
        "libbpf_android"
        "libbase"
        "libbinder"
        "liblogwrap"
        "libnetdbpf"
        "libnetutils"
        "libnetdutils"
        "libpcap"
        "libqtaguid"
        "libssl"
        "netd_aidl_interface-V2-cpp"
        "netd_event_listener_interface-V1-cpp"
    ];
    header_libs = [
        "libnetd_resolv_headers"
    ];
    aidl = {
        export_aidl_headers = true;
        local_include_dirs = ["binder"];
    };
};

netd = cc_binary {
    name = "netd";
    defaults = ["netd_defaults"];
    include_dirs = [
        "external/mdnsresponder/mDNSShared"
        "system/netd/include"
    ];
    init_rc = ["netd.rc"];
    shared_libs = [
        "android.system.net.netd@1.0"
        "android.system.net.netd@1.1"
        "libbase"
        "libbinder"
        "libbpf_android"
        "libcutils"
        "libdl"
        "libhidlbase"
        "libhidltransport"
        "libjsoncpp"
        "liblog"
        "liblogwrap"
        "libmdnssd"
        "libnetdbpf"
        "libnetdutils"
        "libnetutils"
        "libpcap"
        "libprocessgroup"
        "libqtaguid"
        "libselinux"
        "libsysutils"
        "libutils"
        "netd_aidl_interface-V2-cpp"
        "netd_event_listener_interface-V1-cpp"
        "oemnetd_aidl_interface-cpp"
    ];
    static_libs = [
        "libnetd_server"
    ];
    header_libs = [
        "libnetd_resolv_headers"
    ];
    srcs = [
        "DummyNetwork.cpp"
        "EventReporter.cpp"
        "FwmarkServer.cpp"
        "LocalNetwork.cpp"
        "MDnsSdListener.cpp"
        "NetdCommand.cpp"
        "NetdHwService.cpp"
        "NetdNativeService.cpp"
        "NetlinkHandler.cpp"
        "Network.cpp"
        "NetworkController.cpp"
        "OemNetdListener.cpp"
        "PhysicalNetwork.cpp"
        "PppController.cpp"
        "Process.cpp"
        "ResolvStub.cpp"
        "VirtualNetwork.cpp"
        "main.cpp"
        "oem_iptables_hook.cpp"
    ];
};

ndc = cc_binary {
    name = "ndc";
    defaults = ["netd_defaults"];
    include_dirs = [
        "system/netd/include"
    ];
    header_libs = [
        "libnetd_client_headers"
    ];
    shared_libs = [
        "libbase"
        "libnetdutils"
        "libnetutils"
        "libcutils"
        "liblog"
        "libutils"
        "libbinder"
        "dnsresolver_aidl_interface-V2-cpp"
        "netd_aidl_interface-V2-cpp"
    ];
    srcs = [
        "ndc.cpp"
        "UidRanges.cpp"
        "NdcDispatcher.cpp"
    ];
};

netd_unit_test = cc_test {
    name = "netd_unit_test";
    defaults = ["netd_defaults"];
    test_suites = ["device-tests"];
    require_root = true;
    include_dirs = [
        "system/netd/include"
        "system/netd/server/binder"
        "system/netd/tests"
        "system/core/logwrapper/include"
    ];
    srcs = [
        "BandwidthControllerTest.cpp"
        "ClatdControllerTest.cpp"
        "ClatUtilsTest.cpp"
        "ControllersTest.cpp"
        "FirewallControllerTest.cpp"
        "IdletimerControllerTest.cpp"
        "InterfaceControllerTest.cpp"
        "IptablesBaseTest.cpp"
        "IptablesRestoreControllerTest.cpp"
        "NFLogListenerTest.cpp"
        "RouteControllerTest.cpp"
        "SockDiagTest.cpp"
        "StrictControllerTest.cpp"
        "TetherControllerTest.cpp"
        "TrafficControllerTest.cpp"
        "XfrmControllerTest.cpp"
        "WakeupControllerTest.cpp"
    ];
    static_libs = [
        "libgmock"
        "libnetd_server"
        "libnetd_test_tun_interface"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libbpf_android"
        "libcrypto"
        "libcutils"
        "liblog"
        "libnetdbpf"
        "libnetdutils"
        "libnetutils"
        "libqtaguid"
        "libsysutils"
        "libutils"
        "netd_aidl_interface-V2-cpp"
        "netd_event_listener_interface-V1-cpp"
    ];
};

in { inherit libnetd_server ndc netd netd_aidl_interface netd_event_listener_interface netd_integration_test_shared netd_unit_test oemnetd_aidl_interface; }
