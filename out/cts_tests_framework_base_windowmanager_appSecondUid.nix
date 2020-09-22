{ android_test }:
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

CtsDeviceServicesTestSecondApp = android_test {
    name = "CtsDeviceServicesTestSecondApp";
    defaults = ["cts_support_defaults"];

    static_libs = ["cts-wm-app-base"];

    srcs = [
        "src/android/server/wm/second/Components.java"
        "src/android/server/wm/second/EmbeddingActivity.java"
        "src/android/server/wm/second/LaunchBroadcastReceiver.java"
        "src/android/server/wm/second/SecondActivity.java"
        "src/android/server/wm/second/SecondActivityNoEmbedding.java"
        "src/android/server/wm/second/TestActivityWithSameAffinityDifferentUid.java"
    ];

    sdk_version = "test_current";

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsDeviceServicesTestSecondApp; }
