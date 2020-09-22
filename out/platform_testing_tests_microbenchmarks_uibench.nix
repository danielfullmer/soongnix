{ android_test }:
let

#  Copyright 2019 Google Inc. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

UiBenchMicrobenchmark = android_test {
    name = "UiBenchMicrobenchmark";
    srcs = [
        "src/com/android/uibench/microbenchmark/IUiBenchJankHelper.java"
        "src/com/android/uibench/microbenchmark/UiBenchActivityTransitionsAnimationMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchBitmapUploadJankMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchBrowseContentScrollMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchBrowseContentScrollNoBitmapUploadMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchBrowseFastLaneScrollMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchBrowseFastLaneScrollNoBitmapUploadMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchClippedListViewMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchDialogListFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchEditTextTypingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchFadingEdgeListViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchFullscreenOverdrawMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchGLTextureViewMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchInflatingEmojiListViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchInflatingHanListViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchInflatingListViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchInflatingLongStringListViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchInvalidateMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchInvalidateTreeMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchJankHelper.java"
        "src/com/android/uibench/microbenchmark/UiBenchLayoutCacheHighHitrateFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchLayoutCacheLowHitrateFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchOpenNavigationDrawerMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchOpenNotificationShadeMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchResizeHWLayerMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchSaveLayerAnimationMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchShadowGridListFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchSlowBindRecyclerViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchSlowNestedRecyclerViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchSlowNestedRecyclerViewInitialFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchTrivialAnimationMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchTrivialListViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchTrivialRecyclerListViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchWebViewFlingMicrobenchmark.java"
        "src/com/android/uibench/microbenchmark/UiBenchWindowInsetsControllerMicrobenchmark.java"
    ];

    static_libs = [
        "collector-device-lib"
        "ub-uiautomator"
        "junit"
        "microbenchmark-device-lib"
        "launcher-helper-lib"
    ];

    libs = ["android.test.base.stubs"];

    data = [":perfetto_artifacts"];

    sdk_version = "test_current";

    test_suites = ["device-tests"];
};

in { inherit UiBenchMicrobenchmark; }
