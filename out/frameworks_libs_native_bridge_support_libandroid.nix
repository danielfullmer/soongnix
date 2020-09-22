{ cc_library }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

libnative_bridge_guest_libandroid = cc_library {
    defaults = ["native_bridge_stub_library_defaults"];
    name = "libnative_bridge_guest_libandroid";
    overrides = ["libandroid"];
    stem = "libandroid";
    arch = {
        arm = {
            srcs = ["stubs_arm.cc"];
        };
        arm64 = {
            srcs = ["stubs_arm64.cc"];
        };
    };
    shared_libs = [
        "libnative_bridge_guest_libandroid_runtime"
        #  libbinder.so — greylisted, not included.
        "libcutils"
        #  libgui.so — greylisted, not included.
        "liblog"
        #  libui.so — greylisted, not included.
        "libutils"
    ];
};

in { inherit libnative_bridge_guest_libandroid; }