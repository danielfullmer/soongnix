{ android_app, android_library }:
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

CarNotification = android_app {
    name = "CarNotification";

    srcs = ["src/**/*.java"];

    resource_dirs = ["res"];

    platform_apis = true;
    certificate = "platform";
    privileged = true;

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    static_libs = [
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.palette_palette"
        "car-assist-client-lib"
        "android.car.userlib"
        "androidx-constraintlayout_constraintlayout"
    ];

    libs = ["android.car"];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };

    required = ["privapp_whitelist_com.android.car.notification"];
};

#  As Lib
CarNotificationLib = android_library {
    name = "CarNotificationLib";
    srcs = ["src/**/*.java"];

    resource_dirs = ["res"];

    manifest = "AndroidManifest-withoutActivity.xml";

    platform_apis = true;

    optimize = {
        enabled = false;
    };

    dex_preopt = {
        enabled = false;
    };

    static_libs = [
        "androidx.cardview_cardview"
        "androidx.recyclerview_recyclerview"
        "androidx.palette_palette"
        "car-assist-client-lib"
        "android.car.userlib"
        "androidx-constraintlayout_constraintlayout"
    ];

    libs = ["android.car"];

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit CarNotification CarNotificationLib; }
