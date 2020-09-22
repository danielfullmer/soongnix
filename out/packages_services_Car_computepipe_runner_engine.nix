{ cc_library }:
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

computepipe_runner_engine = cc_library {
    name = "computepipe_runner_engine";
    srcs = [
        "ConfigBuilder.cpp"
        "DefaultEngine.cpp"
        "Factory.cpp"
    ];
    export_include_dirs = ["include"];
    header_libs = [
        "computepipe_runner_includes"
    ];
    static_libs = [
        "libcomputepipeprotos"
        "computepipe_runner_component"
        "computepipe_input_manager"
        "computepipe_stream_manager"
    ];
    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "computepipe_client_interface"
        "computepipe_prebuilt_graph"
        "computepipe_runner_display"
        "libbase"
        "libcutils"
        "libdl"
        "libevssupport"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libnativewindow"
        "libpng"
        "libprotobuf-cpp-lite"
        "libui"
        "libutils"
        "libEGL"
        "libGLESv2"
    ];
    cflags = [
        "-D_LIBCPP_ENABLE_THREAD_SAFETY_ANNOTATIONS"
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
        "-Wthread-safety"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
    ];
};

in { inherit computepipe_runner_engine; }
