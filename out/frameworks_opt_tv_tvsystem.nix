{ java_sdk_library }:
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

"com.android.libraries.tv.tvsystem" = java_sdk_library {
    name = "com.android.libraries.tv.tvsystem";
    srcs = [
        "java/com/android/libraries/tv/tvsystem/display/DeviceProductInfo.java"
        "java/com/android/libraries/tv/tvsystem/display/DisplayCompatUtil.java"
        "java/com/android/libraries/tv/tvsystem/display/WindowCompatUtil.java"
        "java/com/android/libraries/tv/tvsystem/pm/TvPackageInstaller.java"
        "java/com/android/libraries/tv/tvsystem/user/ITvUserManager.java"
        "java/com/android/libraries/tv/tvsystem/user/TvUserManager.java"
        "java/com/android/libraries/tv/tvsystem/wifi/SoftApConfiguration.java"
        "java/com/android/libraries/tv/tvsystem/wifi/TvWifiManager.java"
    ];
    api_packages = [
        "com.android.libraries.tv.tvsystem"
        "com.android.libraries.tv.tvsystem.display"
        "com.android.libraries.tv.tvsystem.pm"
        "com.android.libraries.tv.tvsystem.user"
        "com.android.libraries.tv.tvsystem.wifi"
    ];
    dex_preopt = {
        enabled = false;
    };
};

in { inherit "com.android.libraries.tv.tvsystem"; }
