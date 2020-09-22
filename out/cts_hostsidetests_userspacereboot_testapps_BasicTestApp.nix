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

BasicUserspaceRebootTestApp = android_test_helper_app {
    name = "BasicUserspaceRebootTestApp";
    srcs = [
        "src/com/android/cts/userspacereboot/basic/BasicUserspaceRebootTest.java"
        "src/com/android/cts/userspacereboot/basic/LauncherActivity.java"
    ];
    manifest = "AndroidManifest.xml";
    static_libs = [
        "androidx.test.runner"
        "androidx.test.core"
        "testng"
        "truth-prebuilt"
    ];
    min_sdk_version = "29";
    #  TODO(ioffe): change to number when SDK is finalized.
    sdk_version = "system_current";
};

in { inherit BasicUserspaceRebootTestApp; }