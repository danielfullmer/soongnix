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

CtsUiRenderingTestCases = android_test {
    name = "CtsUiRenderingTestCases";
    sdk_version = "test_current";

    srcs = [
        "src/android/uirendering/cts/bitmapcomparers/BitmapComparer.java"
        "src/android/uirendering/cts/bitmapcomparers/ExactComparer.java"
        "src/android/uirendering/cts/bitmapcomparers/MSSIMComparer.java"
        "src/android/uirendering/cts/bitmapverifiers/BitmapVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/ColorCountVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/ColorVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/GoldenImageVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/PerPixelBitmapVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/RectVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/RegionVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/SamplePointVerifier.java"
        "src/android/uirendering/cts/bitmapverifiers/SamplePointWideGamutVerifier.java"
        "src/android/uirendering/cts/blendmode/BitmapBlendModeCanvasClient.java"
        "src/android/uirendering/cts/differencevisualizers/DifferenceVisualizer.java"
        "src/android/uirendering/cts/differencevisualizers/PassFailVisualizer.java"
        "src/android/uirendering/cts/runner/SkipPresubmit.java"
        "src/android/uirendering/cts/runner/UiRenderingRunner.java"
        "src/android/uirendering/cts/testclasses/AlphaBlendTest.java"
        "src/android/uirendering/cts/testclasses/AutofillHighlightTests.java"
        "src/android/uirendering/cts/testclasses/BitmapBlendModeTest.java"
        "src/android/uirendering/cts/testclasses/BitmapDrawableTest.java"
        "src/android/uirendering/cts/testclasses/BitmapFilterTests.java"
        "src/android/uirendering/cts/testclasses/BitmapTests.java"
        "src/android/uirendering/cts/testclasses/BlendModeColorFilterTest.java"
        "src/android/uirendering/cts/testclasses/BlendModeTest.java"
        "src/android/uirendering/cts/testclasses/CameraTests.java"
        "src/android/uirendering/cts/testclasses/CanvasStateTests.java"
        "src/android/uirendering/cts/testclasses/CanvasTests.java"
        "src/android/uirendering/cts/testclasses/ColorFilterAlphaTest.java"
        "src/android/uirendering/cts/testclasses/ColorFilterTests.java"
        "src/android/uirendering/cts/testclasses/ColorSpaceTests.java"
        "src/android/uirendering/cts/testclasses/EdgeEffectTests.java"
        "src/android/uirendering/cts/testclasses/ExactCanvasTests.java"
        "src/android/uirendering/cts/testclasses/FontRenderingTests.java"
        "src/android/uirendering/cts/testclasses/ForceDarkTests.java"
        "src/android/uirendering/cts/testclasses/GradientTests.java"
        "src/android/uirendering/cts/testclasses/HardwareBitmapTests.java"
        "src/android/uirendering/cts/testclasses/InfrastructureTests.java"
        "src/android/uirendering/cts/testclasses/LayerTests.java"
        "src/android/uirendering/cts/testclasses/LayoutTests.java"
        "src/android/uirendering/cts/testclasses/PathClippingTests.java"
        "src/android/uirendering/cts/testclasses/PathTests.java"
        "src/android/uirendering/cts/testclasses/PictureTest.java"
        "src/android/uirendering/cts/testclasses/RenderNodeTests.java"
        "src/android/uirendering/cts/testclasses/Rgba16fTests.java"
        "src/android/uirendering/cts/testclasses/ShaderTests.java"
        "src/android/uirendering/cts/testclasses/ShadowTests.java"
        "src/android/uirendering/cts/testclasses/ShapeTests.java"
        "src/android/uirendering/cts/testclasses/SurfaceViewTests.java"
        "src/android/uirendering/cts/testclasses/SweepTests.java"
        "src/android/uirendering/cts/testclasses/TextureViewTests.java"
        "src/android/uirendering/cts/testclasses/VectorDrawableScaleTest.java"
        "src/android/uirendering/cts/testclasses/VectorDrawableTests.java"
        "src/android/uirendering/cts/testclasses/ViewAnimationUtilsTests.java"
        "src/android/uirendering/cts/testclasses/ViewClippingTests.java"
        "src/android/uirendering/cts/testclasses/ViewFadingEdgeTests.java"
        "src/android/uirendering/cts/testclasses/WideColorGamutTests.java"
        "src/android/uirendering/cts/testclasses/XfermodeTest.java"
        "src/android/uirendering/cts/testclasses/view/BitmapView.java"
        "src/android/uirendering/cts/testclasses/view/CircleClipFrameLayout.java"
        "src/android/uirendering/cts/testclasses/view/SkewLayout.java"
        "src/android/uirendering/cts/testclasses/view/UnclippedBlueView.java"
        "src/android/uirendering/cts/testinfrastructure/ActivityTestBase.java"
        "src/android/uirendering/cts/testinfrastructure/CanvasClient.java"
        "src/android/uirendering/cts/testinfrastructure/CanvasClientDrawable.java"
        "src/android/uirendering/cts/testinfrastructure/CanvasClientView.java"
        "src/android/uirendering/cts/testinfrastructure/DisplayModifier.java"
        "src/android/uirendering/cts/testinfrastructure/ResourceModifier.java"
        "src/android/uirendering/cts/testinfrastructure/Tracer.java"
        "src/android/uirendering/cts/testinfrastructure/ViewInitializer.java"
        "src/android/uirendering/cts/util/BitmapAsserter.java"
        "src/android/uirendering/cts/util/BitmapDumper.java"
        "src/android/uirendering/cts/util/CompareUtils.java"
        "src/android/uirendering/cts/util/DrawCountDown.java"
        "src/android/uirendering/cts/util/MockVsyncHelper.java"
        "src/android/uirendering/cts/util/SneakyThrow.java"
        "src/android/uirendering/cts/util/WebViewReadyHelper.java"
        "src/android/uirendering/cts/testclasses/HardwareRendererTests.kt"
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
        "vts"
        "general-tests"
    ];
};

in { inherit CtsUiRenderingTestCases; }
