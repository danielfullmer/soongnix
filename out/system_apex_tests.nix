{ android_app_certificate, apex, apex_key, cc_binary, java_defaults, java_library_host, java_test_host, prebuilt_etc }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

apex_e2e_test_defaults = java_defaults {
    name = "apex_e2e_test_defaults";
    libs = [
        "tradefed"
        "truth-prebuilt"
    ];
    static_libs = [
        "apex_e2e_base_test"
    ];
};

adbd_e2e_tests = java_test_host {
    name = "adbd_e2e_tests";
    srcs = ["src/com/android/tests/apex/AdbdHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.adbd"
    ];
    test_config = "adbd-e2e-tests.xml";
    test_suites = ["device-tests"];
};

timezone_data_e2e_tests = java_test_host {
    name = "timezone_data_e2e_tests";
    srcs = ["src/com/android/tests/apex/TimezoneDataHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    static_libs = [
        "platformprotos"
    ];
    data = [
        ":test1_com.android.tzdata"
    ];
    test_config = "timezone-data-e2e-tests.xml";
    test_suites = ["device-tests"];
};

statsd_e2e_tests = java_test_host {
    name = "statsd_e2e_tests";
    srcs = ["src/com/android/tests/apex/StatsdHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.os.statsd"
    ];
    test_config = "statsd-e2e-tests.xml";
    test_suites = ["device-tests"];
};

media_e2e_tests = java_test_host {
    name = "media_e2e_tests";
    srcs = ["src/com/android/tests/apex/MediaHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.media"
    ];
    test_config = "media-e2e-tests.xml";
    test_suites = ["device-tests"];
};

media_swcodec_e2e_tests = java_test_host {
    name = "media_swcodec_e2e_tests";
    srcs = ["src/com/android/tests/apex/MediaSwCodecHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.media.swcodec"
    ];
    test_config = "media-swcodec-e2e-tests.xml";
    test_suites = ["device-tests"];
};

mediaprovider_e2e_tests = java_test_host {
    name = "mediaprovider_e2e_tests";
    srcs = ["src/com/android/tests/apex/MediaProviderHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.mediaprovider"
    ];
    test_config = "mediaprovider-e2e-tests.xml";
    test_suites = ["device-tests"];
};

conscrypt_e2e_tests = java_test_host {
    name = "conscrypt_e2e_tests";
    srcs = ["src/com/android/tests/apex/ConscryptHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.conscrypt"
    ];
    test_config = "conscrypt-e2e-tests.xml";
    test_suites = ["device-tests"];
};

neuralnetworks_e2e_tests = java_test_host {
    name = "neuralnetworks_e2e_tests";
    srcs = ["src/com/android/tests/apex/NeuralNetworksHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.neuralnetworks"
    ];
    test_config = "neuralnetworks-e2e-tests.xml";
    test_suites = ["device-tests"];
};

cellbroadcast_e2e_tests = java_test_host {
    name = "cellbroadcast_e2e_tests";
    srcs = ["src/com/android/tests/apex/CellbroadcastHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.cellbroadcast"
    ];
    test_config = "cellbroadcast-e2e-tests.xml";
    test_suites = ["device-tests"];
};

ipsec_e2e_tests = java_test_host {
    name = "ipsec_e2e_tests";
    srcs = ["src/com/android/tests/apex/IpSecHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.ipsec"
    ];
    test_config = "ipsec-e2e-tests.xml";
    test_suites = ["device-tests"];
};

permission_e2e_tests = java_test_host {
    name = "permission_e2e_tests";
    srcs = ["src/com/android/tests/apex/PermissionHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.permission"
    ];
    test_config = "permission-e2e-tests.xml";
    test_suites = ["device-tests"];
};

wifi_e2e_tests = java_test_host {
    name = "wifi_e2e_tests";
    srcs = ["src/com/android/tests/apex/WifiHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.wifi"
    ];
    test_config = "wifi-e2e-tests.xml";
    test_suites = ["device-tests"];
};

extservices_e2e_tests = java_test_host {
    name = "extservices_e2e_tests";
    srcs = ["src/com/android/tests/apex/ExtServicesHostTest.java"];
    defaults = ["apex_e2e_test_defaults"];
    data = [
        ":test_com.android.extservices"
    ];
    test_config = "extservices-e2e-tests.xml";
    test_suites = ["device-tests"];
};

apex_targetprep_tests = java_test_host {
    name = "apex_targetprep_tests";
    libs = ["tradefed"];
    srcs = ["src/com/android/tests/apex/ApexTargetPrepTest.java"];
    data = [":StagedInstallTestApexV2"];
    test_config = "apex-targetprep-tests.xml";
    test_suites = ["general-tests"];
};

