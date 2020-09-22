{ android_test_helper_app }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

"com.android.cts.helpers.aosp" = android_test_helper_app {
    name = "com.android.cts.helpers.aosp";
    defaults = ["cts_defaults"];
    sdk_version = "test_current";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
    ];
    srcs = ["src/com/android/cts/helpers/aosp/DefaultCtsPrintHelper.java"];

    static_libs = [
        "android-support-test"
        "cts-helpers-core"
        "cts-helpers-interfaces"
        "ub-uiautomator"
    ];
};

in { inherit "com.android.cts.helpers.aosp"; }
