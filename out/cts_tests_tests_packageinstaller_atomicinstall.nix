{ android_test, android_test_helper_app, filegroup }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CtsAtomicInstallTestCases = android_test {
    name = "CtsAtomicInstallTestCases";

    srcs = ["src/**/*.java"];

    java_resources = [
        ":AtomicInstallTestAppAv1"
        ":AtomicInstallTestAppAv2"
        ":AtomicInstallTestAppBv1"
        ":AtomicInstallCorrupt"
    ];
    static_libs = [
        "androidx.test.runner"
        "truth-prebuilt"
    ];
    sdk_version = "test_current";
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "mts"
    ];
};

AtomicInstallCorrupt = filegroup {
    name = "AtomicInstallCorrupt";
    srcs = ["testdata/apk/prebuilt/corrupt.apk"];
    path = "testdata/apk/prebuilt";
};

AtomicInstallTestAppAv1 = android_test_helper_app {
    name = "AtomicInstallTestAppAv1";

    srcs = ["testdata/apk/src/**/*java"];

    manifest = "testdata/apk/Av1.xml";
};

AtomicInstallTestAppAv2 = android_test_helper_app {
    name = "AtomicInstallTestAppAv2";

    srcs = ["testdata/apk/src/**/*java"];

    manifest = "testdata/apk/Av2.xml";
};

AtomicInstallTestAppBv1 = android_test_helper_app {
    name = "AtomicInstallTestAppBv1";

    srcs = ["testdata/apk/src/**/*java"];

    manifest = "testdata/apk/Bv1.xml";
};

in { inherit AtomicInstallCorrupt AtomicInstallTestAppAv1 AtomicInstallTestAppAv2 AtomicInstallTestAppBv1 CtsAtomicInstallTestCases; }
