{ android_library }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

android-opt-bitmap = android_library {
    name = "android-opt-bitmap";
    sdk_version = "18";
    srcs = [
        "src/com/android/bitmap/BitmapCache.java"
        "src/com/android/bitmap/ContiguousFIFOAggregator.java"
        "src/com/android/bitmap/DecodeAggregator.java"
        "src/com/android/bitmap/DecodeTask.java"
        "src/com/android/bitmap/NamedThreadFactory.java"
        "src/com/android/bitmap/Poolable.java"
        "src/com/android/bitmap/PooledCache.java"
        "src/com/android/bitmap/RequestKey.java"
        "src/com/android/bitmap/ResourceRequestKey.java"
        "src/com/android/bitmap/ReusableBitmap.java"
        "src/com/android/bitmap/UnrefedBitmapCache.java"
        "src/com/android/bitmap/UnrefedPooledCache.java"
        "src/com/android/bitmap/drawable/BasicBitmapDrawable.java"
        "src/com/android/bitmap/drawable/CircularBitmapDrawable.java"
        "src/com/android/bitmap/drawable/ExtendedBitmapDrawable.java"
        "src/com/android/bitmap/drawable/Parallaxable.java"
        "src/com/android/bitmap/drawable/StyledCornersBitmapDrawable.java"
        "src/com/android/bitmap/drawable/TileDrawable.java"
        "src/com/android/bitmap/util/BitmapUtils.java"
        "src/com/android/bitmap/util/Exif.java"
        "src/com/android/bitmap/util/InputStreamBuffer.java"
        "src/com/android/bitmap/util/RectUtils.java"
        "src/com/android/bitmap/util/Trace.java"
        "src/com/android/bitmap/view/BitmapDrawableImageView.java"

    ];
    resource_dirs = ["res"];
};

in { inherit android-opt-bitmap; }
