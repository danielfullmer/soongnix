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

sampletunertvinput = android_app {
    name = "sampletunertvinput";
    srcs = [
        "src/com/android/tv/samples/sampletunertvinput/SampleTunerTvInputService.java"
        "src/com/android/tv/samples/sampletunertvinput/SampleTunerTvInputSetupActivity.java"
    ];

    optimize = {
        enabled = false;
    };

    platform_apis = true;
    system_ext_specific = true;

    privileged = true;
    certificate = "platform";
    #  product_specific: true,
    #  sdk_version: "system_current",
    resource_dirs = ["res"];
    static_libs = [
        "android-support-annotations"
        "android-support-compat"
        "android-support-core-ui"
        "android-support-v7-palette"
        "android-support-v7-recyclerview"
        "androidx.leanback_leanback"
        "androidx.tvprovider_tvprovider"
        "jsr330"
        "live-tv-tuner-proto"
        "tv-auto-value-jar"
        "tv-auto-factory-jar"
        "tv-common"
        "tv-error-prone-annotations-jar"
        "tv-guava-android-jar"
        "tv-javax-annotations-jar"
        "tv-lib-dagger"
        "tv-lib-exoplayer"
        "tv-lib-exoplayer-v2-core"
        "tv-lib-dagger-android"
        "tv-test-common"
    ];
    aaptflags = ["-0 .ts"];
    plugins = [
        "tv-auto-value"
        "tv-auto-factory"
    ];
    #  min_sdk_version: "29",
};

in { inherit sampletunertvinput; }
