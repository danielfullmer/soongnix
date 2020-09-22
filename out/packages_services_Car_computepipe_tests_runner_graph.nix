{ cc_test }:
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

computepipe_prebuilt_graph_test = cc_test {
    name = "computepipe_prebuilt_graph_test";
    test_suites = ["device-tests"];
    srcs = [
        "EnumConversionTest.cpp"
        "LocalPrebuiltGraphTest.cpp"
    ];
    static_libs = [
        "computepipe_prebuilt_graph"
        "computepipe_runner_component"
        "libgtest"
        "libgmock"
        "libcomputepipeprotos"
    ];
    shared_libs = [
        "libstubgraphimpl"
        "libprotobuf-cpp-lite"
        "liblog"
        "libdl"
        "libbase"
    ];
    header_libs = [
        "computepipe_runner_includes"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
        "packages/services/Car/computepipe/runner/graph"
    ];
};

computepipe_grpc_graph_test = cc_test {
    name = "computepipe_grpc_graph_test";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];
    test_suites = ["device-tests"];
    srcs = [
        "GrpcGraphTest.cpp"
    ];
    static_libs = [
        "computepipe_grpc_graph_proto"
        "computepipe_runner_component"
        "libgtest"
        "libgmock"
    ];
    shared_libs = [
        "computepipe_grpc_graph"
        "libbase"
        "libcomputepipeprotos"
        "libgrpc++"
        "libdl"
        "liblog"
        "libprotobuf-cpp-full"
    ];
    header_libs = [
        "computepipe_runner_includes"
    ];
    include_dirs = [
        "packages/services/Car/computepipe"
        "packages/services/Car/computepipe/runner/graph"
    ];
};

in { inherit computepipe_grpc_graph_test computepipe_prebuilt_graph_test; }
