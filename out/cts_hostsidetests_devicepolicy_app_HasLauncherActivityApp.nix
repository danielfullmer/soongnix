{ android_test_helper_app }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

CtsHasLauncherActivityApp = android_test_helper_app {
    name = "CtsHasLauncherActivityApp";
    #  Don't include this package in any target
    #  When built, explicitly put it in the data partition.
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    srcs = [
        "src/com/android/cts/haslauncheractivityapp/EmptyService.java"
        "src/com/android/cts/haslauncheractivityapp/MainActivity.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "current";
};

#  Build for no launcher activity app
CtsNoLauncherActivityApp = android_test_helper_app {
    name = "CtsNoLauncherActivityApp";
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    srcs = [
        "src/com/android/cts/haslauncheractivityapp/EmptyService.java"
        "src/com/android/cts/haslauncheractivityapp/MainActivity.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "no_launcher_activity_AndroidManifest.xml";
    sdk_version = "current";
};

#  Build for no permission app
CtsNoPermissionApp = android_test_helper_app {
    name = "CtsNoPermissionApp";
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    srcs = [
        "src/com/android/cts/haslauncheractivityapp/EmptyService.java"
        "src/com/android/cts/haslauncheractivityapp/MainActivity.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "no_permission_AndroidManifest.xml";
    sdk_version = "current";
};

in { inherit CtsHasLauncherActivityApp CtsNoLauncherActivityApp CtsNoPermissionApp; }
