{ android_app, android_library, cc_library_shared, filegroup, genrule, java_defaults, java_library, java_library_static }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

#  The network stack can be compiled using system_current (non-finalized) SDK, or finalized system_X
#  SDK. There is also a variant that uses system_current SDK and runs in the system process
#  (InProcessNetworkStack). The following structure is used to create the build rules:
#
#                           NetworkStackAndroidLibraryDefaults <-- common defaults for android libs
#                                             /    \
#            +NetworkStackApiStableShims --> /      \ <-- +NetworkStackApiCurrentShims
#            +NetworkStackReleaseApiLevel   /        \    +NetworkStackDevApiLevel
#            +jarjar apistub.api[latest].* /          \   +module src/
#             to apistub.*                /            \
#                                        /              \
#          NetworkStackApiStableDependencies             \
#                                      /                  \               android libs w/ all code
#                    +module src/ --> /                    \              (also used in unit tests)
#                                    /                      \                        |
#                NetworkStackApiStableLib               NetworkStackApiCurrentLib <--*
#                           |                                     |
#                           | <--   +NetworkStackAppDefaults  --> |
#                           |          (APK build params)         |
#                           |                                     |
#                           | <-- +NetworkStackReleaseApiLevel    | <-- +NetworkStackDevApiLevel
#                           |                                     |
#                           |                                     |
#                 NetworkStackApiStable          NetworkStack, InProcessNetworkStack, <-- APKs
#                                                          TestNetworkStack

#  Common defaults to define SDK level
NetworkStackDevApiLevel = java_defaults {
    name = "NetworkStackDevApiLevel";
    sdk_version = "system_current";
};

NetworkStackReleaseApiLevel = java_defaults {
    name = "NetworkStackReleaseApiLevel";
    sdk_version = "system_30";
    min_sdk_version = "29";
    target_sdk_version = "30";
};

#  Filegroups for the API shims
NetworkStackApiCurrentShims = filegroup {
    name = "NetworkStackApiCurrentShims";
    srcs = [
        "apishim/common/com/android/networkstack/apishim/common/CaptivePortalDataShim.java"
        "apishim/common/com/android/networkstack/apishim/common/NetworkInformationShim.java"
        "apishim/common/com/android/networkstack/apishim/common/NetworkShim.java"
        "apishim/common/com/android/networkstack/apishim/common/ShimUtils.java"
        "apishim/common/com/android/networkstack/apishim/common/SocketUtilsShim.java"
        "apishim/common/com/android/networkstack/apishim/common/UnsupportedApiLevelException.java"
        "apishim/29/com/android/networkstack/apishim/api29/CaptivePortalDataShimImpl.java"
        "apishim/29/com/android/networkstack/apishim/api29/ConstantsShim.java"
        "apishim/29/com/android/networkstack/apishim/api29/NetworkInformationShimImpl.java"
        "apishim/29/com/android/networkstack/apishim/api29/NetworkShimImpl.java"
        "apishim/29/com/android/networkstack/apishim/api29/SocketUtilsShimImpl.java"
        "apishim/30/com/android/networkstack/apishim/api30/CaptivePortalDataShimImpl.java"
        "apishim/30/com/android/networkstack/apishim/api30/ConstantsShim.java"
        "apishim/30/com/android/networkstack/apishim/api30/NetworkInformationShimImpl.java"
        "apishim/30/com/android/networkstack/apishim/api30/NetworkShimImpl.java"
        "apishim/30/com/android/networkstack/apishim/api30/SocketUtilsShimImpl.java"
        "apishim/31/com/android/networkstack/apishim/CaptivePortalDataShimImpl.java"
        "apishim/31/com/android/networkstack/apishim/ConstantsShim.java"
        "apishim/31/com/android/networkstack/apishim/NetworkInformationShimImpl.java"
        "apishim/31/com/android/networkstack/apishim/NetworkShimImpl.java"
        "apishim/31/com/android/networkstack/apishim/SocketUtilsShimImpl.java"
        ":networkstack-module-utils-srcs"
    ];
};

