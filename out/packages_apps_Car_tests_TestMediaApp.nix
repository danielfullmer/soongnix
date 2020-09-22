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

#  Actual Package:

TestMediaApp = android_app {
    name = "TestMediaApp";

    srcs = [
        "src/com/android/car/media/testmediaapp/MediaKeys.java"
        "src/com/android/car/media/testmediaapp/TmaBrowser.java"
        "src/com/android/car/media/testmediaapp/TmaBrowser2.java"
        "src/com/android/car/media/testmediaapp/TmaForegroundService.java"
        "src/com/android/car/media/testmediaapp/TmaLibrary.java"
        "src/com/android/car/media/testmediaapp/TmaMediaEvent.java"
        "src/com/android/car/media/testmediaapp/TmaMediaItem.java"
        "src/com/android/car/media/testmediaapp/TmaPlayer.java"
        "src/com/android/car/media/testmediaapp/TmaPublicProvider.java"
        "src/com/android/car/media/testmediaapp/loader/TmaLoader.java"
        "src/com/android/car/media/testmediaapp/loader/TmaLoaderUtils.java"
        "src/com/android/car/media/testmediaapp/loader/TmaMediaEventReader.java"
        "src/com/android/car/media/testmediaapp/loader/TmaMediaItemReader.java"
        "src/com/android/car/media/testmediaapp/loader/TmaMediaMetadataReader.java"
        "src/com/android/car/media/testmediaapp/phone/TmaLauncherActivity.java"
        "src/com/android/car/media/testmediaapp/prefs/TmaEnumPrefs.java"
        "src/com/android/car/media/testmediaapp/prefs/TmaPrefs.java"
        "src/com/android/car/media/testmediaapp/prefs/TmaPrefsActivity.java"
        "src/com/android/car/media/testmediaapp/prefs/TmaPrefsFragment.java"
    ];

    resource_dirs = ["res"];

    sdk_version = "system_current";

    certificate = "platform";

    #  Do NOT add dependencies preventing the app from being unbundled (compiled with gradle in Studio).
    static_libs = [
        "androidx.appcompat_appcompat"
        "androidx-constraintlayout_constraintlayout"
        "androidx.preference_preference"
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
};

in { inherit TestMediaApp; }
