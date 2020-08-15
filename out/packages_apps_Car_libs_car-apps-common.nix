{ android_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

car-apps-common-bp = android_library {
    name = "car-apps-common-bp";

    srcs = [
        "src/com/android/car/apps/common/AccountImageHelper.java"
        "src/com/android/car/apps/common/BackgroundImageView.java"
        "src/com/android/car/apps/common/BitmapUtils.java"
        "src/com/android/car/apps/common/CarControlBar.java"
        "src/com/android/car/apps/common/CarUxRestrictionsUtil.java"
        "src/com/android/car/apps/common/ClickThroughToolbar.java"
        "src/com/android/car/apps/common/CommonFlags.java"
        "src/com/android/car/apps/common/ControlBar.java"
        "src/com/android/car/apps/common/CropAlignedImageView.java"
        "src/com/android/car/apps/common/CrossfadeImageView.java"
        "src/com/android/car/apps/common/ExpandableControlBar.java"
        "src/com/android/car/apps/common/FragmentUtils.java"
        "src/com/android/car/apps/common/ImageUtils.java"
        "src/com/android/car/apps/common/LetterTileDrawable.java"
        "src/com/android/car/apps/common/MinimizedControlBar.java"
        "src/com/android/car/apps/common/RefcountObject.java"
        "src/com/android/car/apps/common/UriUtils.java"
        "src/com/android/car/apps/common/UxrButton.java"
        "src/com/android/car/apps/common/UxrTextView.java"
        "src/com/android/car/apps/common/imaging/ImageBinder.java"
        "src/com/android/car/apps/common/imaging/ImageKey.java"
        "src/com/android/car/apps/common/imaging/ImageViewBinder.java"
        "src/com/android/car/apps/common/imaging/LocalImageFetcher.java"
        "src/com/android/car/apps/common/util/Assert.java"
        "src/com/android/car/apps/common/util/CarAppsDebugUtils.java"
        "src/com/android/car/apps/common/util/CarAppsIOUtils.java"
        "src/com/android/car/apps/common/util/CarPackageManagerUtils.java"
        "src/com/android/car/apps/common/util/PagedSmoothScroller.java"
        "src/com/android/car/apps/common/util/SafeLog.java"
        "src/com/android/car/apps/common/util/ScrollBarUI.java"
        "src/com/android/car/apps/common/util/Themes.java"
        "src/com/android/car/apps/common/util/ViewUtils.java"
        "src/com/android/car/apps/common/widget/CarScrollBar.java"
        "src/com/android/car/apps/common/widget/CarTabLayout.java"
        "src/com/android/car/apps/common/widget/PagedRecyclerView.java"
        "src/com/android/car/apps/common/widget/PagedRecyclerViewAdapter.java"
        "src/com/android/car/apps/common/widget/PagedSnapHelper.java"
    ];

    resource_dirs = ["res"];

    optimize = {
        enabled = false;
    };

    libs = ["android.car"];

    static_libs = [
        "androidx.annotation_annotation"
        "androidx.cardview_cardview"
        "androidx.interpolator_interpolator"
        "androidx.lifecycle_lifecycle-common-java8"
        "androidx.lifecycle_lifecycle-extensions"
        "androidx-constraintlayout_constraintlayout"
        "androidx.recyclerview_recyclerview"
        "androidx-constraintlayout_constraintlayout-solver"
    ];
};

in { inherit car-apps-common-bp; }
