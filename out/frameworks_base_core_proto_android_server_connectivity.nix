{ java_library_static }:
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

datastallprotosnano = java_library_static {
    name = "datastallprotosnano";
    proto = {
        type = "nano";
    };
    srcs = [
        "data_stall_event.proto"
    ];
    sdk_version = "system_current";
};

in { inherit datastallprotosnano; }
