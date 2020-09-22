{ android_library, android_test, java_defaults, java_library }:
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

#  Tests in this folder are included both in unit tests and CTS.
TetheringCommonTests = java_library {
    name = "TetheringCommonTests";
    srcs = [

        "common/android/net/TetheredClientTest.kt"
    ];
    static_libs = [
        "androidx.test.rules"
        "net-tests-utils"
    ];
    #  TODO(b/147200698) change sdk_version to module-current and remove framework-minus-apex
    sdk_version = "core_platform";
    libs = [
        "framework-minus-apex"
        "framework-tethering.impl"
    ];
    visibility = ["//cts/tests/tests/tethering"];
};

TetheringTestsDefaults = java_defaults {
    name = "TetheringTestsDefaults";
    srcs = [
        "src/android/net/dhcp/DhcpServingParamsParcelExtTest.java"
        "src/android/net/ip/IpServerTest.java"
        "src/android/net/util/InterfaceSetTest.java"
        "src/android/net/util/TetheringUtilsTest.java"
        "src/android/net/util/VersionedBroadcastListenerTest.java"
        "src/com/android/networkstack/tethering/BpfCoordinatorTest.java"
        "src/com/android/networkstack/tethering/EntitlementManagerTest.java"
        "src/com/android/networkstack/tethering/IPv6TetheringCoordinatorTest.java"
        "src/com/android/networkstack/tethering/MockTetheringService.java"
        "src/com/android/networkstack/tethering/OffloadControllerTest.java"
        "src/com/android/networkstack/tethering/OffloadHardwareInterfaceTest.java"
        "src/com/android/networkstack/tethering/PrivateAddressCoordinatorTest.java"
        "src/com/android/networkstack/tethering/TetheringConfigurationTest.java"
        "src/com/android/networkstack/tethering/TetheringServiceTest.java"
        "src/com/android/networkstack/tethering/TetheringTest.java"
        "src/com/android/networkstack/tethering/UpstreamNetworkMonitorTest.java"
        "src/com/android/networkstack/tethering/ConnectedClientsTrackerTest.kt"
        "src/com/android/networkstack/tethering/TetheringNotificationUpdaterTest.kt"
    ];
    static_libs = [
        "TetheringApiCurrentLib"
        "TetheringCommonTests"
        "androidx.test.rules"
        "frameworks-base-testutils"
        "mockito-target-extended-minus-junit4"
        "net-tests-utils"
        "testables"
    ];
    #  TODO(b/147200698) change sdk_version to module-current and
    #  remove framework-minus-apex, ext, and framework-res
    sdk_version = "core_platform";
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
        "ext"
        "framework-minus-apex"
        "framework-res"
        "framework-tethering.impl"
        "framework-wifi.stubs.module_lib"
    ];
    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];
    jarjar_rules = "jarjar-rules.txt";
};

#  Library containing the unit tests. This is used by the coverage test target to pull in the
#  unit test code. It is not currently used by the tests themselves because all the build
#  configuration needed by the tests is in the TetheringTestsDefaults rule.
TetheringTestsLib = android_library {
    name = "TetheringTestsLib";
    defaults = ["TetheringTestsDefaults"];
    visibility = [
        "//frameworks/base/packages/Tethering/tests/integration"
    ];
};

TetheringTests = android_test {
    name = "TetheringTests";
    platform_apis = true;
    test_suites = [
        "device-tests"
        "mts"
    ];
    defaults = ["TetheringTestsDefaults"];
    compile_multilib = "both";
};

in { inherit TetheringCommonTests TetheringTests TetheringTestsDefaults TetheringTestsLib; }
