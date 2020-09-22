{ android_app }:
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

CarRadioApp = android_app {
    name = "CarRadioApp";

    srcs = [
        "src/com/android/car/radio/BandController.java"
        "src/com/android/car/radio/BrowseAdapter.java"
        "src/com/android/car/radio/BrowseFragment.java"
        "src/com/android/car/radio/DisplayController.java"
        "src/com/android/car/radio/FavoritesFragment.java"
        "src/com/android/car/radio/ManualTunerController.java"
        "src/com/android/car/radio/ManualTunerFragment.java"
        "src/com/android/car/radio/ProgramViewHolder.java"
        "src/com/android/car/radio/RadioActivity.java"
        "src/com/android/car/radio/RadioController.java"
        "src/com/android/car/radio/RadioPagerAdapter.java"
        "src/com/android/car/radio/SkipMode.java"
        "src/com/android/car/radio/audio/AudioStreamController.java"
        "src/com/android/car/radio/bands/AMFMProgramType.java"
        "src/com/android/car/radio/bands/AMProgramType.java"
        "src/com/android/car/radio/bands/DABProgramType.java"
        "src/com/android/car/radio/bands/FMProgramType.java"
        "src/com/android/car/radio/bands/ProgramType.java"
        "src/com/android/car/radio/bands/RegionConfig.java"
        "src/com/android/car/radio/media/TunerSession.java"
        "src/com/android/car/radio/platform/ImageMemoryCache.java"
        "src/com/android/car/radio/platform/RadioManagerExt.java"
        "src/com/android/car/radio/platform/RadioTunerExt.java"
        "src/com/android/car/radio/platform/TunerCallbackAdapterExt.java"
        "src/com/android/car/radio/service/RadioAppService.java"
        "src/com/android/car/radio/service/RadioAppServiceWrapper.java"
        "src/com/android/car/radio/service/SkipController.java"
        "src/com/android/car/radio/storage/Favorite.java"
        "src/com/android/car/radio/storage/IdentifierEntity.java"
        "src/com/android/car/radio/storage/ProgramSelectorConverter.java"
        "src/com/android/car/radio/storage/RadioDatabase.java"
        "src/com/android/car/radio/storage/RadioStorage.java"
        "src/com/android/car/radio/util/Log.java"
        "src/com/android/car/radio/util/Remote.java"
        "src/com/android/car/radio/widget/BandSelectorFlat.java"
        "src/com/android/car/radio/widget/PlayPauseButton.java"
        "src/com/android/car/radio/service/IRadioAppCallback.aidl"
        "src/com/android/car/radio/service/IRadioAppService.aidl"
        "src/com/android/car/radio/service/ITuneCallback.aidl"
    ];
    aidl = {
        local_include_dirs = ["src"];
    };

    platform_apis = true;

    required = ["privapp_whitelist_com.android.car.radio"];

    certificate = "platform";

    privileged = true;

    libs = ["android.car"];

    static_libs = [
        "androidx.lifecycle_lifecycle-livedata"
        "androidx-constraintlayout_constraintlayout"
        "androidx.room_room-runtime"
        "car-apps-common"
        "car-media-common"
        "car-broadcastradio-support"
        "car-ui-lib"
    ];

    plugins = ["androidx.room_room-compiler-plugin"];

    resource_dirs = ["res"];

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit CarRadioApp; }
