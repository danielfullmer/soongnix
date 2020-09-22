{ android_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CtsUiRenderingTestCases27 = android_test {
    name = "CtsUiRenderingTestCases27";
    sdk_version = "test_current";
    target_sdk_version = "27";

    srcs = [
        "src/android/uirendering/cts/bitmapcomparers/BitmapComparer.java"
        "src/android/uirendering/cts/bitmapverifiers/BitmapVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/ColorVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/PerPixelBitmapVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/RectVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/SamplePointVerifier.java"
        "src/android/uirendering/cts/blendmode/BitmapBlendModeCanvasClient.java"
        "src/android/uirendering/cts/differencevisualizers/DifferenceVisualizer.java"
        "src/android/uirendering/cts/differencevisualizers/PassFailVisualizer.java"
        "src/android/uirendering/cts/runner/UiRenderingRunner.java"
        "src/android/uirendering/cts/testclasses/BitmapBlendModeTest.java"
        "src/android/uirendering/cts/testinfrastructure/ActivityTestBase.java"
        "src/android/uirendering/cts/testinfrastructure/CanvasClient.java"
        "src/android/uirendering/cts/testinfrastructure/CanvasClientDrawable.java"
        "src/android/uirendering/cts/testinfrastructure/CanvasClientView.java"
        "src/android/uirendering/cts/testinfrastructure/Tracer.java"
        "src/android/uirendering/cts/testinfrastructure/ViewInitializer.java"
        "src/android/uirendering/cts/util/BitmapAsserter.java"
        "src/android/uirendering/cts/util/BitmapDumper.java"
        "src/android/uirendering/cts/util/CompareUtils.java"
        "src/android/uirendering/cts/util/DrawCountDown.java"
        "src/android/uirendering/cts/testinfrastructure/DrawActivity.kt"
    ];

    static_libs = [
        "compatibility-device-util-axt"
        "ctsdeviceutillegacy-axt"
        "mockito-target-minus-junit4"
        "androidx.test.rules"
        "kotlin-test"
    ];

    libs = ["android.test.runner.stubs"];

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsUiRenderingTestCases27; }
