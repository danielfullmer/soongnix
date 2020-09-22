{ android_test, java_library }:
let

#
#  Copyright (C) 2009 The Android Open Source Project
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

CtsDpiTestCases = android_test {
    name = "CtsDpiTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "ctstestrunner-axt"
        "junit"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/dpi/cts/ConfigurationScreenLayoutTest.java"
        "src/android/dpi/cts/ConfigurationTest.java"
        "src/android/dpi/cts/DefaultManifestAttributesSdkTest.java"
        "src/android/dpi/cts/DefaultManifestAttributesTest.java"
        "src/android/dpi/cts/OrientationActivity.java"
    ];
    sdk_version = "test_current";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

#  ============================================================

#  DefaultManifestAttributesTest can be used as a base class for other
#  CTS tests, so drop it into a library that other tests can use.
"android.cts.dpi" = java_library {
    name = "android.cts.dpi";
    libs = ["android.test.base.stubs"];
    srcs = ["src/android/dpi/cts/DefaultManifestAttributesTest.java"];
    sdk_version = "test_current";
};

in { inherit "android.cts.dpi" CtsDpiTestCases; }