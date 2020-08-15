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

BroadcastRadioTests = android_test {
    name = "BroadcastRadioTests";
    privileged = true;
    certificate = "platform";
    #  TODO(b/13282254): uncomment when b/13282254 is fixed
    #  sdk_version: "current"
    platform_apis = true;
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "testng"
    ];
    libs = ["android.test.base"];
    srcs = ["src/android/hardware/radio/tests/functional/RadioTunerTest.java"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
};

in { inherit BroadcastRadioTests; }
