{ android_test_helper_app, java_test_host, prebuilt_apex }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

CtsStagedInstallHostTestCases = java_test_host {
    name = "CtsStagedInstallHostTestCases";
    defaults = ["cts_defaults"];

    srcs = ["src/**/*.java"];

    libs = [
        "cts-tradefed"
        "tradefed"
        "truth-prebuilt"
        "hamcrest"
        "hamcrest-library"
    ];

    data = [
        ":StagedInstallTest"
    ];

    test_suites = [
        "cts"
        "general-tests"
        "mts"
    ];
};

StagedInstallTest = android_test_helper_app {
    name = "StagedInstallTest";

    srcs = ["app/src/**/*.java"];

    manifest = "app/AndroidManifest.xml";

    java_resources = [
        ":StagedInstallTestApexV1_NotPreInstalled"
        ":StagedInstallTestApexV2"
        ":StagedInstallTestApexV2_AdditionalFile"
        ":StagedInstallTestApexV2_AdditionalFolder"
        ":StagedInstallTestApexV2_WithPostInstallHook"
        ":StagedInstallTestApexV2_WithPreInstallHook"
        ":StagedInstallTestApexV2_WrongSha"
        ":StagedInstallTestApexV3"
        ":StagedInstallTestAppAv1"
        ":StagedInstallTestAppAv2"
        ":StagedInstallTestAppBv1"
        ":StagedInstallTestAppSamePackageNameAsApex"
    ];
    static_libs = [
        "androidx.test.runner"
        "androidx.test.core"
        "truth-prebuilt"
    ];
    sdk_version = "system_current";
    test_suites = ["device-tests"];

};

StagedInstallTestAppAv1 = android_test_helper_app {
    name = "StagedInstallTestAppAv1";

    srcs = ["testdata/apk/src/**/*java"];

    manifest = "testdata/apk/Av1.xml";
};

StagedInstallTestAppAv2 = android_test_helper_app {
    name = "StagedInstallTestAppAv2";

    srcs = ["testdata/apk/src/**/*java"];

    manifest = "testdata/apk/Av2.xml";
};

StagedInstallTestAppBv1 = android_test_helper_app {
    name = "StagedInstallTestAppBv1";

    srcs = ["testdata/apk/src/**/*java"];

    manifest = "testdata/apk/Bv1.xml";
};

StagedInstallTestAppSamePackageNameAsApex = android_test_helper_app {
    name = "StagedInstallTestAppSamePackageNameAsApex";

    srcs = ["testdata/apk/src/**/*java"];

    manifest = "testdata/apk/StagedInstallTestAppSamePackageNameAsApex.xml";
};

StagedInstallTestApexV2 = prebuilt_apex {
    name = "StagedInstallTestApexV2";
    src = "testdata/apex/com.android.apex.cts.shim.v2.apex";
    filename = "com.android.apex.cts.shim.v2.apex";
    installable = false;
};

StagedInstallTestApexV3 = prebuilt_apex {
    name = "StagedInstallTestApexV3";
    src = "testdata/apex/com.android.apex.cts.shim.v3.apex";
    filename = "com.android.apex.cts.shim.v3.apex";
    installable = false;
};

StagedInstallTestApexV2_AdditionalFile = prebuilt_apex {
    name = "StagedInstallTestApexV2_AdditionalFile";
    src = "testdata/apex/com.android.apex.cts.shim.v2_additional_file.apex";
    filename = "com.android.apex.cts.shim.v2_additional_file.apex";
    installable = false;
};

StagedInstallTestApexV2_AdditionalFolder = prebuilt_apex {
    name = "StagedInstallTestApexV2_AdditionalFolder";
    src = "testdata/apex/com.android.apex.cts.shim.v2_additional_folder.apex";
    filename = "com.android.apex.cts.shim.v2_additional_folder.apex";
    installable = false;
};

StagedInstallTestApexV2_WithPostInstallHook = prebuilt_apex {
    name = "StagedInstallTestApexV2_WithPostInstallHook";
    src = "testdata/apex/com.android.apex.cts.shim.v2_with_post_install_hook.apex";
    filename = "com.android.apex.cts.shim.v2_with_post_install_hook.apex";
    installable = false;
};

StagedInstallTestApexV2_WithPreInstallHook = prebuilt_apex {
    name = "StagedInstallTestApexV2_WithPreInstallHook";
    src = "testdata/apex/com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
    filename = "com.android.apex.cts.shim.v2_with_pre_install_hook.apex";
    installable = false;
};

StagedInstallTestApexV2_WrongSha = prebuilt_apex {
    name = "StagedInstallTestApexV2_WrongSha";
    src = "testdata/apex/com.android.apex.cts.shim.v2_wrong_sha.apex";
    filename = "com.android.apex.cts.shim.v2_wrong_sha.apex";
    installable = false;
};

StagedInstallTestApexV1_NotPreInstalled = prebuilt_apex {
    name = "StagedInstallTestApexV1_NotPreInstalled";
    src = "testdata/apex/com.android.apex.cts.shim_not_pre_installed.apex";
    filename = "com.android.apex.cts.shim_not_pre_installed.apex";
    installable = false;
};

in { inherit CtsStagedInstallHostTestCases StagedInstallTest StagedInstallTestApexV1_NotPreInstalled StagedInstallTestApexV2 StagedInstallTestApexV2_AdditionalFile StagedInstallTestApexV2_AdditionalFolder StagedInstallTestApexV2_WithPostInstallHook StagedInstallTestApexV2_WithPreInstallHook StagedInstallTestApexV2_WrongSha StagedInstallTestApexV3 StagedInstallTestAppAv1 StagedInstallTestAppAv2 StagedInstallTestAppBv1 StagedInstallTestAppSamePackageNameAsApex; }
