{ android_test }:
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

CtsLocationNoneTestCases = android_test {
    name = "CtsLocationNoneTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "LocationCtsCommon"
        "androidx.test.ext.junit"
        "androidx.test.ext.truth"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "truth-prebuilt"
    ];
    libs = [
        "android.test.base.stubs"
    ];
    srcs = ["src/android/location/cts/none/NoLocationPermissionTest.java"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsLocationNoneTestCases; }
