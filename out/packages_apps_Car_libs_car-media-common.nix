{ android_library }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

car-media-common = android_library {
    name = "car-media-common";

    srcs = [
        "src/com/android/car/media/common/ControlBarHelper.java"
        "src/com/android/car/media/common/CustomPlaybackAction.java"
        "src/com/android/car/media/common/FixedRatioImageView.java"
        "src/com/android/car/media/common/GridSpacingItemDecoration.java"
        "src/com/android/car/media/common/MediaButtonController.java"
        "src/com/android/car/media/common/MediaConstants.java"
        "src/com/android/car/media/common/MediaItemMetadata.java"
        "src/com/android/car/media/common/MetadataController.java"
        "src/com/android/car/media/common/MinimizedPlaybackControlBar.java"
        "src/com/android/car/media/common/PlayPauseStopImageView.java"
        "src/com/android/car/media/common/PlaybackControlsActionBar.java"
        "src/com/android/car/media/common/PlaybackFragment.java"
        "src/com/android/car/media/common/browse/BrowsedMediaItems.java"
        "src/com/android/car/media/common/browse/MediaBrowserViewModel.java"
        "src/com/android/car/media/common/browse/MediaBrowserViewModelImpl.java"
        "src/com/android/car/media/common/browse/MutableMediaBrowserViewModel.java"
        "src/com/android/car/media/common/browse/RootMediaBrowserViewModel.java"
        "src/com/android/car/media/common/browse/SearchedMediaItems.java"
        "src/com/android/car/media/common/playback/PlaybackProgress.java"
        "src/com/android/car/media/common/playback/PlaybackStateAnnotations.java"
        "src/com/android/car/media/common/playback/PlaybackViewModel.java"
        "src/com/android/car/media/common/playback/ProgressLiveData.java"
        "src/com/android/car/media/common/source/MediaBrowserConnector.java"
        "src/com/android/car/media/common/source/MediaSource.java"
        "src/com/android/car/media/common/source/MediaSourceColors.java"
        "src/com/android/car/media/common/source/MediaSourceViewModel.java"
        "src/com/android/car/media/common/source/MediaSourcesLiveData.java"
    ];

    resource_dirs = ["res"];

    optimize = {
        enabled = false;
    };

    static_libs = [
        "androidx.cardview_cardview"
        "androidx.legacy_legacy-support-v4"
        "androidx.recyclerview_recyclerview"
        "androidx.mediarouter_mediarouter"
        "androidx-constraintlayout_constraintlayout"
        "car-apps-common"
        "car-arch-common"
        "androidx-constraintlayout_constraintlayout-solver"
    ];

    libs = ["android.car-system-stubs"];
    sdk_version = "system_current";
};

in { inherit car-media-common; }
