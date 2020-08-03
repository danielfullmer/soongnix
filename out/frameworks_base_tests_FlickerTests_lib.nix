{ java_library, java_test }:
let

#
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
#

flickerlib = java_test {
    name = "flickerlib";
    platform_apis = true;
    srcs = ["src/**/*.java"];
    static_libs = [
        "androidx.test.janktesthelper"
        "cts-wm-util"
        "platformprotosnano"
        "layersprotosnano"
        "truth-prebuilt"
        "sysui-helper"
        "launcher-helper-lib"
    ];
};

flickerautomationhelperlib = java_library {
    name = "flickerautomationhelperlib";
    sdk_version = "test_current";
    srcs = [
        "src/com/android/server/wm/flicker/AutomationUtils.java"
        "src/com/android/server/wm/flicker/WindowUtils.java"
    ];
    static_libs = [
        "sysui-helper"
        "launcher-helper-lib"
        "compatibility-device-util-axt"
    ];
};

in { inherit flickerautomationhelperlib flickerlib; }
