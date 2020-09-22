{ android_test }:
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

CtsDeviceDeprecatedSdkApp = android_test {
    name = "CtsDeviceDeprecatedSdkApp";
    defaults = ["cts_support_defaults"];

    static_libs = ["cts-wm-app-base"];

    srcs = [
        "src/android/server/wm/deprecatedsdk/Components.java"
        "src/android/server/wm/deprecatedsdk/MainActivity.java"
    ];

    sdk_version = "16";

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsDeviceDeprecatedSdkApp; }
