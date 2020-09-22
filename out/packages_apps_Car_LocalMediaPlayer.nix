{ android_app, java_library }:
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

#  Proto dependencies
LocalMediaPlayer-proto = java_library {
    name = "LocalMediaPlayer-proto";
    srcs = ["proto/proto.proto"];
    proto = {
        type = "nano";
        local_include_dirs = ["proto"];
    };
    product_variables = {
        pdk = {
            enabled = false;
        };
    };
};

#  Actual Package

LocalMediaPlayer = android_app {
    name = "LocalMediaPlayer";
    srcs = [
        "src/com/android/car/media/localmediaplayer/DataModel.java"
        "src/com/android/car/media/localmediaplayer/LocalMediaBrowserService.java"
        "src/com/android/car/media/localmediaplayer/PermissionsActivity.java"
        "src/com/android/car/media/localmediaplayer/Player.java"
        "src/com/android/car/media/localmediaplayer/Utils.java"
    ];
    resource_dirs = ["res"];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
    static_libs = [
        "LocalMediaPlayer-proto"
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

in { inherit LocalMediaPlayer LocalMediaPlayer-proto; }
