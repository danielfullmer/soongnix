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

connected-device-lib = android_library {
    name = "connected-device-lib";

    srcs = ["src/**/*.java"];

    manifest = "AndroidManifest.xml";

    resource_dirs = ["res"];

    optimize = {
        enabled = false;
    };

    libs = ["android.car"];

    static_libs = [
        "EncryptionRunner-lib"
        "androidx.room_room-runtime"
        "connected-device-protos"
    ];

    plugins = [
        "car-androidx-room-compiler"
    ];

    platform_apis = true;
};

in { inherit connected-device-lib; }
