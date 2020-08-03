{ android_library }:
let

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

tv-common = android_library {
    name = "tv-common";
    srcs = [
        "src/**/*.java"
        "src/**/*.proto"
    ];

    sdk_version = "system_current";

    proto = {
        type = "lite";
    };

    resource_dirs = ["res"];

    libs = [
        "tv-auto-value-jar"
        "tv-auto-factory-jar"
        "android-support-annotations"
        "tv-error-prone-annotations-jar"
        "tv-guava-android-jar"
        "jsr330"
        "tv-lib-dagger"
        "tv-lib-exoplayer"
        "tv-lib-exoplayer-v2-core"
        "android-support-compat"
        "android-support-core-ui"
        "android-support-v7-recyclerview"
        "android-support-v17-leanback"
    ];

    static_libs = ["tv-lib-dagger-android"];

    plugins = [
        "tv-auto-value"
        "tv-auto-factory"
        "tv-lib-dagger-android-processor"
        "tv-lib-dagger-compiler"
    ];

    min_sdk_version = "23";

    #  TODO(b/77284273): generate build config after dagger supports libraries
    # include $(LOCAL_PATH)/buildconfig.mk

};

in { inherit tv-common; }
