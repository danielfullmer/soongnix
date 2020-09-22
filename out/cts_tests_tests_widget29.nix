{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsWidgetTestCases29 = android_test {
    name = "CtsWidgetTestCases29";
    defaults = ["cts_defaults"];
    target_sdk_version = "29";

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "android-common"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "platform-test-annotations"
        "truth-prebuilt"
    ];

    libs = ["android.test.runner.stubs"];

    srcs = [
        "src/android/widget/cts29/CtsActivity.java"
        "src/android/widget/cts29/ToastTest.java"

    ];

    #  TODO: Move away from using hidden platform APIs b/72044662
    platform_apis = true;

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

};

in { inherit CtsWidgetTestCases29; }