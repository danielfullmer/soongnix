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

CarHvacApp = android_app {
    name = "CarHvacApp";
    srcs = [
        "src/com/android/car/hvac/BootCompleteReceiver.java"
        "src/com/android/car/hvac/DataStore.java"
        "src/com/android/car/hvac/HvacController.java"
        "src/com/android/car/hvac/HvacPolicy.java"
        "src/com/android/car/hvac/HvacUiService.java"
        "src/com/android/car/hvac/controllers/FanDirectionButtonsController.java"
        "src/com/android/car/hvac/controllers/FanSpeedBarController.java"
        "src/com/android/car/hvac/controllers/HvacPanelController.java"
        "src/com/android/car/hvac/controllers/SeatWarmerController.java"
        "src/com/android/car/hvac/controllers/TemperatureController.java"
        "src/com/android/car/hvac/ui/FanDirectionButtons.java"
        "src/com/android/car/hvac/ui/FanSpeedBar.java"
        "src/com/android/car/hvac/ui/FanSpeedBarSegment.java"
        "src/com/android/car/hvac/ui/HvacPanelRow.java"
        "src/com/android/car/hvac/ui/PressAndHoldTouchListener.java"
        "src/com/android/car/hvac/ui/SeatWarmerButton.java"
        "src/com/android/car/hvac/ui/TemperatureBarOverlay.java"
        "src/com/android/car/hvac/ui/ToggleButton.java"
    ];
    resource_dirs = ["res"];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
    libs = ["android.car"];
    static_libs = [
        "jsr305"
        "android.car"
        "androidx.legacy_legacy-support-v4"
    ];
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
    required = ["privapp_whitelist_com.android.car.hvac"];
};

in { inherit CarHvacApp; }
