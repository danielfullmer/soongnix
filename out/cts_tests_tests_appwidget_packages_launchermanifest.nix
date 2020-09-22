{ android_test_helper_app }:
let

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

CtsAppWidgetLauncher1 = android_test_helper_app {
    name = "CtsAppWidgetLauncher1";
    defaults = ["cts_defaults"];
    srcs = [":CtsAppWidgetSources"];
    additional_manifests = ["AndroidManifest-pinActivity.xml"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package android.appwidget.cts.packages.launcher1"
    ];
};

CtsAppWidgetLauncher2 = android_test_helper_app {
    name = "CtsAppWidgetLauncher2";
    defaults = ["cts_defaults"];
    srcs = [":CtsAppWidgetSources"];
    additional_manifests = ["AndroidManifest-pinActivity.xml"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package android.appwidget.cts.packages.launcher2"
    ];
};

CtsAppWidgetLauncher3 = android_test_helper_app {
    name = "CtsAppWidgetLauncher3";
    defaults = ["cts_defaults"];
    srcs = [":CtsAppWidgetSources"];
    sdk_version = "current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package android.appwidget.cts.packages.launcher3"
    ];
};

in { inherit CtsAppWidgetLauncher1 CtsAppWidgetLauncher2 CtsAppWidgetLauncher3; }
