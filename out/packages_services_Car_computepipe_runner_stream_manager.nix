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

computepipe_stream_manager = cc_library {
    name = "computepipe_stream_manager";
    srcs = [
        "Factory.cpp"
        "PixelStreamManager.cpp"
        "SemanticManager.cpp"
    ];
    export_include_dirs = ["include"];
    visibility = [
        "//packages/services/Car/computepipe/runner:__subpackages__"
        "//packages/services/Car/computepipe/tests:__subpackages__"
    ];
    header_libs = [
        "computepipe_runner_includes"
    ];
    static_libs = [
        "libcomputepipeprotos"
    ];
    shared_libs = [
        "libbase"
        "computepipe_runner_component"
        "libbase"
        "libnativewindow"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
    ];
};

mock_stream_engine_interface = cc_library {
    name = "mock_stream_engine_interface";
    srcs = [
        "MockEngine.cpp"
    ];
    visibility = [
        "//packages/services/Car/computepipe/runner:__subpackages__"
        "//packages/services/Car/computepipe/tests:__subpackages__"
    ];
    header_libs = [
        "computepipe_runner_includes"
    ];
    static_libs = [
        "libbase"
        "libgtest"
        "libgmock"
        "libcomputepipeprotos"
    ];
    shared_libs = [
        "computepipe_runner_component"
        "computepipe_stream_manager"
        "libnativewindow"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
    ];
};

in { inherit computepipe_stream_manager mock_stream_engine_interface; }
