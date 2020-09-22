{ android_test_helper_app }:
let

#  Copyright (C) 2020 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

BootCompletedUserspaceRebootTestApp = android_test_helper_app {
    name = "BootCompletedUserspaceRebootTestApp";
    srcs = ["src/com/android/cts/userspacereboot/bootcompleted/BootCompletedUserspaceRebootTest.java"];
    manifest = "AndroidManifest.xml";
    static_libs = [
        "androidx.test.runner"
        "androidx.test.core"
        "compatibility-device-util-axt"
        "testng"
        "truth-prebuilt"
    ];
    min_sdk_version = "29";
    sdk_version = "29";
    target_sdk_version = "29";
};

in { inherit BootCompletedUserspaceRebootTestApp; }
