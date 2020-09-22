{ android_test_helper_app }:
let

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

CtsSharesheetActivityLabelTester = android_test_helper_app {
    name = "CtsSharesheetActivityLabelTester";
    defaults = ["cts_defaults"];
    srcs = [];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.sharesheet.cts.packages.activitylabeltester"
    ];
    manifest = "AndroidManifest-ActivityLabelTester.xml";
};

CtsSharesheetIntentFilterLabelTester = android_test_helper_app {
    name = "CtsSharesheetIntentFilterLabelTester";
    defaults = ["cts_defaults"];
    srcs = [];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.sharesheet.cts.packages.intentfilterlabeltester"
    ];
    manifest = "AndroidManifest-IntentFilterLabelTester.xml";
};

CtsSharesheetExcludeTester = android_test_helper_app {
    name = "CtsSharesheetExcludeTester";
    defaults = ["cts_defaults"];
    srcs = [];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.sharesheet.cts.packages.excludetester"
    ];
    manifest = "AndroidManifest-ExcludeTester.xml";
};

in { inherit CtsSharesheetActivityLabelTester CtsSharesheetExcludeTester CtsSharesheetIntentFilterLabelTester; }
