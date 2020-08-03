{ android_test, java_library_static }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

CtsAccessibilityCommon = java_library_static {
    name = "CtsAccessibilityCommon";
    sdk_version = "test_current";
    static_libs = [
        "compatibility-device-util-axt"
    ];
    srcs = ["common/src/**/*.java"];
};

CtsAccessibilityTestCases = android_test {
    name = "CtsAccessibilityTestCases";
    defaults = ["cts_defaults"];
    srcs = ["src/**/*.java"];
    static_libs = [
        "ctstestrunner-axt"
        "hamcrest-library"
        "CtsAccessibilityCommon"
    ];
    libs = ["android.test.base.stubs"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "cts_instant"
    ];
    sdk_version = "test_current";
};

in { inherit CtsAccessibilityCommon CtsAccessibilityTestCases; }
