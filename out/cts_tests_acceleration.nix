{ android_test }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

CtsAccelerationTestCases = android_test {
    name = "CtsAccelerationTestCases";
    defaults = ["cts_defaults"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/acceleration/AcceleratedView.java"
        "src/android/acceleration/BaseAcceleratedActivity.java"
        "src/android/acceleration/HardwareAcceleratedActivity.java"
        "src/android/acceleration/SoftwareAcceleratedActivity.java"
        "src/android/acceleration/WindowFlagHardwareAcceleratedActivity.java"
        "src/android/acceleration/cts/BaseAccelerationTest.java"
        "src/android/acceleration/cts/HardwareAccelerationTest.java"
        "src/android/acceleration/cts/SoftwareAccelerationTest.java"
        "src/android/acceleration/cts/WindowFlagHardwareAccelerationTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsAccelerationTestCases; }
