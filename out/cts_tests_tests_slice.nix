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

CtsSliceTestCases = android_test {
    name = "CtsSliceTestCases";
    defaults = ["cts_defaults"];

    #  don't include this package in any target

    #  and when built explicitly put it in the data partition

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];

    libs = ["android.test.runner.stubs"];

    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctsdeviceutillegacy-axt"
        "ctstestrunner-axt"
        "metrics-helper-lib"
        "mockito-target-inline-minus-junit4"
        "platform-test-annotations"
        "ub-uiautomator"
    ];

    compile_multilib = "both";

    jni_libs = [
        "libdexmakerjvmtiagent"
        "libmultiplejvmtiagentsinterferenceagent"
    ];

    srcs = [
        "src/android/slice/cts/Launcher.java"
        "src/android/slice/cts/LocalSliceProvider.java"
        "src/android/slice/cts/SliceBindingTest.java"
        "src/android/slice/cts/SliceBuilderTest.java"
        "src/android/slice/cts/SliceManagerTest.java"
        "src/android/slice/cts/SliceMetricsTest.java"
        "src/android/slice/cts/SlicePermissionsTest.java"
        "src/android/slice/cts/SliceProvider.java"
        "src/android/slice/cts/SliceProviderTest.java"
        "src/android/slice/cts/SliceSpecTest.java"
        "src/android/slice/cts/SliceProviderTest.kt"
    ];

    platform_apis = true;

};

in { inherit CtsSliceTestCases; }
