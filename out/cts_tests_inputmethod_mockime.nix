{ android_test_helper_app, java_test_helper_library }:
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

CtsMockInputMethodLib = java_test_helper_library {
    name = "CtsMockInputMethodLib";
    sdk_version = "test_current";

    #  TODO: ideally we should split MockIme source files into three categories
    #        1) common, 2) common + IME-only, and 3) common + client-only.
    #        Currently, both MockIme APK and test APKs that use MockIme contain
    #        all the Java classes, which is inefficient.
    srcs = [
        "src/com/android/cts/mockime/ImeCommand.java"
        "src/com/android/cts/mockime/ImeEvent.java"
        "src/com/android/cts/mockime/ImeEventStream.java"
        "src/com/android/cts/mockime/ImeEventStreamTestUtils.java"
        "src/com/android/cts/mockime/ImeLayoutInfo.java"
        "src/com/android/cts/mockime/ImeSettings.java"
        "src/com/android/cts/mockime/ImeState.java"
        "src/com/android/cts/mockime/MockIme.java"
        "src/com/android/cts/mockime/MockImeSession.java"
        "src/com/android/cts/mockime/MockImeSessionRule.java"
        "src/com/android/cts/mockime/SettingsProvider.java"
        "src/com/android/cts/mockime/Watermark.java"
    ];
    libs = ["junit"];
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.autofill_autofill"
        "compatibility-device-util-axt"
    ];
};

CtsMockInputMethod = android_test_helper_app {
    name = "CtsMockInputMethod";
    defaults = ["cts_defaults"];
    optimize = {
        enabled = false;
    };
    sdk_version = "current";
    min_sdk_version = "19";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    static_libs = [
        "androidx.annotation_annotation"
        "CtsMockInputMethodLib"
    ];
};

in { inherit CtsMockInputMethod CtsMockInputMethodLib; }
