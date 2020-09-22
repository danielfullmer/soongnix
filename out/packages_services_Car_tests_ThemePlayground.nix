{ android_app }:
let

#
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

ThemePlayground = android_app {
    name = "ThemePlayground";

    aaptflags = ["--auto-add-overlay"];

    srcs = [
        "src/com/android/car/themeplayground/AbstractSampleActivity.java"
        "src/com/android/car/themeplayground/CarUiRecyclerViewSamples.java"
        "src/com/android/car/themeplayground/ColorSamples.java"
        "src/com/android/car/themeplayground/DefaultThemeSamples.java"
        "src/com/android/car/themeplayground/DialogSamples.java"
        "src/com/android/car/themeplayground/MultipleIntentSamples.java"
        "src/com/android/car/themeplayground/RecyclerViewAdapter.java"
        "src/com/android/car/themeplayground/RecyclerViewSamples.java"
        "src/com/android/car/themeplayground/TextSamples.java"
        "src/com/android/car/themeplayground/Utils.java"
        "src/com/android/car/themeplayground/WidgetsSamples.java"
    ];
    resource_dirs = ["res"];

    static_libs = [
        "androidx.recyclerview_recyclerview"
        "androidx.transition_transition"
        "androidx.legacy_legacy-support-v4"
        "androidx-constraintlayout_constraintlayout"
        "androidx-constraintlayout_constraintlayout-solver"
        "car-apps-common"
        "car-ui-lib"
    ];

    owner = "google";
    platform_apis = true;
    certificate = "platform";
    privileged = true;

    optimize = {
        enabled = false;
    };

    libs = ["android.car"];

    required = ["privapp_whitelist_com.android.car.themeplayground"];
};

in { inherit ThemePlayground; }
