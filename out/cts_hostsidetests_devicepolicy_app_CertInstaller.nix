{ android_test_helper_app }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsCertInstallerApp = android_test_helper_app {
    name = "CtsCertInstallerApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/certinstaller/CertInstallerReceiver.java"
        "src/com/android/cts/certinstaller/CertSelectionDelegateTest.java"
        "src/com/android/cts/certinstaller/DelegatedDeviceIdAttestationTest.java"
        "src/com/android/cts/certinstaller/DirectDelegatedCertInstallerTest.java"
        "src/com/android/cts/certinstaller/PreSelectedKeyAccessTest.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    platform_apis = true;
    min_sdk_version = "22";
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "truth-prebuilt"
        "testng"
        "cts-security-test-support-library"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsCertInstallerApp; }
