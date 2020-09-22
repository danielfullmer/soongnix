{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsGraphicsTestCases = android_test {
    name = "CtsGraphicsTestCases";
    defaults = ["cts_defaults"];
    compile_multilib = "both";
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "compatibility-device-util-axt"
        "ctsdeviceutillegacy-axt"
        "ctstestrunner-axt"
        "androidx.annotation_annotation"
        "junit"
        "junit-params"
        "testng"
        "androidx.core_core"
    ];
    jni_libs = ["libctsgraphics_jni"];
    srcs = [
        "src/android/graphics/cts/AImageDecoderTest.java"
        "src/android/graphics/cts/ANativeWindowTest.java"
        "src/android/graphics/cts/ASurfaceTextureTest.java"
        "src/android/graphics/cts/BasicVulkanGpuTest.java"
        "src/android/graphics/cts/BitmapColorSpaceTest.java"
        "src/android/graphics/cts/BitmapFactoryTest.java"
        "src/android/graphics/cts/BitmapFactory_OptionsTest.java"
        "src/android/graphics/cts/BitmapRGBAF16Test.java"
        "src/android/graphics/cts/BitmapRegionDecoderTest.java"
        "src/android/graphics/cts/BitmapShaderTest.java"
        "src/android/graphics/cts/BitmapTest.java"
        "src/android/graphics/cts/Bitmap_CompressFormatTest.java"
        "src/android/graphics/cts/Bitmap_ConfigTest.java"
        "src/android/graphics/cts/BlurMaskFilterTest.java"
        "src/android/graphics/cts/BlurMaskFilter_BlurTest.java"
        "src/android/graphics/cts/CameraGpuCtsActivity.java"
        "src/android/graphics/cts/CameraGpuTest.java"
        "src/android/graphics/cts/CameraTest.java"
        "src/android/graphics/cts/CameraVulkanGpuTest.java"
        "src/android/graphics/cts/CanvasTest.java"
        "src/android/graphics/cts/Canvas_EdgeTypeTest.java"
        "src/android/graphics/cts/Canvas_VertexModeTest.java"
        "src/android/graphics/cts/ColorMatrixColorFilterTest.java"
        "src/android/graphics/cts/ColorMatrixTest.java"
        "src/android/graphics/cts/ColorSpaceTest.java"
        "src/android/graphics/cts/ColorTest.java"
        "src/android/graphics/cts/Color_ColorLongTest.java"
        "src/android/graphics/cts/ComposePathEffectTest.java"
        "src/android/graphics/cts/ComposeShaderTest.java"
        "src/android/graphics/cts/CornerPathEffectTest.java"
        "src/android/graphics/cts/DashPathEffectTest.java"
        "src/android/graphics/cts/DataSpace.java"
        "src/android/graphics/cts/DiscretePathEffectTest.java"
        "src/android/graphics/cts/DrawFilterTest.java"
        "src/android/graphics/cts/EGL14Test.java"
        "src/android/graphics/cts/EGL15Test.java"
        "src/android/graphics/cts/EmbossMaskFilterTest.java"
        "src/android/graphics/cts/EmptyProvider.java"
        "src/android/graphics/cts/FontVariationAxisTest.java"
        "src/android/graphics/cts/FrameRateCtsActivity.java"
        "src/android/graphics/cts/ImageDecoderTest.java"
        "src/android/graphics/cts/ImageViewCtsActivity.java"
        "src/android/graphics/cts/InsetsTest.java"
        "src/android/graphics/cts/InterpolatorTest.java"
        "src/android/graphics/cts/Interpolator_ResultTest.java"
        "src/android/graphics/cts/LightingColorFilterTest.java"
        "src/android/graphics/cts/LinearGradientTest.java"
        "src/android/graphics/cts/MaskFilterTest.java"
        "src/android/graphics/cts/MatrixTest.java"
        "src/android/graphics/cts/Matrix_ScaleToFitTest.java"
        "src/android/graphics/cts/MediaVulkanGpuTest.java"
        "src/android/graphics/cts/MovieTest.java"
        "src/android/graphics/cts/NinePatchTest.java"
        "src/android/graphics/cts/OutlineTest.java"
        "src/android/graphics/cts/PaintFlagsDrawFilterTest.java"
        "src/android/graphics/cts/PaintTest.java"
        "src/android/graphics/cts/Paint_AlignTest.java"
        "src/android/graphics/cts/Paint_CapTest.java"
        "src/android/graphics/cts/Paint_FontMetricsIntTest.java"
        "src/android/graphics/cts/Paint_JoinTest.java"
        "src/android/graphics/cts/Paint_StyleTest.java"
        "src/android/graphics/cts/PathDashPathEffectTest.java"
        "src/android/graphics/cts/PathDashPathEffect_StyleTest.java"
        "src/android/graphics/cts/PathEffectTest.java"
        "src/android/graphics/cts/PathMeasureTest.java"
        "src/android/graphics/cts/PathTest.java"
        "src/android/graphics/cts/Path_DirectionTest.java"
        "src/android/graphics/cts/Path_FillTypeTest.java"
        "src/android/graphics/cts/PictureTest.java"
        "src/android/graphics/cts/PixelFormatTest.java"
        "src/android/graphics/cts/PointFTest.java"
        "src/android/graphics/cts/PointTest.java"
        "src/android/graphics/cts/PorterDuffColorFilterTest.java"
        "src/android/graphics/cts/PorterDuffXfermodeTest.java"
        "src/android/graphics/cts/RadialGradientTest.java"
        "src/android/graphics/cts/RectFTest.java"
        "src/android/graphics/cts/RectTest.java"
        "src/android/graphics/cts/RegionIteratorTest.java"
        "src/android/graphics/cts/RegionTest.java"
        "src/android/graphics/cts/Region_OpTest.java"
        "src/android/graphics/cts/RenderTarget.java"
        "src/android/graphics/cts/SetFrameRateTest.java"
        "src/android/graphics/cts/ShaderTest.java"
        "src/android/graphics/cts/Shader_TileModeTest.java"
        "src/android/graphics/cts/SumPathEffectTest.java"
        "src/android/graphics/cts/SweepGradientTest.java"
        "src/android/graphics/cts/SyncTest.java"
        "src/android/graphics/cts/TypefaceCustomFallbackBuilderTest.java"
        "src/android/graphics/cts/TypefaceTest.java"
        "src/android/graphics/cts/Utils.java"
        "src/android/graphics/cts/VulkanDeqpLevelTest.java"
        "src/android/graphics/cts/VulkanFeaturesTest.java"
        "src/android/graphics/cts/VulkanPreTransformCtsActivity.java"
        "src/android/graphics/cts/VulkanPreTransformTest.java"
        "src/android/graphics/cts/VulkanSurfaceSupportTest.java"
        "src/android/graphics/cts/YuvImageTest.java"
        "src/android/graphics/drawable/cts/AdaptiveIconDrawableTest.java"
        "src/android/graphics/drawable/cts/AdaptiveIconMaskTest.java"
        "src/android/graphics/drawable/cts/Animatable2Callback.java"
        "src/android/graphics/drawable/cts/Animatable2_AnimationCallbackTest.java"
        "src/android/graphics/drawable/cts/AnimatedImageActivity.java"
        "src/android/graphics/drawable/cts/AnimatedImageDrawableTest.java"
        "src/android/graphics/drawable/cts/AnimatedStateListDrawableTest.java"
        "src/android/graphics/drawable/cts/AnimatedVectorDrawableParameterizedTest.java"
        "src/android/graphics/drawable/cts/AnimatedVectorDrawableTest.java"
        "src/android/graphics/drawable/cts/AnimationDrawableTest.java"
        "src/android/graphics/drawable/cts/BitmapDrawableTest.java"
        "src/android/graphics/drawable/cts/ClipDrawableTest.java"
        "src/android/graphics/drawable/cts/ColorDrawableTest.java"
        "src/android/graphics/drawable/cts/ColorStateListDrawableTest.java"
        "src/android/graphics/drawable/cts/CustomAnimationScaleListDrawableTest.java"
        "src/android/graphics/drawable/cts/CustomDrawableTest.java"
        "src/android/graphics/drawable/cts/DefaultFocusHighlightTest.java"
        "src/android/graphics/drawable/cts/DrawableContainerStateTest.java"
        "src/android/graphics/drawable/cts/DrawableContainerTest.java"
        "src/android/graphics/drawable/cts/DrawableStubActivity.java"
        "src/android/graphics/drawable/cts/DrawableTest.java"
        "src/android/graphics/drawable/cts/DrawableTestUtils.java"
        "src/android/graphics/drawable/cts/DrawableWrapperTest.java"
        "src/android/graphics/drawable/cts/Drawable_ConstantStateTest.java"
        "src/android/graphics/drawable/cts/GradientDrawableTest.java"
        "src/android/graphics/drawable/cts/IconTest.java"
        "src/android/graphics/drawable/cts/InsetDrawableTest.java"
        "src/android/graphics/drawable/cts/LayerDrawableTest.java"
        "src/android/graphics/drawable/cts/LevelListDrawableTest.java"
        "src/android/graphics/drawable/cts/NinePatchDrawableTest.java"
        "src/android/graphics/drawable/cts/PaintDrawableTest.java"
        "src/android/graphics/drawable/cts/PictureDrawableTest.java"
        "src/android/graphics/drawable/cts/RippleDrawableTest.java"
        "src/android/graphics/drawable/cts/RotateDrawableTest.java"
        "src/android/graphics/drawable/cts/ScaleDrawableTest.java"
        "src/android/graphics/drawable/cts/ShapeDrawableTest.java"
        "src/android/graphics/drawable/cts/ShapeDrawable_ShaderFactoryTest.java"
        "src/android/graphics/drawable/cts/StateListDrawableTest.java"
        "src/android/graphics/drawable/cts/ThemedDrawableTest.java"
        "src/android/graphics/drawable/cts/TransitionDrawableTest.java"
        "src/android/graphics/drawable/cts/VectorDrawableSizeTest.java"
        "src/android/graphics/drawable/cts/VectorDrawableTest.java"
        "src/android/graphics/drawable/shapes/cts/ArcShapeTest.java"
        "src/android/graphics/drawable/shapes/cts/OvalShapeTest.java"
        "src/android/graphics/drawable/shapes/cts/PathShapeTest.java"
        "src/android/graphics/drawable/shapes/cts/RectShapeTest.java"
        "src/android/graphics/drawable/shapes/cts/RoundRectShapeTest.java"
        "src/android/graphics/drawable/shapes/cts/ShapeTest.java"
        "src/android/graphics/fonts/FontFamilyTest.java"
        "src/android/graphics/fonts/FontStyleTest.java"
        "src/android/graphics/fonts/FontTest.java"
        "src/android/graphics/fonts/FontTestUtil.java"
        "src/android/graphics/fonts/NativeSystemFontHelper.java"
        "src/android/graphics/fonts/NativeSystemFontTest.java"
        "src/android/graphics/fonts/SystemFontsTest.java"
        "src/android/graphics/text/cts/LineBreakerTest.java"
        "src/android/graphics/text/cts/MeasuredTextTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    #  Enforce public / test api only
    sdk_version = "test_current";
};

in { inherit CtsGraphicsTestCases; }