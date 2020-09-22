{ android_test_helper_app }:
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

#  NOTE: when converting this file to Android.bp, verify that
#  'atest CtsExtendedMockingTestCases' succeeds.

CtsExtendedMockingTestCases = android_test_helper_app {
    name = "CtsExtendedMockingTestCases";
    defaults = ["cts_defaults"];
    libs = ["android.test.runner.stubs"];
    static_libs = [
        "mockito-target-extended"
        "androidx.test.rules"
        "ctstestrunner-axt"
        "dexmaker-mockmaker-tests"
        "dexmaker-inline-mockmaker-tests"
        "dexmaker-extended-mockmaker-tests"
        "android-support-v4"
    ];
    compile_multilib = "both";
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libmultiplejvmtiagentsinterferenceagent"
        "libstaticjvmtiagent"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "current";
};

in { inherit CtsExtendedMockingTestCases; }
