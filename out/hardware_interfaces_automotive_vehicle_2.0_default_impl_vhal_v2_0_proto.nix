{ cc_library_static, filegroup, genrule }:
let

#  Copyright (C) 2017 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

#  Vehicle HAL Protobuf library
"android.hardware.automotive.vehicle@2.0-libproto-native" = cc_library_static {
    name = "android.hardware.automotive.vehicle@2.0-libproto-native";
    vendor = true;
    host_supported = true;
    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    strip = {
        keep_symbols = true;
    };
    cflags = [
        "-Wall"
        "-Werror"
    ];
    srcs = ["VehicleHalProto.proto"];
};

vhal-proto-src = filegroup {
    name = "vhal-proto-src";
    visibility = [
        "//device/google/trout/hal/vehicle/2.0:__subpackages__"
    ];
    srcs = [
        "VehicleHalProto.proto"
    ];
};

DefaultVehicleHalProtoStub_h = genrule {
    name = "DefaultVehicleHalProtoStub_h";
    tools = [
        "aprotoc"
        "protoc-gen-grpc-cpp-plugin"
    ];
    cmd = "$(location aprotoc) -I$$(dirname $(in)) -Iexternal/protobuf/src --plugin=protoc-gen-grpc=$(location protoc-gen-grpc-cpp-plugin) $(in) --grpc_out=$(genDir) --cpp_out=$(genDir)";
    srcs = [
        "VehicleHalProto.proto"
    ];
    out = [
        "VehicleHalProto.pb.h"
        "VehicleHalProto.grpc.pb.h"
    ];
};

DefaultVehicleHalProtoStub_cc = genrule {
    name = "DefaultVehicleHalProtoStub_cc";
    tools = [
        "aprotoc"
        "protoc-gen-grpc-cpp-plugin"
    ];
    cmd = "$(location aprotoc) -I$$(dirname $(in)) -Iexternal/protobuf/src --plugin=protoc-gen-grpc=$(location protoc-gen-grpc-cpp-plugin) $(in) --grpc_out=$(genDir) --cpp_out=$(genDir)";
    srcs = [
        "VehicleHalProto.proto"
    ];
    out = [
        "VehicleHalProto.pb.cc"
        "VehicleHalProto.grpc.pb.cc"
    ];
};

in { inherit "android.hardware.automotive.vehicle@2.0-libproto-native" DefaultVehicleHalProtoStub_cc DefaultVehicleHalProtoStub_h vhal-proto-src; }
