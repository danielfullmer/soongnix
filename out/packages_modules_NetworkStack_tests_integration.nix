{ android_library, android_test, java_defaults }:
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

NetworkStackIntegrationTestsJniDefaults = java_defaults {
    name = "NetworkStackIntegrationTestsJniDefaults";
    defaults = ["libnetworkstackutilsjni_deps"];
    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
        #  For NetworkStackUtils included in NetworkStackBase
        "libnetworkstackutilsjni"
    ];
    jni_uses_sdk_apis = true;
    visibility = ["//visibility:private"];
};

NetworkStackIntegrationTestsDefaults = java_defaults {
    name = "NetworkStackIntegrationTestsDefaults";
    srcs = [
        "src/android/net/ip/IpClientIntegrationTest.java"
        "src/android/net/netlink/InetDiagSocketIntegrationTest.java"
    ];
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.rules"
        "mockito-target-extended-minus-junit4"
        "net-tests-utils"
        "testables"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    jarjar_rules = ":NetworkStackJarJarRules";
    visibility = ["//visibility:private"];
};

NetworkStackIntegrationTestsLib = android_library {
    name = "NetworkStackIntegrationTestsLib";
    defaults = ["NetworkStackIntegrationTestsDefaults"];
    min_sdk_version = "29";
    static_libs = [
        "NetworkStackApiStableLib"
    ];
};

#  Network stack integration tests.
NetworkStackIntegrationTests = android_test {
    name = "NetworkStackIntegrationTests";
    defaults = ["NetworkStackIntegrationTestsJniDefaults"];
    static_libs = ["NetworkStackIntegrationTestsLib"];
    certificate = "networkstack";
    platform_apis = true;
    test_suites = ["device-tests"];
    min_sdk_version = "29";
};

#  Network stack next integration tests.
NetworkStackNextIntegrationTests = android_test {
    name = "NetworkStackNextIntegrationTests";
    defaults = [
        "NetworkStackIntegrationTestsDefaults"
        "NetworkStackIntegrationTestsJniDefaults"
    ];
    static_libs = [
        "NetworkStackApiCurrentLib"
    ];
    certificate = "networkstack";
    platform_apis = true;
    test_suites = ["device-tests"];
};

#  The static lib needs to be jarjared by each module so they do not conflict with each other
#  (e.g. wifi, system server, network stack need to use different package names when including it).
#  Apply NetworkStack jarjar rules to the tests as well so classes in NetworkStaticLibTests have the
#  same package names as in module code.
NetworkStackStaticLibTestsLib = android_library {
    name = "NetworkStackStaticLibTestsLib";
    platform_apis = true;
    min_sdk_version = "29";
    jarjar_rules = ":NetworkStackJarJarRules";
    static_libs = ["NetworkStaticLibTestsLib"];
};

#  Special version of the network stack tests that includes all tests necessary for code coverage
#  purposes. This is currently the union of NetworkStackTests and NetworkStackIntegrationTests.
NetworkStackCoverageTests = android_test {
    name = "NetworkStackCoverageTests";
    certificate = "networkstack";
    platform_apis = true;
    min_sdk_version = "29";
    test_suites = [
        "device-tests"
        "mts"
    ];
    test_config = "AndroidTest_Coverage.xml";
    defaults = ["NetworkStackIntegrationTestsJniDefaults"];
    static_libs = [
        "NetworkStackTestsLib"
        "NetworkStackIntegrationTestsLib"
        "NetworkStackStaticLibTestsLib"
    ];
    compile_multilib = "both";
    manifest = "AndroidManifest_coverage.xml";
};

in { inherit NetworkStackCoverageTests NetworkStackIntegrationTests NetworkStackIntegrationTestsDefaults NetworkStackIntegrationTestsJniDefaults NetworkStackIntegrationTestsLib NetworkStackNextIntegrationTests NetworkStackStaticLibTestsLib; }
