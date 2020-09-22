{ android_test }:
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

CtsLeanbackJankTestCases = android_test {
    name = "CtsLeanbackJankTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/leanbackjank/cts/CtsDeviceLeanback.java"
        "src/android/leanbackjank/cts/CtsJankTestBase.java"
        "app/src/android/leanbackjank/app/IntentKeys.java"
    ];
    sdk_version = "test_current";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "androidx.test.janktesthelper"
    ];
    libs = ["android.test.base.stubs"];
};

in { inherit CtsLeanbackJankTestCases; }
