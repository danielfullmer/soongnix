{ android_library }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

# #################################################
#  Build appcompat library

libphotoviewer_appcompat = android_library {
    name = "libphotoviewer_appcompat";

    libs = ["androidx.annotation_annotation"];

    static_libs = [
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.fragment_fragment"
        "androidx.appcompat_appcompat"
    ];

    sdk_version = "current";
    srcs = [
        "src/com/android/ex/photo/ActionBarInterface.java"
        "src/com/android/ex/photo/Intents.java"
        "src/com/android/ex/photo/PhotoViewCallbacks.java"
        "src/com/android/ex/photo/PhotoViewController.java"
        "src/com/android/ex/photo/PhotoViewPager.java"
        "src/com/android/ex/photo/adapters/BaseCursorPagerAdapter.java"
        "src/com/android/ex/photo/adapters/BaseFragmentPagerAdapter.java"
        "src/com/android/ex/photo/adapters/PhotoPagerAdapter.java"
        "src/com/android/ex/photo/fragments/PhotoViewFragment.java"
        "src/com/android/ex/photo/loaders/PhotoBitmapLoader.java"
        "src/com/android/ex/photo/loaders/PhotoBitmapLoaderInterface.java"
        "src/com/android/ex/photo/loaders/PhotoPagerLoader.java"
        "src/com/android/ex/photo/provider/PhotoContract.java"
        "src/com/android/ex/photo/util/Exif.java"
        "src/com/android/ex/photo/util/ImageUtils.java"
        "src/com/android/ex/photo/util/InputStreamBuffer.java"
        "src/com/android/ex/photo/util/Trace.java"
        "src/com/android/ex/photo/util/Util.java"
        "src/com/android/ex/photo/views/PhotoView.java"
        "src/com/android/ex/photo/views/ProgressBarWrapper.java"
        "appcompat/src/com/android/ex/photo/ActionBarWrapper.java"
        "appcompat/src/com/android/ex/photo/PhotoViewActivity.java"

    ];

    resource_dirs = [
        "appcompat/res"
        "res"
    ];
};

# #################################################
#  Build non-appcompat library

libphotoviewer = android_library {
    name = "libphotoviewer";

    libs = ["androidx.annotation_annotation"];

    static_libs = [
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.fragment_fragment"
    ];

    sdk_version = "current";
    srcs = [
        "src/com/android/ex/photo/ActionBarInterface.java"
        "src/com/android/ex/photo/Intents.java"
        "src/com/android/ex/photo/PhotoViewCallbacks.java"
        "src/com/android/ex/photo/PhotoViewController.java"
        "src/com/android/ex/photo/PhotoViewPager.java"
        "src/com/android/ex/photo/adapters/BaseCursorPagerAdapter.java"
        "src/com/android/ex/photo/adapters/BaseFragmentPagerAdapter.java"
        "src/com/android/ex/photo/adapters/PhotoPagerAdapter.java"
        "src/com/android/ex/photo/fragments/PhotoViewFragment.java"
        "src/com/android/ex/photo/loaders/PhotoBitmapLoader.java"
        "src/com/android/ex/photo/loaders/PhotoBitmapLoaderInterface.java"
        "src/com/android/ex/photo/loaders/PhotoPagerLoader.java"
        "src/com/android/ex/photo/provider/PhotoContract.java"
        "src/com/android/ex/photo/util/Exif.java"
        "src/com/android/ex/photo/util/ImageUtils.java"
        "src/com/android/ex/photo/util/InputStreamBuffer.java"
        "src/com/android/ex/photo/util/Trace.java"
        "src/com/android/ex/photo/util/Util.java"
        "src/com/android/ex/photo/views/PhotoView.java"
        "src/com/android/ex/photo/views/ProgressBarWrapper.java"
        "activity/src/com/android/ex/photo/ActionBarWrapper.java"
        "activity/src/com/android/ex/photo/PhotoViewActivity.java"

    ];

    resource_dirs = [
        "activity/res"
        "res"
    ];
};

in { inherit libphotoviewer libphotoviewer_appcompat; }
