{ android_test_helper_app }:
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

ActivityManagerPerfTestsStubApp1 = android_test_helper_app {
    name = "ActivityManagerPerfTestsStubApp1";
    static_libs = ["ActivityManagerPerfTestsUtils"];
    srcs = [
        "src/com/android/stubs/am/InitService.java"
        "src/com/android/stubs/am/TestActivity.java"
        "src/com/android/stubs/am/TestBroadcastReceiver.java"
        "src/com/android/stubs/am/TestContentProvider.java"
        "src/com/android/stubs/am/TestService.java"
    ];
    resource_dirs = [
        "app1/res"
        "res"
    ];
    platform_apis = true;
    certificate = "platform";
    aaptflags = [
        "--rename-manifest-package com.android.stubs.am1"
        "--auto-add-overlay"
    ];
};

ActivityManagerPerfTestsStubApp2 = android_test_helper_app {
    name = "ActivityManagerPerfTestsStubApp2";
    static_libs = ["ActivityManagerPerfTestsUtils"];
    srcs = [
        "src/com/android/stubs/am/InitService.java"
        "src/com/android/stubs/am/TestActivity.java"
        "src/com/android/stubs/am/TestBroadcastReceiver.java"
        "src/com/android/stubs/am/TestContentProvider.java"
        "src/com/android/stubs/am/TestService.java"
    ];
    resource_dirs = [
        "app2/res"
        "res"
    ];
    platform_apis = true;
    certificate = "platform";
    aaptflags = [
        "--rename-manifest-package com.android.stubs.am2"
        "--auto-add-overlay"
    ];
};

ActivityManagerPerfTestsStubApp3 = android_test_helper_app {
    name = "ActivityManagerPerfTestsStubApp3";
    static_libs = ["ActivityManagerPerfTestsUtils"];
    srcs = [
        "src/com/android/stubs/am/InitService.java"
        "src/com/android/stubs/am/TestActivity.java"
        "src/com/android/stubs/am/TestBroadcastReceiver.java"
        "src/com/android/stubs/am/TestContentProvider.java"
        "src/com/android/stubs/am/TestService.java"
    ];
    resource_dirs = [
        "app3/res"
        "res"
    ];
    platform_apis = true;
    certificate = "platform";
    aaptflags = [
        "--rename-manifest-package com.android.stubs.am3"
        "--auto-add-overlay"
    ];
};

in { inherit ActivityManagerPerfTestsStubApp1 ActivityManagerPerfTestsStubApp2 ActivityManagerPerfTestsStubApp3; }
