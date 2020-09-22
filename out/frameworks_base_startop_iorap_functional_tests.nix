{ android_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

iorap-functional-tests = android_test {
    name = "iorap-functional-tests";
    srcs = ["src/com/google/android/startop/iorap/IorapWorkFlowTest.java"];
    data = [":iorap-functional-test-apps"];
    static_libs = [
        #  Non-test dependencies
        #  library under test
        "services.startop.iorap"
        #  Test Dependencies
        #  test android dependencies
        "platform-test-annotations"
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "androidx.test.uiautomator_uiautomator"
        #  test framework dependencies
        "truth-prebuilt"
    ];
    dxflags = ["--multi-dex"];
    test_suites = ["device-tests"];
    compile_multilib = "both";
    libs = [
        "android.test.base"
        "android.test.runner"
    ];
    certificate = "platform";
    platform_apis = true;
};

in { inherit iorap-functional-tests; }
