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

SystemUpdater = android_app {
    name = "SystemUpdater";
    srcs = [
        "src/com/android/car/systemupdater/DeviceListFragment.java"
        "src/com/android/car/systemupdater/SystemUpdaterActivity.java"
        "src/com/android/car/systemupdater/UpFragment.java"
        "src/com/android/car/systemupdater/UpdateLayoutFragment.java"
        "src/com/android/car/systemupdater/UpdateParser.java"
    ];
    resource_dirs = ["res"];
    certificate = "platform";
    platform_apis = true;
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    dxflags = ["--multi-dex"];
    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx.legacy_legacy-support-v4"
        "car-ui-lib"
    ];
};

in { inherit SystemUpdater; }