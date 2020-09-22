{ android_app }:
let

#
#  Copyright (C) 2015 The Android Open Source Project
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

CarMediaApp = android_app {
    name = "CarMediaApp";

    srcs = [
        "src/com/android/car/media/BrowseViewController.java"
        "src/com/android/car/media/ErrorViewController.java"
        "src/com/android/car/media/MediaActivity.java"
        "src/com/android/car/media/MediaAppConfig.java"
        "src/com/android/car/media/MediaDispatcherActivity.java"
        "src/com/android/car/media/PlaybackFragment.java"
        "src/com/android/car/media/ViewControllerBase.java"
        "src/com/android/car/media/browse/BrowseAdapter.java"
        "src/com/android/car/media/browse/BrowseItemViewType.java"
        "src/com/android/car/media/browse/BrowseViewData.java"
        "src/com/android/car/media/browse/BrowseViewHolder.java"
        "src/com/android/car/media/service/MediaConnectorService.java"
        "src/com/android/car/media/widgets/AppBarView.java"
        "src/com/android/car/media/widgets/MediaItemTab.java"
    ];

    resource_dirs = ["res"];

    required = ["privapp_whitelist_com.android.car.media"];

    certificate = "platform";

    privileged = true;

    libs = ["android.car-system-stubs"];
    sdk_version = "system_current";

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    static_libs = [
        "androidx-constraintlayout_constraintlayout-solver"
        "androidx-constraintlayout_constraintlayout"
        "car-apps-common"
        "car-media-common"
        "car-ui-lib"
    ];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit CarMediaApp; }
