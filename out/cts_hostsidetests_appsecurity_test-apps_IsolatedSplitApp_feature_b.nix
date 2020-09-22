{ android_test_helper_app }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

CtsIsolatedSplitAppFeatureB = android_test_helper_app {
    name = "CtsIsolatedSplitAppFeatureB";
    defaults = ["cts_support_defaults"];
    sdk_version = "current";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    #  Make sure our test locale polish is not stripped.
    aapt_include_all_resources = true;
    srcs = [
        "src/com/android/cts/isolatedsplitapp/feature_b/FeatureBActivity.java"
        "src/com/android/cts/isolatedsplitapp/feature_b/FeatureBReceiver.java"
    ];
    #  Generate a locale split.
    package_splits = ["pl"];
    libs = [
        "CtsIsolatedSplitApp"
        "CtsIsolatedSplitAppFeatureA"
    ];
    aaptflags = [
        "--rename-manifest-package com.android.cts.isolatedsplitapp"
        #  Assign a unique package ID to this feature split. Since these are
        #  isolated splits, it must only be unique across a dependency chain.
        "--package-id 0x81"
    ];
};

in { inherit CtsIsolatedSplitAppFeatureB; }
