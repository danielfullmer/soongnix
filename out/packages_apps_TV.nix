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

version_name = "1.20-asop";
version_code = "417000328";

LiveTv = android_app {
    name = "LiveTv";

    srcs = ["src/**/*.java"];

    #  TODO(b/122608868) turn proguard back on
    optimize = {
        enabled = false;
    };

    #  It is required for com.android.providers.tv.permission.ALL_EPG_DATA
    privileged = true;

    sdk_version = "system_current";
    min_sdk_version = "23"; #  M

    resource_dirs = [
        "res"
        "material_res"

    ];

    libs = ["tv-guava-android-jar"];

    static_libs = [
        "android-support-annotations"
        "android-support-compat"
        "android-support-core-ui"
        "androidx.tvprovider_tvprovider"
        "android-support-v4"
        "android-support-v7-appcompat"
        "android-support-v7-palette"
        "android-support-v7-preference"
        "android-support-v7-recyclerview"
        "android-support-v14-preference"
        "android-support-v17-leanback"
        "android-support-v17-preference-leanback"
        "jsr330"
        "live-channels-partner-support"
        "live-tv-tuner-proto"
        "live-tv-tuner"
        "tv-auto-value-jar"
        "tv-auto-factory-jar"
        "tv-common"
        "tv-error-prone-annotations-jar"
        "tv-lib-dagger"
        "tv-lib-exoplayer"
        "tv-lib-exoplayer-v2-core"
        "tv-lib-dagger-android"
    ];

    plugins = [
        "tv-auto-value"
        "tv-auto-factory"
        "tv-lib-dagger-android-processor"
        "tv-lib-dagger-compiler"
    ];

    javacflags = [
        "-Xlint:deprecation"
        "-Xlint:unchecked"
    ];

    aaptflags = [
        "--version-name"
        version_name

        "--version-code"
        version_code

        "--extra-packages"
        "com.android.tv.tuner"

        "--extra-packages"
        "com.android.tv.common"
    ];
};

in { inherit LiveTv; }
