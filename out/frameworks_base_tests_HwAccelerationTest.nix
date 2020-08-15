{ android_test }:
let

#
#  Copyright (C) 2010 The Android Open Source Project
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

HwAccelerationTest = android_test {
    name = "HwAccelerationTest";
    srcs = [
        "src/com/android/test/hwui/AdvancedBlendActivity.java"
        "src/com/android/test/hwui/AdvancedGradientsActivity.java"
        "src/com/android/test/hwui/Alpha8BitmapActivity.java"
        "src/com/android/test/hwui/AlphaLayersActivity.java"
        "src/com/android/test/hwui/Animated3dActivity.java"
        "src/com/android/test/hwui/AssetsAtlasActivity.java"
        "src/com/android/test/hwui/BigGradientActivity.java"
        "src/com/android/test/hwui/BitmapMeshActivity.java"
        "src/com/android/test/hwui/BitmapMeshLayerActivity.java"
        "src/com/android/test/hwui/BitmapMutateActivity.java"
        "src/com/android/test/hwui/Bitmaps3dActivity.java"
        "src/com/android/test/hwui/BitmapsActivity.java"
        "src/com/android/test/hwui/BitmapsAlphaActivity.java"
        "src/com/android/test/hwui/BitmapsRectActivity.java"
        "src/com/android/test/hwui/BitmapsSkewActivity.java"
        "src/com/android/test/hwui/CanvasTextureViewActivity.java"
        "src/com/android/test/hwui/CirclePropActivity.java"
        "src/com/android/test/hwui/ClearActivity.java"
        "src/com/android/test/hwui/ClipOutlineActivity.java"
        "src/com/android/test/hwui/ClipRegion2Activity.java"
        "src/com/android/test/hwui/ClipRegion3Activity.java"
        "src/com/android/test/hwui/ClipRegionActivity.java"
        "src/com/android/test/hwui/ColorFiltersActivity.java"
        "src/com/android/test/hwui/ColorFiltersMutateActivity.java"
        "src/com/android/test/hwui/ColoredRectsActivity.java"
        "src/com/android/test/hwui/ColoredShadowsActivity.java"
        "src/com/android/test/hwui/CustomRenderer.java"
        "src/com/android/test/hwui/DatePicker.java"
        "src/com/android/test/hwui/DatePickerActivity.java"
        "src/com/android/test/hwui/DisplayListLayersActivity.java"
        "src/com/android/test/hwui/DrawIntoHwBitmapActivity.java"
        "src/com/android/test/hwui/FramebufferBlendActivity.java"
        "src/com/android/test/hwui/GLDepthTestActivity.java"
        "src/com/android/test/hwui/GLTextureViewActivity.java"
        "src/com/android/test/hwui/GetBitmapActivity.java"
        "src/com/android/test/hwui/GetBitmapSurfaceViewActivity.java"
        "src/com/android/test/hwui/GlyphCacheActivity.java"
        "src/com/android/test/hwui/GradientStopsActivity.java"
        "src/com/android/test/hwui/GradientsActivity.java"
        "src/com/android/test/hwui/HardwareCanvasSurfaceViewActivity.java"
        "src/com/android/test/hwui/HardwareCanvasTextureViewActivity.java"
        "src/com/android/test/hwui/HwTests.java"
        "src/com/android/test/hwui/LabelsActivity.java"
        "src/com/android/test/hwui/LayersActivity.java"
        "src/com/android/test/hwui/Lines2Activity.java"
        "src/com/android/test/hwui/LinesActivity.java"
        "src/com/android/test/hwui/ListActivity.java"
        "src/com/android/test/hwui/LooperAcceleration.java"
        "src/com/android/test/hwui/MarqueeActivity.java"
        "src/com/android/test/hwui/MatrixActivity.java"
        "src/com/android/test/hwui/MaxBitmapSizeActivity.java"
        "src/com/android/test/hwui/MipMapActivity.java"
        "src/com/android/test/hwui/MoreNinePatchesActivity.java"
        "src/com/android/test/hwui/MoreShadersActivity.java"
        "src/com/android/test/hwui/MovingSurfaceViewActivity.java"
        "src/com/android/test/hwui/MultiLayersActivity.java"
        "src/com/android/test/hwui/MultiProducerActivity.java"
        "src/com/android/test/hwui/MyLittleTextureView.java"
        "src/com/android/test/hwui/NewLayersActivity.java"
        "src/com/android/test/hwui/NinePatchesActivity.java"
        "src/com/android/test/hwui/NoAATextActivity.java"
        "src/com/android/test/hwui/OpaqueActivity.java"
        "src/com/android/test/hwui/PaintDrawFilterActivity.java"
        "src/com/android/test/hwui/PathDestructionActivity.java"
        "src/com/android/test/hwui/PathOffsetActivity.java"
        "src/com/android/test/hwui/PathOpsActivity.java"
        "src/com/android/test/hwui/PathsActivity.java"
        "src/com/android/test/hwui/PathsCacheActivity.java"
        "src/com/android/test/hwui/PictureCaptureDemo.java"
        "src/com/android/test/hwui/PixelCopyWindow.java"
        "src/com/android/test/hwui/PointsActivity.java"
        "src/com/android/test/hwui/PosTextActivity.java"
        "src/com/android/test/hwui/PositionListenerActivity.java"
        "src/com/android/test/hwui/ProjectionActivity.java"
        "src/com/android/test/hwui/ProjectionClippingActivity.java"
        "src/com/android/test/hwui/QuickRejectActivity.java"
        "src/com/android/test/hwui/ResizeActivity.java"
        "src/com/android/test/hwui/RevealActivity.java"
        "src/com/android/test/hwui/Rotate3dTextActivity.java"
        "src/com/android/test/hwui/RotationActivity.java"
        "src/com/android/test/hwui/ScaledPathsActivity.java"
        "src/com/android/test/hwui/ScaledTextActivity.java"
        "src/com/android/test/hwui/ShadersActivity.java"
        "src/com/android/test/hwui/ShapesActivity.java"
        "src/com/android/test/hwui/SimplePatchActivity.java"
        "src/com/android/test/hwui/SimplePathsActivity.java"
        "src/com/android/test/hwui/SingleFrameTextureViewTestActivity.java"
        "src/com/android/test/hwui/SmallCircleActivity.java"
        "src/com/android/test/hwui/StackActivity.java"
        "src/com/android/test/hwui/TJunctionActivity.java"
        "src/com/android/test/hwui/TextActivity.java"
        "src/com/android/test/hwui/TextFadeActivity.java"
        "src/com/android/test/hwui/TextGammaActivity.java"
        "src/com/android/test/hwui/TextOnPathActivity.java"
        "src/com/android/test/hwui/TextPathActivity.java"
        "src/com/android/test/hwui/TextureViewActivity.java"
        "src/com/android/test/hwui/ThinPatchesActivity.java"
        "src/com/android/test/hwui/TimeDialogActivity.java"
        "src/com/android/test/hwui/Transform3dActivity.java"
        "src/com/android/test/hwui/TransformsAndAnimationsActivity.java"
        "src/com/android/test/hwui/TransparentListActivity.java"
        "src/com/android/test/hwui/VideoViewCaptureActivity.java"
        "src/com/android/test/hwui/ViewFlipperActivity.java"
        "src/com/android/test/hwui/ViewLayerInvalidationActivity.java"
        "src/com/android/test/hwui/ViewLayersActivity.java"
        "src/com/android/test/hwui/ViewLayersActivity2.java"
        "src/com/android/test/hwui/ViewLayersActivity3.java"
        "src/com/android/test/hwui/ViewLayersActivity4.java"
        "src/com/android/test/hwui/ViewLayersActivity5.java"
        "src/com/android/test/hwui/ViewPropertyAlphaActivity.java"
        "src/com/android/test/hwui/XfermodeActivity.java"
        "src/com/android/test/hwui/ZOrderingActivity.java"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit HwAccelerationTest; }
