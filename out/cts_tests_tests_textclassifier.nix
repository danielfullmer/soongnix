{ android_test }:
let

#
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
#

CtsTextClassifierTestCases = android_test {
    name = "CtsTextClassifierTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "mts"
    ];
    libs = ["android.test.base.stubs"];
    static_libs = [
        "androidx.test.core"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "truth-prebuilt"
    ];
    srcs = [
        "src/android/view/textclassifier/cts/ConversationActionsTest.java"
        "src/android/view/textclassifier/cts/CtsTextClassifierService.java"
        "src/android/view/textclassifier/cts/TextClassificationManagerTest.java"
        "src/android/view/textclassifier/cts/TextClassificationSessionIdTest.java"
        "src/android/view/textclassifier/cts/TextClassifierEventTest.java"
        "src/android/view/textclassifier/cts/TextClassifierPolicyTest.java"
        "src/android/view/textclassifier/cts/TextClassifierServiceSwapTest.java"
        "src/android/view/textclassifier/cts/TextClassifierTestWatcher.java"
        "src/android/view/textclassifier/cts/TextClassifierValueObjectsTest.java"
    ];
    sdk_version = "test_current";
};

in { inherit CtsTextClassifierTestCases; }