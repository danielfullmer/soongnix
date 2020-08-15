{ java_library }:
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

live-tv-tuner-proto = java_library {
    name = "live-tv-tuner-proto";
    srcs = [
        "channel.proto"
        "track.proto"
    ];
    sdk_version = "system_current";
    proto = {
        type = "nano";
        output_params = ["enum_style=java"];
        canonical_path_from_root = false;
    };
    min_sdk_version = "23";
};

in { inherit live-tv-tuner-proto; }
