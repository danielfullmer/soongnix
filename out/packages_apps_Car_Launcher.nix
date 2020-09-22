{ android_app }:
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
#

CarLauncher = android_app {
    name = "CarLauncher";

    srcs = [
        "src/com/android/car/carlauncher/AppGridActivity.java"
        "src/com/android/car/carlauncher/AppGridAdapter.java"
        "src/com/android/car/carlauncher/AppItemViewHolder.java"
        "src/com/android/car/carlauncher/AppLauncherUtils.java"
        "src/com/android/car/carlauncher/AppMetaData.java"
        "src/com/android/car/carlauncher/CarLauncher.java"
        "src/com/android/car/carlauncher/ContextualFragment.java"
        "src/com/android/car/carlauncher/ContextualInfo.java"
        "src/com/android/car/carlauncher/ContextualViewModel.java"
        "src/com/android/car/carlauncher/LocalizedTextClock.java"
        "src/com/android/car/carlauncher/ProjectionContextualInfoLiveData.java"
        "src/com/android/car/carlauncher/RecentAppsRowViewHolder.java"
        "src/com/android/car/carlauncher/WeatherContextualInfoLiveData.java"
    ];

    resource_dirs = ["res"];

    platform_apis = true;

    required = ["privapp_whitelist_com.android.car.carlauncher"];

    certificate = "platform";

    privileged = true;

    overrides = [
        "Launcher2"
        "Launcher3"
        "Launcher3QuickStep"
    ];

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    static_libs = [
        "androidx-constraintlayout_constraintlayout-solver"
        "androidx-constraintlayout_constraintlayout"
        "androidx.lifecycle_lifecycle-extensions"
        "car-media-common"
        "car-ui-lib"
    ];

    libs = ["android.car"];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit CarLauncher; }