#  API stable shims only include the compat package, but it is jarjared to replace the non-compat
#  package
NetworkStackApiStableShims = filegroup {
    name = "NetworkStackApiStableShims";
    srcs = [
        "apishim/common/com/android/networkstack/apishim/common/CaptivePortalDataShim.java"
        "apishim/common/com/android/networkstack/apishim/common/NetworkInformationShim.java"
        "apishim/common/com/android/networkstack/apishim/common/NetworkShim.java"
        "apishim/common/com/android/networkstack/apishim/common/ShimUtils.java"
        "apishim/common/com/android/networkstack/apishim/common/SocketUtilsShim.java"
        "apishim/common/com/android/networkstack/apishim/common/UnsupportedApiLevelException.java"
        "apishim/29/com/android/networkstack/apishim/api29/CaptivePortalDataShimImpl.java"
        "apishim/29/com/android/networkstack/apishim/api29/ConstantsShim.java"
        "apishim/29/com/android/networkstack/apishim/api29/NetworkInformationShimImpl.java"
        "apishim/29/com/android/networkstack/apishim/api29/NetworkShimImpl.java"
        "apishim/29/com/android/networkstack/apishim/api29/SocketUtilsShimImpl.java"
        "apishim/30/com/android/networkstack/apishim/api30/CaptivePortalDataShimImpl.java"
        "apishim/30/com/android/networkstack/apishim/api30/ConstantsShim.java"
        "apishim/30/com/android/networkstack/apishim/api30/NetworkInformationShimImpl.java"
        "apishim/30/com/android/networkstack/apishim/api30/NetworkShimImpl.java"
        "apishim/30/com/android/networkstack/apishim/api30/SocketUtilsShimImpl.java"
        ":networkstack-module-utils-srcs"
    ];
};

#  Common defaults for android libraries containing network stack code, used to compile variants of
#  the network stack in the system process and in the network_stack process
NetworkStackAndroidLibraryDefaults = java_defaults {
    name = "NetworkStackAndroidLibraryDefaults";
    srcs = [
        ":framework-networkstack-shared-srcs"
    ];
    libs = ["unsupportedappusage"];
    static_libs = [
        "androidx.annotation_annotation"
        "netd_aidl_interface-java"
        "netlink-client"
        "networkstack-client"
        "net-utils-framework-common"
        #  See note on statsprotos when adding/updating proto build rules
        "datastallprotosnano"
        "statsprotos"
        "captiveportal-lib"
    ];
    plugins = ["java_api_finder"];
};

#  The versions of the android library containing network stack code compiled for each SDK variant
#  API current uses the sources of the API current shims directly.
#  This allows API current code to be treated identically to code in src/ (it will be moved
#  there eventually), and to use the compat shim as fallback on older devices.
NetworkStackApiCurrentLib = android_library {
    name = "NetworkStackApiCurrentLib";
    defaults = [
        "NetworkStackDevApiLevel"
        "NetworkStackAndroidLibraryDefaults"
    ];
    srcs = [
        ":NetworkStackApiCurrentShims"
        "src/android/net/NetworkStackIpMemoryStore.java"
        "src/android/net/apf/ApfFilter.java"
        "src/android/net/apf/ApfGenerator.java"
        "src/android/net/captiveportal/CapportApiProbeResult.java"
        "src/android/net/dhcp/DhcpAckPacket.java"
        "src/android/net/dhcp/DhcpClient.java"
        "src/android/net/dhcp/DhcpDeclinePacket.java"
        "src/android/net/dhcp/DhcpDiscoverPacket.java"
        "src/android/net/dhcp/DhcpInformPacket.java"
        "src/android/net/dhcp/DhcpLease.java"
        "src/android/net/dhcp/DhcpLeaseRepository.java"
        "src/android/net/dhcp/DhcpNakPacket.java"
        "src/android/net/dhcp/DhcpOfferPacket.java"
        "src/android/net/dhcp/DhcpPacket.java"
        "src/android/net/dhcp/DhcpPacketListener.java"
        "src/android/net/dhcp/DhcpReleasePacket.java"
        "src/android/net/dhcp/DhcpRequestPacket.java"
        "src/android/net/dhcp/DhcpResultsParcelableUtil.java"
        "src/android/net/dhcp/DhcpServer.java"
        "src/android/net/dhcp/DhcpServingParams.java"
        "src/android/net/ip/ConnectivityPacketTracker.java"
        "src/android/net/ip/IpClient.java"
        "src/android/net/ip/IpClientLinkObserver.java"
        "src/android/net/ip/IpReachabilityMonitor.java"
        "src/android/net/util/ConnectivityPacketSummary.java"
        "src/android/net/util/DataStallUtils.java"
        "src/android/net/util/HostnameTransliterator.java"
        "src/android/net/util/NetworkStackUtils.java"
        "src/android/net/util/Stopwatch.java"
        "src/com/android/networkstack/NetworkStackNotifier.java"
        "src/com/android/networkstack/arp/ArpPacket.java"
        "src/com/android/networkstack/metrics/DataStallDetectionStats.java"
        "src/com/android/networkstack/metrics/DataStallStatsUtils.java"
        "src/com/android/networkstack/metrics/IpProvisioningMetrics.java"
        "src/com/android/networkstack/metrics/NetworkValidationMetrics.java"
        "src/com/android/networkstack/netlink/TcpInfo.java"
        "src/com/android/networkstack/netlink/TcpSocketTracker.java"
        "src/com/android/networkstack/util/DnsUtils.java"
        "src/com/android/server/NetworkObserver.java"
        "src/com/android/server/NetworkObserverRegistry.java"
        "src/com/android/server/NetworkStackService.java"
        "src/com/android/server/connectivity/NetworkMonitor.java"
        "src/com/android/server/connectivity/ipmemorystore/IpMemoryStoreDatabase.java"
        "src/com/android/server/connectivity/ipmemorystore/IpMemoryStoreService.java"
        "src/com/android/server/connectivity/ipmemorystore/RegularMaintenanceJobService.java"
        "src/com/android/server/connectivity/ipmemorystore/RelevanceUtils.java"
        "src/com/android/server/connectivity/ipmemorystore/StatusAndCount.java"
        "src/com/android/server/connectivity/ipmemorystore/Utils.java"
        "src/com/android/server/util/NetworkStackConstants.java"
        "src/com/android/server/util/PermissionUtil.java"
        ":statslog-networkstack-java-gen"
    ];
    manifest = "AndroidManifestBase.xml";
};