apex_e2e_base_test = java_library_host {
    name = "apex_e2e_base_test";
    srcs = ["src/com/android/tests/apex/ApexE2EBaseHostTest.java"];
    static_libs = [
        "module_test_util"
    ];
    libs = [
        "tradefed"
    ];
};

module_test_util = java_library_host {
    name = "module_test_util";
    srcs = ["util/com/android/tests/util/ModuleTestUtils.java"];
    libs = [
        "tradefed"
        "truth-prebuilt"
    ];
};

"apex.test" = apex {
    name = "apex.test";
    manifest = "testdata/apex_manifest.json";
    prebuilts = ["sample_prebuilt_file"];
    key = "apex.test.key";
    certificate = ":apex.test.certificate";
    installable = false;
};

"apex.test.key" = apex_key {
    name = "apex.test.key";
    public_key = "testdata/com.android.apex.test.avbpubkey";
    private_key = "testdata/com.android.apex.test.pem";
    installable = false;
};

"apex.test.certificate" = android_app_certificate {
    name = "apex.test.certificate";
    #  will use testcert.pk8 and testcert.x509.pem
    certificate = "testdata/testcert";
};

"apex.test.ld.config.txt" = prebuilt_etc {
    name = "apex.test.ld.config.txt";
    src = "testdata/ld.config.txt";
    filename = "ld.config.txt";
    installable = false;
};

sample_prebuilt_file = prebuilt_etc {
    name = "sample_prebuilt_file";
    src = "testdata/sample_prebuilt_file";
};

"apex.test.init.rc" = prebuilt_etc {
    name = "apex.test.init.rc";
    src = "testdata/init.rc";
    filename = "init.rc";
    installable = false;
};

sample_prefer32_binary = cc_binary {
    name = "sample_prefer32_binary";
    srcs = ["sample_prefer32_binary.cc"];
    target = {
        android = {
            compile_multilib = "prefer32";
        };
    };
};

apex_rollback_tests = java_test_host {
    name = "apex_rollback_tests";
    srcs = ["src/com/android/tests/apex/ApexRollbackTests.java"];
    libs = [
        "tradefed"
        "truth-prebuilt"
    ];
    static_libs = ["module_test_util"];
    test_config = "apex-rollback-tests.xml";
    test_suites = ["general-tests"];

    data = [
        "testdata/trigger_watchdog.rc"
        "testdata/trigger_watchdog.sh"
        "testdata/trigger_reboot.sh"
        ":apex.apexd_test_v2"
        ":com.android.apex.cts.shim.v2_prebuilt"
    ];
};

module_test_utils_tests = java_test_host {
    name = "module_test_utils_tests";
    srcs = ["src/com/android/tests/util/ModuleTestUtilsTest.java"];
    libs = [
        "tradefed"
        "truth-prebuilt"
    ];
    static_libs = ["module_test_util"];
    test_config = "module-test-utils-tests.xml";
    test_suites = ["general-tests"];
    data = [":com.android.apex.cts.shim.v2_prebuilt"];
};

apexd_host_tests = java_test_host {
    name = "apexd_host_tests";
    srcs = ["src/com/android/tests/apex/ApexdHostTest.java"];
    libs = ["tradefed"];
    static_libs = [
        "module_test_util"
        "truth-prebuilt"
        "apex_manifest_proto_java"
    ];
    test_config = "apexd-host-tests.xml";
    test_suites = ["general-tests"];
    data = [
        ":apex.apexd_test"
        ":apex.apexd_test_v2"
        ":apex.apexd_test_v2_no_pb"
        ":apex.apexd_test_v3"
        ":com.android.apex.cts.shim.v2_prebuilt"
        ":com.android.apex.cts.shim.v2_no_pb"
    ];
};

in { inherit "apex.test" "apex.test.certificate" "apex.test.init.rc" "apex.test.key" "apex.test.ld.config.txt" adbd_e2e_tests apex_e2e_base_test apex_e2e_test_defaults apex_rollback_tests apex_targetprep_tests apexd_host_tests cellbroadcast_e2e_tests conscrypt_e2e_tests extservices_e2e_tests ipsec_e2e_tests media_e2e_tests media_swcodec_e2e_tests mediaprovider_e2e_tests module_test_util module_test_utils_tests neuralnetworks_e2e_tests permission_e2e_tests sample_prebuilt_file sample_prefer32_binary statsd_e2e_tests timezone_data_e2e_tests wifi_e2e_tests; }
