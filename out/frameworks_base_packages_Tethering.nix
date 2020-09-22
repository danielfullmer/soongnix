{ android_app, android_library, cc_library, java_defaults }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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

TetheringAndroidLibraryDefaults = java_defaults {
    name = "TetheringAndroidLibraryDefaults";
    sdk_version = "module_current";
    srcs = [
        "src/android/net/dhcp/DhcpServerCallbacks.java"
        "src/android/net/dhcp/DhcpServingParamsParcelExt.java"
        "src/android/net/ip/IpServer.java"
        "src/android/net/ip/RouterAdvertisementDaemon.java"
        "src/android/net/util/BaseNetdUnsolicitedEventListener.java"
        "src/android/net/util/InterfaceSet.java"
        "src/android/net/util/PrefixUtils.java"
        "src/android/net/util/TetheringMessageBase.java"
        "src/android/net/util/TetheringUtils.java"
        "src/android/net/util/VersionedBroadcastListener.java"
        "src/com/android/networkstack/tethering/BpfCoordinator.java"
        "src/com/android/networkstack/tethering/ConnectedClientsTracker.java"
        "src/com/android/networkstack/tethering/EntitlementManager.java"
        "src/com/android/networkstack/tethering/IPv6TetheringCoordinator.java"
        "src/com/android/networkstack/tethering/OffloadController.java"
        "src/com/android/networkstack/tethering/OffloadHardwareInterface.java"
        "src/com/android/networkstack/tethering/PrivateAddressCoordinator.java"
        "src/com/android/networkstack/tethering/Tethering.java"
        "src/com/android/networkstack/tethering/TetheringConfiguration.java"
        "src/com/android/networkstack/tethering/TetheringDependencies.java"
        "src/com/android/networkstack/tethering/TetheringInterfaceUtils.java"
        "src/com/android/networkstack/tethering/TetheringNotificationUpdater.java"
        "src/com/android/networkstack/tethering/TetheringService.java"
        "src/com/android/networkstack/tethering/UpstreamNetworkMonitor.java"
        "src/com/android/networkstack/tethering/UpstreamNetworkState.java"
        ":framework-tethering-shared-srcs"
        ":tethering-module-utils-srcs"
        ":services-tethering-shared-srcs"
    ];
    static_libs = [
        "androidx.annotation_annotation"
        "netd_aidl_interface-java"
        "netlink-client"
        "networkstack-aidl-interfaces-java"
        "android.hardware.tetheroffload.config-V1.0-java"
        "android.hardware.tetheroffload.control-V1.0-java"
        "net-utils-framework-common"
    ];
    libs = [
        "framework-statsd.stubs.module_lib"
        "framework-tethering.impl"
        "framework-wifi"
        "unsupportedappusage"
    ];
    plugins = ["java_api_finder"];
    manifest = "AndroidManifestBase.xml";
};

#  Build tethering static library, used to compile both variants of the tethering.
TetheringApiCurrentLib = android_library {
    name = "TetheringApiCurrentLib";
    defaults = ["TetheringAndroidLibraryDefaults"];
};

#  Due to b/143733063, APK can't access a jni lib that is in APEX (but not in the APK).
libtetherutilsjni = cc_library {
    name = "libtetherutilsjni";
    sdk_version = "current";
    apex_available = [
        "//apex_available:platform" #  Used by InProcessTethering
        "com.android.tethering"
    ];
    min_sdk_version = "current";
    srcs = [
        "jni/android_net_util_TetheringUtils.cpp"
    ];
    shared_libs = [
        "liblog"
        "libnativehelper_compat_libc++"
    ];

    #  We cannot use plain "libc++" here to link libc++ dynamically because it results in:
    #    java.lang.UnsatisfiedLinkError: dlopen failed: library "libc++_shared.so" not found
    #  even if "libc++" is added into jni_libs below. Adding "libc++_shared" into jni_libs doesn't
    #  build because soong complains of:
    #    module Tethering missing dependencies: libc++_shared
    #
    #  So, link libc++ statically. This means that we also need to ensure that all the C++ libraries
    #  we depend on do not dynamically link libc++. This is currently the case, because liblog is
    #  C-only and libnativehelper_compat_libc also uses stl: "c++_static".
    stl = "c++_static";

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wthread-safety"
    ];

    ldflags = ["-Wl,--exclude-libs=ALL,-error-limit=0"];
};

#  Common defaults for compiling the actual APK.
TetheringAppDefaults = java_defaults {
    name = "TetheringAppDefaults";
    sdk_version = "module_current";
    privileged = true;
    jni_libs = [
        "libtetherutilsjni"
    ];
    resource_dirs = [
        "res"
    ];
    libs = [
        "framework-tethering"
    ];
    jarjar_rules = "jarjar-rules.txt";
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

#  Non-updatable tethering running in the system server process for devices not using the module
InProcessTethering = android_app {
    name = "InProcessTethering";
    defaults = ["TetheringAppDefaults"];
    static_libs = ["TetheringApiCurrentLib"];
    certificate = "platform";
    manifest = "AndroidManifest_InProcess.xml";
    #  InProcessTethering is a replacement for Tethering
    overrides = ["Tethering"];
    apex_available = ["com.android.tethering"];
    min_sdk_version = "current";
};

#  Updatable tethering packaged as an application
Tethering = android_app {
    name = "Tethering";
    defaults = ["TetheringAppDefaults"];
    static_libs = ["TetheringApiCurrentLib"];
    certificate = "networkstack";
    manifest = "AndroidManifest.xml";
    use_embedded_native_libs = true;
    #  The permission configuration *must* be included to ensure security of the device
    required = ["NetworkPermissionConfig"];
    apex_available = ["com.android.tethering"];
    min_sdk_version = "current";
};

in { inherit InProcessTethering Tethering TetheringAndroidLibraryDefaults TetheringApiCurrentLib TetheringAppDefaults libtetherutilsjni; }