#  For API stable, first build the dependencies using jarjar compat rules, then build the sources
#  linking with the dependencies.
NetworkStackApiStableDependencies = java_library {
    name = "NetworkStackApiStableDependencies";
    defaults = [
        "NetworkStackReleaseApiLevel"
        "NetworkStackAndroidLibraryDefaults"
    ];
    srcs = [":NetworkStackApiStableShims"];
    jarjar_rules = "apishim/jarjar-rules-compat.txt";
};

NetworkStackApiStableLib = android_library {
    name = "NetworkStackApiStableLib";
    defaults = ["NetworkStackReleaseApiLevel"];
    srcs = [
        "src/android/net/NetworkStackIpMemoryStore.java"
        "src/android/net/apf/ApfFilter.java"
        "src/android/net/apf/ApfGenerator.java"
        "src/android/net/captiveportal/CapportApiProbeResult.java"
        "src/android/net/dhcp/DhcpAckPacket.java"
        "src/android/net/dhcp/DhcpClient.java"
        "src/android/net/dhcp/DhcpDeclinePacket.java"
        "src/android/net/dhcp/DhcpDiscoverPacket.java"
        "src/android/net/dhcp/DhcpInformPacket.java"
        "src/android/net/dhcp/DhcpLease.java"
        "src/android/net/dhcp/DhcpLeaseRepository.java"
        "src/android/net/dhcp/DhcpNakPacket.java"
        "src/android/net/dhcp/DhcpOfferPacket.java"
        "src/android/net/dhcp/DhcpPacket.java"
        "src/android/net/dhcp/DhcpPacketListener.java"
        "src/android/net/dhcp/DhcpReleasePacket.java"
        "src/android/net/dhcp/DhcpRequestPacket.java"
        "src/android/net/dhcp/DhcpResultsParcelableUtil.java"
        "src/android/net/dhcp/DhcpServer.java"
        "src/android/net/dhcp/DhcpServingParams.java"
        "src/android/net/ip/ConnectivityPacketTracker.java"
        "src/android/net/ip/IpClient.java"
        "src/android/net/ip/IpClientLinkObserver.java"
        "src/android/net/ip/IpReachabilityMonitor.java"
        "src/android/net/util/ConnectivityPacketSummary.java"
        "src/android/net/util/DataStallUtils.java"
        "src/android/net/util/HostnameTransliterator.java"
        "src/android/net/util/NetworkStackUtils.java"
        "src/android/net/util/Stopwatch.java"
        "src/com/android/networkstack/NetworkStackNotifier.java"
        "src/com/android/networkstack/arp/ArpPacket.java"
        "src/com/android/networkstack/metrics/DataStallDetectionStats.java"
        "src/com/android/networkstack/metrics/DataStallStatsUtils.java"
        "src/com/android/networkstack/metrics/IpProvisioningMetrics.java"
        "src/com/android/networkstack/metrics/NetworkValidationMetrics.java"
        "src/com/android/networkstack/netlink/TcpInfo.java"
        "src/com/android/networkstack/netlink/TcpSocketTracker.java"
        "src/com/android/networkstack/util/DnsUtils.java"
        "src/com/android/server/NetworkObserver.java"
        "src/com/android/server/NetworkObserverRegistry.java"
        "src/com/android/server/NetworkStackService.java"
        "src/com/android/server/connectivity/NetworkMonitor.java"
        "src/com/android/server/connectivity/ipmemorystore/IpMemoryStoreDatabase.java"
        "src/com/android/server/connectivity/ipmemorystore/IpMemoryStoreService.java"
        "src/com/android/server/connectivity/ipmemorystore/RegularMaintenanceJobService.java"
        "src/com/android/server/connectivity/ipmemorystore/RelevanceUtils.java"
        "src/com/android/server/connectivity/ipmemorystore/StatusAndCount.java"
        "src/com/android/server/connectivity/ipmemorystore/Utils.java"
        "src/com/android/server/util/NetworkStackConstants.java"
        "src/com/android/server/util/PermissionUtil.java"
        ":statslog-networkstack-java-gen"
    ];
    #  API stable uses a jarjared version of the shims
    static_libs = [
        "NetworkStackApiStableDependencies"
    ];
    manifest = "AndroidManifestBase.xml";
};

