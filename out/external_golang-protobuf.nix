{ blueprint_go_binary, bootstrap_go_package }:
let

#  Copyright 2017 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

protoc-gen-go_descriptor = bootstrap_go_package {
    name = "protoc-gen-go_descriptor";
    pkgPath = "github.com/golang/protobuf/protoc-gen-go/descriptor";
    deps = ["golang-protobuf-proto"];
    srcs = ["protoc-gen-go/descriptor/descriptor.pb.go"];
};

protoc-gen-go_plugin = bootstrap_go_package {
    name = "protoc-gen-go_plugin";
    pkgPath = "github.com/golang/protobuf/protoc-gen-go/plugin";
    deps = [
        "golang-protobuf-proto"
        "protoc-gen-go_descriptor"
    ];
    srcs = ["protoc-gen-go/plugin/plugin.pb.go"];
};

protoc-gen-go_generator_internal_remap = bootstrap_go_package {
    name = "protoc-gen-go_generator_internal_remap";
    pkgPath = "github.com/golang/protobuf/protoc-gen-go/generator/internal/remap";
    srcs = ["protoc-gen-go/generator/internal/remap/remap.go"];
    testSrcs = ["protoc-gen-go/generator/internal/remap/remap_test.go"];
};

protoc-gen-go_generator = bootstrap_go_package {
    name = "protoc-gen-go_generator";
    pkgPath = "github.com/golang/protobuf/protoc-gen-go/generator";
    deps = [
        "golang-protobuf-proto"
        "protoc-gen-go_descriptor"
        "protoc-gen-go_plugin"
        "protoc-gen-go_generator_internal_remap"
    ];
    srcs = ["protoc-gen-go/generator/generator.go"];
    testSrcs = ["protoc-gen-go/generator/name_test.go"];
};

protoc-gen-go_grpc = bootstrap_go_package {
    name = "protoc-gen-go_grpc";
    pkgPath = "github.com/golang/protobuf/protoc-gen-go/grpc";
    deps = [
        "protoc-gen-go_descriptor"
        "protoc-gen-go_generator"
    ];
    srcs = ["protoc-gen-go/grpc/grpc.go"];
};

protoc-gen-go = blueprint_go_binary {
    name = "protoc-gen-go";
    deps = [
        "golang-protobuf-proto"
        "protoc-gen-go_generator"
        "protoc-gen-go_grpc"
    ];
    srcs = [
        "protoc-gen-go/main.go"
        "protoc-gen-go/link_grpc.go"
    ];
};

golang-protobuf-proto = bootstrap_go_package {
    name = "golang-protobuf-proto";
    pkgPath = "github.com/golang/protobuf/proto";
    srcs = [
        "proto/clone.go"
        "proto/decode.go"
        "proto/discard.go"
        "proto/encode.go"
        "proto/equal.go"
        "proto/extensions.go"
        "proto/lib.go"
        "proto/message_set.go"
        "proto/table_marshal.go"
        "proto/table_merge.go"
        "proto/table_unmarshal.go"
        "proto/pointer_unsafe.go"
        "proto/properties.go"
        "proto/text.go"
        "proto/text_parser.go"
    ];
};

golang-protobuf-proto-proto3_proto = bootstrap_go_package {
    name = "golang-protobuf-proto-proto3_proto";
    pkgPath = "github.com/golang/protobuf/proto/proto3_proto";
    deps = [
        "golang-protobuf-proto"
        "golang-protobuf-proto-test-proto"
        "golang-protobuf-ptypes-any"
    ];
    srcs = ["proto/proto3_proto/proto3.pb.go"];
};

