{ android_app }:
let

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

CarRotaryController = android_app {
    name = "CarRotaryController";
    srcs = [
        "src/com/android/car/rotary/FocusFinder.java"
        "src/com/android/car/rotary/L.java"
        "src/com/android/car/rotary/Navigator.java"
        "src/com/android/car/rotary/NodeCopier.java"
        "src/com/android/car/rotary/RotaryCache.java"
        "src/com/android/car/rotary/RotaryService.java"
        "src/com/android/car/rotary/TreeTraverser.java"
        "src/com/android/car/rotary/Utils.java"
    ];
    resource_dirs = ["res"];

    #  Because it uses a platform API (CarInputManager).
    platform_apis = true;

    #  This app should be platform signed because it requires android.permission.MONITOR_INPUT
    #  permission, which is of type "signature".
    certificate = "platform";

    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    libs = [
        "android.car"
    ];
    static_libs = [
        "car-ui-lib"
    ];
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit CarRotaryController; }