NetworkStackJarJarRules = filegroup {
    name = "NetworkStackJarJarRules";
    srcs = ["jarjar-rules-shared.txt"];
    visibility = [
        "//packages/modules/NetworkStack/tests/unit"
        "//packages/modules/NetworkStack/tests/integration"
        "//frameworks/base/packages/Tethering/tests/integration"
    ];
};

#  Common defaults for compiling the actual APK, based on the NetworkStackApiXBase android libraries
NetworkStackAppDefaults = java_defaults {
    name = "NetworkStackAppDefaults";
    privileged = true;
    jni_libs = [
        "libnativehelper_compat_libc++"
        "libnetworkstackutilsjni"
    ];
    #  Resources already included in NetworkStackBase
    resource_dirs = [];
    jarjar_rules = ":NetworkStackJarJarRules";
    use_embedded_native_libs = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

#  Non-updatable network stack running in the system server process for devices not using the module
InProcessNetworkStack = android_app {
    name = "InProcessNetworkStack";
    defaults = [
        "NetworkStackAppDefaults"
        "NetworkStackDevApiLevel"
    ];
    static_libs = ["NetworkStackApiCurrentLib"];
    certificate = "platform";
    manifest = "AndroidManifest_InProcess.xml";
    #  InProcessNetworkStack is a replacement for NetworkStack
    overrides = [
        "NetworkStack"
        "NetworkStackNext"
    ];
    #  The permission configuration *must* be included to ensure security of the device
    #  The InProcessNetworkStack goes together with the PlatformCaptivePortalLogin, which replaces
    #  the default CaptivePortalLogin.
    required = [
        "PlatformNetworkPermissionConfig"
        "PlatformCaptivePortalLogin"
    ];
};

#  Pre-merge the AndroidManifest for NetworkStackNext, so that its manifest can be merged on top
NetworkStackNextManifestBase = android_library {
    name = "NetworkStackNextManifestBase";
    defaults = [
        "NetworkStackAppDefaults"
        "NetworkStackDevApiLevel"
    ];
    static_libs = ["NetworkStackApiCurrentLib"];
    manifest = "AndroidManifest.xml";
};

#  NetworkStack build targeting the current API release, for testing on in-development SDK
NetworkStackNext = android_app {
    name = "NetworkStackNext";
    defaults = [
        "NetworkStackAppDefaults"
        "NetworkStackDevApiLevel"
    ];
    static_libs = ["NetworkStackNextManifestBase"];
    certificate = "networkstack";
    manifest = "AndroidManifest_Next.xml";
    #  The permission configuration *must* be included to ensure security of the device
    required = ["NetworkPermissionConfig"];
};

#  Updatable network stack for finalized API
NetworkStack = android_app {
    name = "NetworkStack";
    defaults = [
        "NetworkStackAppDefaults"
        "NetworkStackReleaseApiLevel"
    ];
    static_libs = ["NetworkStackApiStableLib"];
    certificate = "networkstack";
    manifest = "AndroidManifest.xml";
    #  The permission configuration *must* be included to ensure security of the device
    required = ["NetworkPermissionConfig"];
    updatable = true;
};

#  Android library to derive test APKs for integration tests
TestNetworkStackLib = android_library {
    name = "TestNetworkStackLib";
    defaults = [
        "NetworkStackAppDefaults"
        "NetworkStackReleaseApiLevel"
    ];
    static_libs = ["NetworkStackApiStableLib"];
    manifest = "AndroidManifestBase.xml";
    visibility = [
        "//frameworks/base/tests/net/integration"
        "//cts/tests/tests/net"
    ];
};

libnetworkstackutilsjni = cc_library_shared {
    name = "libnetworkstackutilsjni";
    srcs = [
        "jni/network_stack_utils_jni.cpp"
    ];
    sdk_version = "29";
    min_sdk_version = "29";
    shared_libs = [
        "liblog"
        "libnativehelper_compat_libc++"
    ];

    #  We cannot use plain "libc++" here to link libc++ dynamically because it results in:
    #    java.lang.UnsatisfiedLinkError: dlopen failed: library "libc++_shared.so" not found
    #  even if "libc++" is added into jni_libs below. Adding "libc++_shared" into jni_libs doesn't
    #  build because soong complains of:
    #    module NetworkStack missing dependencies: libc++_shared
    #
    #  So, link libc++ statically. This means that we also need to ensure that all the C++ libraries
    #  we depend on do not dynamically link libc++. This is currently the case, because liblog is
    #  C-only and libnativehelper_compat_libc also uses stl: "c++_static".
    #
    #  TODO: find a better solution for this in R.
    stl = "c++_static";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

statslog-networkstack-java-gen = genrule {
    name = "statslog-networkstack-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module network_stack" +
        " --javaPackage com.android.networkstack.metrics --javaClass NetworkStackStatsLog" +
        " --supportQ";
    out = ["com/android/networkstack/metrics/NetworkStackStatsLog.java"];
};

version_code_networkstack_next = "300000000";
version_code_networkstack_test = "999999999";

NetworkStackTestAndroidManifest = genrule {
    name = "NetworkStackTestAndroidManifest";
    srcs = ["AndroidManifest.xml"];
    out = ["TestAndroidManifest.xml"];
    cmd = "sed -E 's/versionCode=\"[0-9]+\"/versionCode=\"" +
        version_code_networkstack_test +
        "\"/' $(in) > $(out)";
    visibility = ["//visibility:private"];
};

TestNetworkStack = android_app {
    name = "TestNetworkStack";
    defaults = [
        "NetworkStackAppDefaults"
        "NetworkStackDevApiLevel"
    ];
    static_libs = ["NetworkStackApiCurrentLib"];
    certificate = "networkstack";
    manifest = ":NetworkStackTestAndroidManifest";
    #  The permission configuration *must* be included to ensure security of the device
    required = ["NetworkPermissionConfig"];
};

#  When adding or modifying protos, the jarjar rules and possibly proguard rules need
#  to be updated: proto libraries may pull additional static libraries.
statsprotos = java_library_static {
    name = "statsprotos";
    proto = {
        type = "lite";
    };
    srcs = [
        "src/com/android/networkstack/metrics/stats.proto"
    ];
    static_libs = [
        "networkstackprotos"
    ];
    defaults = ["NetworkStackReleaseApiLevel"];
};

in { inherit InProcessNetworkStack NetworkStack NetworkStackAndroidLibraryDefaults NetworkStackApiCurrentLib NetworkStackApiCurrentShims NetworkStackApiStableDependencies NetworkStackApiStableLib NetworkStackApiStableShims NetworkStackAppDefaults NetworkStackDevApiLevel NetworkStackJarJarRules NetworkStackNext NetworkStackNextManifestBase NetworkStackReleaseApiLevel NetworkStackTestAndroidManifest TestNetworkStack TestNetworkStackLib libnetworkstackutilsjni statslog-networkstack-java-gen statsprotos; }
