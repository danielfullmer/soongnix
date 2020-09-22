{ android_test_helper_app }:
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

CtsSessionInspectorAppA = android_test_helper_app {
    name = "CtsSessionInspectorAppA";
    defaults = ["cts_support_defaults"];
    manifest = "AndroidManifestA.xml";
    sdk_version = "test_current";
    srcs = [
        "src/com/android/cts/sessioninspector/Constants.java"
        "src/com/android/cts/sessioninspector/SessionInspectorActivity.java"
        "src/com/android/cts/sessioninspector/SessionInspectorTest.java"
    ];
    static_libs = ["androidx.test.rules"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsSessionInspectorAppB = android_test_helper_app {
    name = "CtsSessionInspectorAppB";
    defaults = ["cts_support_defaults"];
    manifest = "AndroidManifestB.xml";
    sdk_version = "test_current";
    srcs = [
        "src/com/android/cts/sessioninspector/Constants.java"
        "src/com/android/cts/sessioninspector/SessionInspectorActivity.java"
        "src/com/android/cts/sessioninspector/SessionInspectorTest.java"
    ];
    static_libs = ["androidx.test.rules"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsSessionInspectorAppA CtsSessionInspectorAppB; }
