{ android_test }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsInputMethodServiceDeviceTests = android_test {
    name = "CtsInputMethodServiceDeviceTests";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/inputmethodservice/cts/devicetest/DirectShellCommand.java"
        "src/android/inputmethodservice/cts/devicetest/InputMethodManagerDeviceTest.java"
        "src/android/inputmethodservice/cts/devicetest/InputMethodServiceDeviceTest.java"
        "src/android/inputmethodservice/cts/devicetest/InputMethodVisibilityVerifier.java"
        "src/android/inputmethodservice/cts/devicetest/MoreCollectors.java"
        "src/android/inputmethodservice/cts/devicetest/MultiUserDeviceTest.java"
        "src/android/inputmethodservice/cts/devicetest/NoOpDeviceTest.java"
        "src/android/inputmethodservice/cts/devicetest/SequenceMatcher.java"
        "src/android/inputmethodservice/cts/devicetest/ShellCommandDeviceTest.java"
        "src/android/inputmethodservice/cts/devicetest/TestActivity.java"
        "src/android/inputmethodservice/cts/devicetest/TestHelper.java"
    ];
    libs = ["android.test.runner.stubs"];
    static_libs = [
        "androidx.test.rules"
        "hamcrest"
        "hamcrest-library"
        "ub-uiautomator"
        "CtsInputMethodServiceCommon"
        "CtsInputMethodServiceLib"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
    min_sdk_version = "19";
};

in { inherit CtsInputMethodServiceDeviceTests; }