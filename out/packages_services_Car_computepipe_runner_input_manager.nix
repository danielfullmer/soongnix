{ cc_library }:
let

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

computepipe_input_manager = cc_library {
    name = "computepipe_input_manager";
    srcs = [
        "Factory.cpp"
        "EvsInputManager.cpp"
    ];
    export_include_dirs = ["include"];
    header_libs = [
        "computepipe_runner_includes"
    ];
    static_libs = [
        "libcomputepipeprotos"
    ];
    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "computepipe_runner_component"
        "libbase"
        "libcutils"
        "libdl"
        "libevssupport"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libpng"
        "libprotobuf-cpp-lite"
        "libui"
        "libutils"
        "libEGL"
        "libGLESv2"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
        "packages/services/Car/evs/support_library"
    ];
};

in { inherit computepipe_input_manager; }
