{ android_app }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

RotaryPlayground = android_app {
    name = "RotaryPlayground";

    srcs = [
        "src/com/android/car/rotaryplayground/DirectManipulationHandler.java"
        "src/com/android/car/rotaryplayground/DirectManipulationState.java"
        "src/com/android/car/rotaryplayground/DirectManipulationView.java"
        "src/com/android/car/rotaryplayground/HeadsUpNotificationFragment.java"
        "src/com/android/car/rotaryplayground/L.java"
        "src/com/android/car/rotaryplayground/RotaryActivity.java"
        "src/com/android/car/rotaryplayground/RotaryCards.java"
        "src/com/android/car/rotaryplayground/RotaryDirectManipulationWidgets.java"
        "src/com/android/car/rotaryplayground/RotaryGrid.java"
        "src/com/android/car/rotaryplayground/RotaryGridAdapter.java"
        "src/com/android/car/rotaryplayground/RotaryMenu.java"
        "src/com/android/car/rotaryplayground/RotarySysUiDirectManipulationWidgets.java"
        "src/com/android/car/rotaryplayground/ScrollFragment.java"
    ];
    resource_dirs = ["res"];

    sdk_version = "system_current";

    static_libs = [
        "androidx-constraintlayout_constraintlayout"
        "car-apps-common"
        "car-ui-lib"
    ];

    owner = "google";
    certificate = "shared";

    optimize = {
        enabled = false;
    };
};

in { inherit RotaryPlayground; }
