{ android_library, android_test, filegroup }:
let

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

DocumentsUIPerfTests-files = filegroup {
    name = "DocumentsUIPerfTests-files";
    srcs = [
        "common/com/android/documentsui/**/*.java"
        "functional/com/android/documentsui/ActivityTest.java"
    ];
};

DocumentsUITests-srcs = filegroup {
    name = "DocumentsUITests-srcs";
    srcs = [
        "common/**/*.java"
        "functional/**/*.java"
        "unit/**/*.java"
    ];
};

DocumentsUITests-res-lib = android_library {
    name = "DocumentsUITests-res-lib";

    manifest = "AndroidManifest.xml";

    asset_dirs = [
        "assets"
    ];

    resource_dirs = [
        "res"
    ];

    aaptflags = [
        #  pack some raw file locate in assets folder
        "-0 .zip"
        "--auto-add-overlay"
    ];
};

DocumentsUITests = android_test {
    name = "DocumentsUITests";

    manifest = "AndroidManifest.xml";

    srcs = [
        "common/**/*.java"
        "functional/**/*.java"
        "unit/**/*.java"
    ];

    resource_dirs = [
        "res"
    ];

    aaptflags = [
        "-0 .zip"
    ];

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
    ];

    static_libs = [
        "androidx.test.rules"
        "androidx.test.espresso.core"
        "androidx.test.ext.truth"
        "guava"
        "mockito-target"
        "ub-uiautomator"
    ];

    jarjar_rules = "jarjar-rules.txt";

    test_suites = [
        "device-tests"
        "mts"
    ];

    platform_apis = true;

    certificate = "platform";

    instrumentation_for = "DocumentsUI";
};

in { inherit DocumentsUIPerfTests-files DocumentsUITests DocumentsUITests-res-lib DocumentsUITests-srcs; }
