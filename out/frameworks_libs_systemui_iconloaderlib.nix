{ android_library }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

iconloader_base = android_library {
    name = "iconloader_base";
    sdk_version = "28";
    min_sdk_version = "21";
    static_libs = [
        "androidx.core_core"
    ];
    resource_dirs = [
        "res"
    ];
    srcs = [
        "src/com/android/launcher3/icons/BaseIconFactory.java"
        "src/com/android/launcher3/icons/BitmapInfo.java"
        "src/com/android/launcher3/icons/BitmapRenderer.java"
        "src/com/android/launcher3/icons/ColorExtractor.java"
        "src/com/android/launcher3/icons/DotRenderer.java"
        "src/com/android/launcher3/icons/FixedScaleDrawable.java"
        "src/com/android/launcher3/icons/GraphicsUtils.java"
        "src/com/android/launcher3/icons/IconNormalizer.java"
        "src/com/android/launcher3/icons/ShadowGenerator.java"
        "src/com/android/launcher3/icons/cache/BaseIconCache.java"
        "src/com/android/launcher3/icons/cache/CachingLogic.java"
        "src/com/android/launcher3/icons/cache/HandlerRunnable.java"
        "src/com/android/launcher3/icons/cache/IconCacheUpdateHandler.java"
        "src/com/android/launcher3/util/ComponentKey.java"
        "src/com/android/launcher3/util/NoLocaleSQLiteHelper.java"
        "src/com/android/launcher3/util/SQLiteCacheHelper.java"
    ];
};

iconloader = android_library {
    name = "iconloader";
    sdk_version = "system_current";
    min_sdk_version = "21";
    static_libs = [
        "androidx.core_core"
    ];
    resource_dirs = [
        "res"
    ];
    srcs = [
        "src/com/android/launcher3/icons/BaseIconFactory.java"
        "src/com/android/launcher3/icons/BitmapInfo.java"
        "src/com/android/launcher3/icons/BitmapRenderer.java"
        "src/com/android/launcher3/icons/ColorExtractor.java"
        "src/com/android/launcher3/icons/DotRenderer.java"
        "src/com/android/launcher3/icons/FixedScaleDrawable.java"
        "src/com/android/launcher3/icons/GraphicsUtils.java"
        "src/com/android/launcher3/icons/IconNormalizer.java"
        "src/com/android/launcher3/icons/ShadowGenerator.java"
        "src/com/android/launcher3/icons/cache/BaseIconCache.java"
        "src/com/android/launcher3/icons/cache/CachingLogic.java"
        "src/com/android/launcher3/icons/cache/HandlerRunnable.java"
        "src/com/android/launcher3/icons/cache/IconCacheUpdateHandler.java"
        "src/com/android/launcher3/util/ComponentKey.java"
        "src/com/android/launcher3/util/NoLocaleSQLiteHelper.java"
        "src/com/android/launcher3/util/SQLiteCacheHelper.java"
        "src_full_lib/com/android/launcher3/icons/IconFactory.java"
        "src_full_lib/com/android/launcher3/icons/SimpleIconCache.java"
    ];
};

in { inherit iconloader iconloader_base; }