#  These won't run by default (they also print output, which we don't want), but
#  can be run with:
#   m out/soong/.bootstrap/golang-protobuf-proto_test/test/test.passed
golang-protobuf-proto_test = bootstrap_go_package {
    name = "golang-protobuf-proto_test";
    pkgPath = "github.com/golang/protobuf/proto_test";
    deps = [
        "golang-protobuf-proto"
        "golang-protobuf-proto-proto3_proto"
        "golang-protobuf-proto-test-proto"
        "golang-protobuf-ptypes"
    ];
    testSrcs = [
        "proto/all_test.go"
        "proto/any_test.go"
        "proto/clone_test.go"
        "proto/decode_test.go"
        "proto/encode_test.go"
        "proto/equal_test.go"
        #  Requires golang.org/x/sync/errgroup
        # "proto/extensions_test.go",
        "proto/map_test.go"
        "proto/message_set_test.go"
        "proto/proto3_test.go"
        "proto/size_test.go"
        "proto/size2_test.go"
        "proto/text_parser_test.go"
        "proto/text_test.go"
    ];
};

golang-protobuf-proto-test-proto = bootstrap_go_package {
    name = "golang-protobuf-proto-test-proto";
    pkgPath = "github.com/golang/protobuf/proto/test_proto";
    deps = ["golang-protobuf-proto"];
    srcs = ["proto/test_proto/test.pb.go"];
};

golang-protobuf-ptypes = bootstrap_go_package {
    name = "golang-protobuf-ptypes";
    pkgPath = "github.com/golang/protobuf/ptypes";
    deps = [
        "golang-protobuf-proto"
        "golang-protobuf-ptypes-any"
        "golang-protobuf-ptypes-duration"
        "golang-protobuf-ptypes-timestamp"
        "protoc-gen-go_descriptor"
    ];
    srcs = [
        "ptypes/any.go"
        "ptypes/doc.go"
        "ptypes/duration.go"
        "ptypes/timestamp.go"
    ];
    testSrcs = [
        "ptypes/any_test.go"
        "ptypes/duration_test.go"
        "ptypes/timestamp_test.go"
    ];
};

golang-protobuf-ptypes-any = bootstrap_go_package {
    name = "golang-protobuf-ptypes-any";
    pkgPath = "github.com/golang/protobuf/ptypes/any";
    deps = ["golang-protobuf-proto"];
    srcs = ["ptypes/any/any.pb.go"];
};

golang-protobuf-ptypes-duration = bootstrap_go_package {
    name = "golang-protobuf-ptypes-duration";
    pkgPath = "github.com/golang/protobuf/ptypes/duration";
    deps = ["golang-protobuf-proto"];
    srcs = ["ptypes/duration/duration.pb.go"];
};

golang-protobuf-ptypes-empty = bootstrap_go_package {
    name = "golang-protobuf-ptypes-empty";
    pkgPath = "github.com/golang/protobuf/ptypes/empty";
    deps = ["golang-protobuf-proto"];
    srcs = ["ptypes/empty/empty.pb.go"];
};

golang-protobuf-ptypes-struct = bootstrap_go_package {
    name = "golang-protobuf-ptypes-struct";
    pkgPath = "github.com/golang/protobuf/ptypes/struct";
    deps = ["golang-protobuf-proto"];
    srcs = ["ptypes/struct/struct.pb.go"];
};

golang-protobuf-ptypes-timestamp = bootstrap_go_package {
    name = "golang-protobuf-ptypes-timestamp";
    pkgPath = "github.com/golang/protobuf/ptypes/timestamp";
    deps = ["golang-protobuf-proto"];
    srcs = ["ptypes/timestamp/timestamp.pb.go"];
};

golang-protobuf-ptypes-wrappers = bootstrap_go_package {
    name = "golang-protobuf-ptypes-wrappers";
    pkgPath = "github.com/golang/protobuf/ptypes/wrappers";
    deps = ["golang-protobuf-proto"];
    srcs = ["ptypes/wrappers/wrappers.pb.go"];
};

in { inherit golang-protobuf-proto golang-protobuf-proto-proto3_proto golang-protobuf-proto-test-proto golang-protobuf-proto_test golang-protobuf-ptypes golang-protobuf-ptypes-any golang-protobuf-ptypes-duration golang-protobuf-ptypes-empty golang-protobuf-ptypes-struct golang-protobuf-ptypes-timestamp golang-protobuf-ptypes-wrappers protoc-gen-go protoc-gen-go_descriptor protoc-gen-go_generator protoc-gen-go_generator_internal_remap protoc-gen-go_grpc protoc-gen-go_plugin; }
