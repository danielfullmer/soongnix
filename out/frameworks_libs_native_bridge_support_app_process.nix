{ cc_binary }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

native_bridge_guest_app_process = cc_binary {
    defaults = ["native_bridge_stub_library_defaults"];
    name = "native_bridge_guest_app_process";
    overrides = ["app_process"];
    stem = "app_process";

    srcs = [
        "app_process.cc"
    ];

    multilib = {
        lib64 = {
            suffix = "64";
        };
    };
};

in { inherit native_bridge_guest_app_process; }
