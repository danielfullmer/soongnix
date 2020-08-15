{ android_test, cc_library_shared }:
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

NetworkStackTests = android_test {
    name = "NetworkStackTests";
    certificate = "platform";
    srcs = [
        "src/android/net/apf/ApfTest.java"
        "src/android/net/apf/Bpf2Apf.java"
        "src/android/net/captiveportal/CaptivePortalProbeSpecTest.java"
        "src/android/net/dhcp/DhcpLeaseRepositoryTest.java"
        "src/android/net/dhcp/DhcpPacketTest.java"
        "src/android/net/dhcp/DhcpServerTest.java"
        "src/android/net/dhcp/DhcpServingParamsTest.java"
        "src/android/net/ip/IpClientTest.java"
        "src/android/net/ip/IpReachabilityMonitorTest.java"
        "src/android/net/util/ConnectivityPacketSummaryTest.java"
        "src/android/net/util/PacketReaderTest.java"
        "src/com/android/server/connectivity/NetworkMonitorTest.java"
        "src/com/android/server/connectivity/ipmemorystore/IpMemoryStoreServiceTest.java"
        "src/com/android/server/connectivity/ipmemorystore/RelevanceUtilsTests.java"
        "src/com/android/server/util/SharedLogTest.java"
    ];
    test_suites = ["device-tests"];
    resource_dirs = ["res"];
    static_libs = [
        "androidx.test.rules"
        "mockito-target-extended-minus-junit4"
        "NetworkStackBase"
        "testables"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
        #  For ApfTest
        "libartbase"
        "libbacktrace"
        "libbase"
        "libbinder"
        "libbinderthreadstate"
        "libc++"
        "libcgrouprc"
        "libcrypto"
        "libcutils"
        "libdexfile"
        "ld-android"
        "libdl_android"
        "libhidl-gen-utils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libjsoncpp"
        "liblog"
        "liblzma"
        "libnativehelper"
        "libnativehelper_compat_libc++"
        "libnetworkstacktestsjni"
        "libnetworkstackutilsjni"
        "libpackagelistparser"
        "libpcre2"
        "libprocessgroup"
        "libselinux"
        "libui"
        "libutils"
        "libvintf"
        "libvndksupport"
        "libtinyxml2"
        "libunwindstack"
        "libutilscallstack"
        "libziparchive"
        "libz"
        "netd_aidl_interface-V2-cpp"
    ];
};

libnetworkstacktestsjni = cc_library_shared {
    name = "libnetworkstacktestsjni";
    srcs = [
        "jni/apf_jni.cpp"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    include_dirs = [
        "hardware/google/apf"
    ];
    shared_libs = [
        "libbinder"
        "liblog"
        "libcutils"
        "libnativehelper"
        "netd_aidl_interface-V2-cpp"
    ];
    static_libs = [
        "libapf"
        "libpcap"
    ];
};

in { inherit NetworkStackTests libnetworkstacktestsjni; }
