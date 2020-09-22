{ android_test }:
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

WindowManagerShellTests = android_test {
    name = "WindowManagerShellTests";

    srcs = ["src/com/android/wm/shell/tests/WindowManagerShellTest.java"];

    static_libs = [
        "WindowManager-Shell"
        "junit"
        "androidx.test.runner"
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "mockito-target-extended-minus-junit4"
        "truth-prebuilt"
    ];
    libs = [
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
    ];
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];

    sdk_version = "current";
    platform_apis = true;

    optimize = {
        enabled = false;
    };
};

in { inherit WindowManagerShellTests; }