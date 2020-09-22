{ android_app }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

CarMessengerApp = android_app {
    name = "CarMessengerApp";

    srcs = [
        "src/com/android/car/messenger/MessageNotificationDelegate.java"
        "src/com/android/car/messenger/MessengerActivity.java"
        "src/com/android/car/messenger/MessengerService.java"
        "src/com/android/car/messenger/MmsReceiver.java"
        "src/com/android/car/messenger/SmsDatabaseHandler.java"
        "src/com/android/car/messenger/SmsReceiver.java"
        "src/com/android/car/messenger/bluetooth/BluetoothHelper.java"
        "src/com/android/car/messenger/bluetooth/BluetoothMonitor.java"
        "src/com/android/car/messenger/log/L.java"
    ];

    resource_dirs = ["res"];

    platform_apis = true;

    overrides = ["messaging"];

    optimize = {
        enabled = false;
    };

    privileged = true;

    libs = ["android.car"];

    static_libs = [
        "car-apps-common"
        "car-messenger-common"
        "car-telephony-common"
        "androidx.annotation_annotation"
        "glide-prebuilt"
    ];

    dex_preopt = {
        enabled = false;
    };

    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

in { inherit CarMessengerApp; }
