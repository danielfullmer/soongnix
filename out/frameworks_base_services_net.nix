{ filegroup, java_library, java_library_static }:
let

"services.net-sources" = filegroup {
    name = "services.net-sources";
    srcs = [
        "java/android/net/ConnectivityModuleConnector.java"
        "java/android/net/IpMemoryStore.java"
        "java/android/net/NetworkMonitorManager.java"
        "java/android/net/NetworkStackClient.java"
        "java/android/net/TcpKeepalivePacketData.java"
        "java/android/net/ip/IpClientCallbacks.java"
        "java/android/net/ip/IpClientManager.java"
        "java/android/net/ip/IpClientUtil.java"
        "java/android/net/util/DhcpResultsCompatUtil.java"
        "java/android/net/util/KeepalivePacketDataUtil.java"
        "java/android/net/util/NetdService.java"
        "java/android/net/util/NetworkConstants.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.net" = java_library_static {
    name = "services.net";
    defaults = ["services_defaults"];
    srcs = [
        ":net-module-utils-srcs"
        ":services.net-sources"
    ];
    static_libs = [
        "netd_aidl_interfaces-platform-java"
        "netlink-client"
        "networkstack-client"
        "net-utils-services-common"
    ];
};

#  Version of services.net for usage by the wifi mainline module.
#  Note: This is compiled against module_current.
#  TODO(b/145825329): This should be moved to networkstack-client,
#  with dependencies moved to frameworks/libs/net right.
"services.net-module-wifi" = java_library {
    name = "services.net-module-wifi";
    srcs = [
        ":framework-services-net-module-wifi-shared-srcs"
        ":net-module-utils-srcs"
        "java/android/net/ip/IpClientCallbacks.java"
        "java/android/net/ip/IpClientManager.java"
        "java/android/net/ip/IpClientUtil.java"
        "java/android/net/util/KeepalivePacketDataUtil.java"
        "java/android/net/util/NetworkConstants.java"
        "java/android/net/IpMemoryStore.java"
        "java/android/net/NetworkMonitorManager.java"
        "java/android/net/TcpKeepalivePacketData.java"
    ];
    sdk_version = "module_current";
    libs = [
        "unsupportedappusage"
        "framework-wifi-util-lib"
    ];
    static_libs = [
        #  All the classes in netd_aidl_interface must be jarjar so they do not conflict with the
        #  classes generated by netd_aidl_interfaces-platform-java above.
        "netd_aidl_interface-V3-java"
        "netlink-client"
        "networkstack-client"
        "net-utils-services-common"
    ];
    apex_available = [
        "com.android.wifi"
    ];
    visibility = [
        "//frameworks/opt/net/wifi/service"
        "//frameworks/opt/net/wifi/tests/wifitests"
    ];
};

services-tethering-shared-srcs = filegroup {
    name = "services-tethering-shared-srcs";
    srcs = [
        ":framework-annotations"
        "java/android/net/util/NetworkConstants.java"
    ];
    visibility = ["//frameworks/base/packages/Tethering"];
};

in { inherit "services.net" "services.net-module-wifi" "services.net-sources" services-tethering-shared-srcs; }
