{ android_app, android_library, cc_library_shared, genrule, java_defaults, java_library }:
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

captiveportal-lib = java_library {
    name = "captiveportal-lib";
    srcs = [
        "common/CaptivePortalProbeResult.java"
        "common/CaptivePortalProbeSpec.java"
    ];
    libs = [
        "androidx.annotation_annotation"
    ];
    sdk_version = "system_current";
};

NetworkStackCommon = java_defaults {
    name = "NetworkStackCommon";
    sdk_version = "system_current";
    min_sdk_version = "28";
};

#  Library including the network stack, used to compile both variants of the network stack
NetworkStackBase = android_library {
    name = "NetworkStackBase";
    defaults = ["NetworkStackCommon"];
    srcs = [
        "src/android/net/NetworkStackIpMemoryStore.java"
        "src/android/net/apf/ApfFilter.java"
        "src/android/net/apf/ApfGenerator.java"
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
        "src/android/net/dhcp/DhcpServer.java"
        "src/android/net/dhcp/DhcpServingParams.java"
        "src/android/net/ip/ConnectivityPacketTracker.java"
        "src/android/net/ip/IpClient.java"
        "src/android/net/ip/IpClientLinkObserver.java"
        "src/android/net/ip/IpNeighborMonitor.java"
        "src/android/net/ip/IpReachabilityMonitor.java"
        "src/android/net/util/ConnectivityPacketSummary.java"
        "src/android/net/util/DataStallUtils.java"
        "src/android/net/util/FdEventsReader.java"
        "src/android/net/util/NetworkStackUtils.java"
        "src/android/net/util/PacketReader.java"
        "src/android/net/util/SharedLog.java"
        "src/android/net/util/Stopwatch.java"
        "src/com/android/networkstack/metrics/DataStallDetectionStats.java"
        "src/com/android/networkstack/metrics/DataStallStatsUtils.java"
        "src/com/android/networkstack/util/DnsUtils.java"
        "src/com/android/server/NetworkObserver.java"
        "src/com/android/server/NetworkObserverRegistry.java"
        "src/com/android/server/NetworkStackService.java"
        "src/com/android/server/connectivity/NetworkMonitor.java"
        "src/com/android/server/connectivity/ipmemorystore/IpMemoryStoreDatabase.java"
        "src/com/android/server/connectivity/ipmemorystore/IpMemoryStoreService.java"
        "src/com/android/server/connectivity/ipmemorystore/RegularMaintenanceJobService.java"
        "src/com/android/server/connectivity/ipmemorystore/RelevanceUtils.java"
        "src/com/android/server/connectivity/ipmemorystore/Utils.java"
        "src/com/android/server/util/NetworkStackConstants.java"
        "src/com/android/server/util/PermissionUtil.java"
        ":framework-networkstack-shared-srcs"
        ":services-networkstack-shared-srcs"
        ":statslog-networkstack-java-gen"
    ];
    static_libs = [
        "androidx.annotation_annotation"
        "ipmemorystore-client"
        "netd_aidl_interface-V2-java"
        "networkstack-aidl-interfaces-V3-java"
        "datastallprotosnano"
        "networkstackprotosnano"
        "captiveportal-lib"
    ];
    manifest = "AndroidManifestBase.xml";
    plugins = ["java_api_finder"];
};

libnetworkstackutilsjni = cc_library_shared {
    name = "libnetworkstackutilsjni";
    srcs = [
        "jni/network_stack_utils_jni.cpp"
    ];
    sdk_version = "current";
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

NetworkStackAppCommon = java_defaults {
    name = "NetworkStackAppCommon";
    defaults = ["NetworkStackCommon"];
    privileged = true;
    static_libs = [
        "NetworkStackBase"
    ];
    jni_libs = [
        "libnativehelper_compat_libc++"
        "libnetworkstackutilsjni"
    ];
    #  Resources already included in NetworkStackBase
    resource_dirs = [];
    jarjar_rules = "jarjar-rules-shared.txt";
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

#  Non-updatable network stack running in the system server process for devices not using the module
InProcessNetworkStack = android_app {
    name = "InProcessNetworkStack";
    defaults = ["NetworkStackAppCommon"];
    certificate = "platform";
    manifest = "AndroidManifest_InProcess.xml";
    #  InProcessNetworkStack is a replacement for NetworkStack
    overrides = ["NetworkStack"];
    #  The permission configuration *must* be included to ensure security of the device
    #  The InProcessNetworkStack goes together with the PlatformCaptivePortalLogin, which replaces
    #  the default CaptivePortalLogin.
    required = [
        "PlatformNetworkPermissionConfig"
        "PlatformCaptivePortalLogin"
    ];
};

#  Updatable network stack packaged as an application
NetworkStack = android_app {
    name = "NetworkStack";
    defaults = ["NetworkStackAppCommon"];
    certificate = "networkstack";
    manifest = "AndroidManifest.xml";
    use_embedded_native_libs = true;
    #  The permission configuration *must* be included to ensure security of the device
    required = ["NetworkPermissionConfig"];
};

statslog-networkstack-java-gen = genrule {
    name = "statslog-networkstack-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module network_stack" +
        " --javaPackage com.android.networkstack.metrics --javaClass NetworkStackStatsLog";
    out = ["com/android/networkstack/metrics/NetworkStackStatsLog.java"];
};

in { inherit InProcessNetworkStack NetworkStack NetworkStackAppCommon NetworkStackBase NetworkStackCommon captiveportal-lib libnetworkstackutilsjni statslog-networkstack-java-gen; }
