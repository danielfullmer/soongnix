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

CtsInputMethodTestCases = android_test {
    name = "CtsInputMethodTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    compile_multilib = "both";
    libs = ["android.test.runner.stubs"];
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "CtsMockInputMethodLib"
        "testng"
    ];
    srcs = [
        "src/android/view/inputmethod/cts/BaseInputConnectionTest.java"
        "src/android/view/inputmethod/cts/CompletionInfoTest.java"
        "src/android/view/inputmethod/cts/CursorAnchorInfoTest.java"
        "src/android/view/inputmethod/cts/EditorInfoTest.java"
        "src/android/view/inputmethod/cts/ExtractedTextRequestTest.java"
        "src/android/view/inputmethod/cts/ExtractedTextTest.java"
        "src/android/view/inputmethod/cts/FocusHandlingTest.java"
        "src/android/view/inputmethod/cts/ImeInsetsControllerTest.java"
        "src/android/view/inputmethod/cts/ImeInsetsVisibilityTest.java"
        "src/android/view/inputmethod/cts/InlineSuggestionInfoTest.java"
        "src/android/view/inputmethod/cts/InlineSuggestionTest.java"
        "src/android/view/inputmethod/cts/InlineSuggestionsRequestTest.java"
        "src/android/view/inputmethod/cts/InlineSuggestionsResponseTest.java"
        "src/android/view/inputmethod/cts/InputBindingTest.java"
        "src/android/view/inputmethod/cts/InputConnectionBlockingMethodTest.java"
        "src/android/view/inputmethod/cts/InputConnectionWrapperTest.java"
        "src/android/view/inputmethod/cts/InputContentInfoTest.java"
        "src/android/view/inputmethod/cts/InputMethodCtsActivity.java"
        "src/android/view/inputmethod/cts/InputMethodInfoTest.java"
        "src/android/view/inputmethod/cts/InputMethodManagerTest.java"
        "src/android/view/inputmethod/cts/InputMethodServiceTest.java"
        "src/android/view/inputmethod/cts/InputMethodSettingsActivityStub.java"
        "src/android/view/inputmethod/cts/InputMethodStartInputLifecycleTest.java"
        "src/android/view/inputmethod/cts/KeyboardTest.java"
        "src/android/view/inputmethod/cts/KeyboardVisibilityControlTest.java"
        "src/android/view/inputmethod/cts/NavigationBarColorTest.java"
        "src/android/view/inputmethod/cts/OnScreenPositionTest.java"
        "src/android/view/inputmethod/cts/SearchViewTest.java"
        "src/android/view/inputmethod/cts/util/DisableScreenDozeRule.java"
        "src/android/view/inputmethod/cts/util/EndToEndImeTestBase.java"
        "src/android/view/inputmethod/cts/util/InputConnectionTestUtils.java"
        "src/android/view/inputmethod/cts/util/InputMethodVisibilityVerifier.java"
        "src/android/view/inputmethod/cts/util/LightNavigationBarVerifier.java"
        "src/android/view/inputmethod/cts/util/NavigationBarColorVerifier.java"
        "src/android/view/inputmethod/cts/util/NavigationBarInfo.java"
        "src/android/view/inputmethod/cts/util/StateInitializeActivity.java"
        "src/android/view/inputmethod/cts/util/TestActivity.java"
        "src/android/view/inputmethod/cts/util/TestUtils.java"
        "src/android/view/inputmethod/cts/util/TestWebView.java"
        "src/android/view/inputmethod/cts/util/UnlockScreenRule.java"
        "src/android/view/inputmethod/cts/util/WindowFocusHandleService.java"
        "src/android/view/inputmethod/cts/util/WindowFocusStealer.java"
        "src/android/view/inputmethod/cts/util/WindowFocusStealerService.java"
        "src/android/view/inputmethod/cts/util/IWindowFocusStealer.aidl"
    ];
    aidl = {
        local_include_dirs = ["src"];
    };
    sdk_version = "test_current";
};

in { inherit CtsInputMethodTestCases; }
