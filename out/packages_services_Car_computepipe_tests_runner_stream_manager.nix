{ cc_test }:
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

computepipe_semantic_manager_test = cc_test {
    name = "computepipe_semantic_manager_test";
    test_suites = ["device-tests"];
    srcs = [
        "SemanticManagerTest.cpp"
    ];
    static_libs = [
        "computepipe_stream_manager"
        "computepipe_runner_component"
        "mock_stream_engine_interface"
        "libgtest"
        "libgmock"
        "libcomputepipeprotos"
    ];
    shared_libs = [
        "libbase"
        "liblog"
        "libnativewindow"
        "libprotobuf-cpp-lite"
    ];
    header_libs = [
        "computepipe_runner_includes"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
        "packages/services/Car/computepipe/runner/stream_manager"
    ];
};

computepipe_pixel_manager_test = cc_test {
    name = "computepipe_pixel_manager_test";
    test_suites = ["device-tests"];
    srcs = [
        "PixelStreamManagerTest.cpp"
    ];
    static_libs = [
        "computepipe_stream_manager"
        "computepipe_runner_component"
        "mock_stream_engine_interface"
        "libgtest"
        "libgmock"
        "libcomputepipeprotos"
    ];
    shared_libs = [
        "libbase"
        "liblog"
        "libnativewindow"
        "libprotobuf-cpp-lite"
    ];
    header_libs = [
        "computepipe_runner_includes"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
        "packages/services/Car/computepipe/runner/stream_manager"
    ];
};

in { inherit computepipe_pixel_manager_test computepipe_semantic_manager_test; }