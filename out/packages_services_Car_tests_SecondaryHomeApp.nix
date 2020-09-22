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
SecondaryHomeApp = android_app {
    name = "SecondaryHomeApp";

    srcs = [
        "src/com/android/car/secondaryhome/launcher/AppEntry.java"
        "src/com/android/car/secondaryhome/launcher/AppFragment.java"
        "src/com/android/car/secondaryhome/launcher/AppListAdapter.java"
        "src/com/android/car/secondaryhome/launcher/AppListLiveData.java"
        "src/com/android/car/secondaryhome/launcher/AppListViewModel.java"
        "src/com/android/car/secondaryhome/launcher/AppPickedCallback.java"
        "src/com/android/car/secondaryhome/launcher/HomeFragment.java"
        "src/com/android/car/secondaryhome/launcher/LauncherActivity.java"
        "src/com/android/car/secondaryhome/launcher/NotificationFragment.java"
        "src/com/android/car/secondaryhome/launcher/NotificationListener.java"
        "src/com/android/car/secondaryhome/launcher/NotificationViewController.java"
        "src/com/android/car/secondaryhome/launcher/PackageIntentReceiver.java"

    ];

    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.lifecycle_lifecycle-extensions"
        "com.google.android.material_material"
        "CarNotificationLib"
    ];

    libs = [
        "android.car"
    ];

    manifest = "AndroidManifest.xml";

    platform_apis = true;
    certificate = "platform";
    privileged = true;
    required = ["privapp_whitelist_com.android.car.secondaryhome"];

    resource_dirs = [
        "res"
    ];
};

in { inherit SecondaryHomeApp; }
