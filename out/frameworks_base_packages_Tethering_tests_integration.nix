{ android_library, android_test, java_defaults }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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
TetheringIntegrationTestsDefaults = java_defaults {
    name = "TetheringIntegrationTestsDefaults";
    srcs = [
        "src/android/net/EthernetTetheringTest.java"

    ];
    static_libs = [
        "NetworkStackApiStableLib"
        "androidx.test.rules"
        "frameworks-base-testutils"
        "mockito-target-extended-minus-junit4"
        "net-tests-utils"
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
    ];
    jarjar_rules = ":NetworkStackJarJarRules";
};

TetheringIntegrationTestsLib = android_library {
    name = "TetheringIntegrationTestsLib";
    platform_apis = true;
    defaults = ["TetheringIntegrationTestsDefaults"];
    visibility = ["//cts/tests/tests/tethering"];
};

TetheringIntegrationTests = android_test {
    name = "TetheringIntegrationTests";
    platform_apis = true;
    defaults = ["TetheringIntegrationTestsDefaults"];
    test_suites = [
        "device-tests"
        "mts"
    ];
    compile_multilib = "both";
};

#  Special version of the tethering tests that includes all tests necessary for code coverage
#  purposes. This is currently the union of TetheringTests, TetheringIntegrationTests and
#  NetworkStackTests.
TetheringCoverageTests = android_test {
    name = "TetheringCoverageTests";
    platform_apis = true;
    test_suites = [
        "device-tests"
        "mts"
    ];
    test_config = "AndroidTest_Coverage.xml";
    defaults = ["libnetworkstackutilsjni_deps"];
    static_libs = [
        "NetworkStaticLibTestsLib"
        "NetworkStackTestsLib"
        "TetheringTestsLib"
        "TetheringIntegrationTestsLib"
    ];
    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
        #  For NetworkStackUtils included in NetworkStackBase
        "libnetworkstackutilsjni"
    ];
    compile_multilib = "both";
    manifest = "AndroidManifest_coverage.xml";
};

in { inherit TetheringCoverageTests TetheringIntegrationTests TetheringIntegrationTestsDefaults TetheringIntegrationTestsLib; }