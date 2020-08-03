{ android_library }:
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

live-tv-tuner = android_library {
    name = "live-tv-tuner";
    srcs = ["src/**/*.java"];
    sdk_version = "system_current";
    resource_dirs = ["res"];
    libs = [
        "tv-auto-value-jar"
        "tv-auto-factory-jar"
        "android-support-annotations"
        "tv-error-prone-annotations-jar"
        "tv-guava-android-jar"
        "tv-javax-annotations-jar"
        "jsr330"
        "tv-lib-dagger"
        "tv-lib-exoplayer"
        "tv-lib-exoplayer-v2-core"
        "live-tv-tuner-proto"
        "android-support-compat"
        "android-support-core-ui"
        "android-support-v7-palette"
        "android-support-v7-recyclerview"
        "android-support-v17-leanback"
        "androidx.tvprovider_tvprovider"
        "tv-lib-dagger-android"
        "tv-common"
    ];
    plugins = [
        "tv-auto-value"
        "tv-auto-factory"
    ];
    min_sdk_version = "23";
};

in { inherit live-tv-tuner; }
