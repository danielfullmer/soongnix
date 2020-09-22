{ android_app, android_test }:
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

WallpaperBackup = android_app {
    name = "WallpaperBackup";
    srcs = ["src/com/android/wallpaperbackup/WallpaperBackupAgent.java"];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    platform_apis = true;
    certificate = "platform";
    privileged = false;
};

WallpaperBackupAgentTests = android_test {
    name = "WallpaperBackupAgentTests";
    manifest = "test/AndroidManifest.xml";
    test_config = "test/AndroidTest.xml";
    srcs = [
        #  Include the app source code because the app runs as the system user on-device.
        "src/com/android/wallpaperbackup/WallpaperBackupAgent.java"
        "test/src/com/android/wallpaperbackup/WallpaperBackupAgentTest.java"
        "test/src/com/android/wallpaperbackup/utils/ContextWithServiceOverrides.java"
    ];
    libs = [
        "android.test.base"
        "android.test.runner"
    ];
    static_libs = [
        "androidx.test.core"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
    ];
    certificate = "platform";
    platform_apis = true;
    test_suites = ["device-tests"];
};

in { inherit WallpaperBackup WallpaperBackupAgentTests; }
