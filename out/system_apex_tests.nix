{ android_app_certificate, apex, apex_key, java_library_host, java_test_host, prebuilt_etc }:
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

timezone_data_e2e_tests = java_test_host {
    name = "timezone_data_e2e_tests";

    srcs = ["src/**/TimezoneDataHostTest.java"];

    libs = ["tradefed"];

    static_libs = [
        "apex_e2e_base_test"
        "platformprotos"
    ];

    data = [
        ":test1_com.android.tzdata"
    ];

    test_config = "timezone-data-e2e-tests.xml";

    test_suites = ["general-tests"];
};

media_e2e_tests = java_test_host {
    name = "media_e2e_tests";

    srcs = ["src/**/MediaHostTest.java"];

    libs = ["tradefed"];

    static_libs = ["apex_e2e_base_test"];

    data = [
        ":test_com.android.media"
    ];

    test_config = "media-e2e-tests.xml";

    test_suites = ["general-tests"];
};

media_swcodec_e2e_tests = java_test_host {
    name = "media_swcodec_e2e_tests";

    srcs = ["src/**/MediaSwCodecHostTest.java"];

    libs = ["tradefed"];

    static_libs = ["apex_e2e_base_test"];

    data = [
        ":test_com.android.media.swcodec"
    ];

    test_config = "media-swcodec-e2e-tests.xml";

    test_suites = ["general-tests"];
};

conscrypt_e2e_tests = java_test_host {
    name = "conscrypt_e2e_tests";

    srcs = ["src/**/ConscryptHostTest.java"];

    libs = ["tradefed"];

    static_libs = ["apex_e2e_base_test"];

    data = [
        ":test_com.android.conscrypt"
    ];

    test_config = "conscrypt-e2e-tests.xml";

    test_suites = ["general-tests"];
};

apex_targetprep_tests = java_test_host {
    name = "apex_targetprep_tests";

    libs = ["tradefed"];

    srcs = ["src/**/ApexTargetPrepTest.java"];

    data = [":StagedInstallTestApexV2"];

    test_config = "apex-targetprep-tests.xml";

    test_suites = ["general-tests"];
};

apex_e2e_base_test = java_library_host {
    name = "apex_e2e_base_test";
    srcs = [
        "src/**/ApexE2EBaseHostTest.java"
        "src/**/ApexTestUtils.java"
    ];
    libs = ["tradefed"];
};

"apex.test" = apex {
    name = "apex.test";
    manifest = "testdata/apex_manifest.json";
    prebuilts = ["sample_prebuilt_file"];
    key = "apex.test.key";
    certificate = ":apex.test.certificate";
    installable = false;
};

#  This target is not consumed by anyone. It's a sanity
#  check for the build features.
apex_test_build_features = apex {
    name = "apex_test_build_features";
    file_contexts = "apex.test";
    manifest = "testdata/apex_manifest.json";
    androidManifest = "testdata/AndroidManifest.xml";
    binaries = [
        "surfaceflinger"
        "vold"
    ];
    multilib = {
        prefer32 = {
            binaries = ["dex2oat"];
        };
    };
    native_shared_libs = [
        "libc"
        "libcutils"
    ];
    java_libs = ["conscrypt"];
    prebuilts = [
        "sample_prebuilt_file"
        "apex.test.ld.config.txt"
        "apex.test.init.rc"
    ];
    compile_multilib = "both";
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

in { inherit "apex.test" "apex.test.certificate" "apex.test.init.rc" "apex.test.key" "apex.test.ld.config.txt" apex_e2e_base_test apex_targetprep_tests apex_test_build_features conscrypt_e2e_tests media_e2e_tests media_swcodec_e2e_tests sample_prebuilt_file timezone_data_e2e_tests; }
