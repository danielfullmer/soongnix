{ cc_library, genrule }:
let

computepipe_grpc_graph_proto_h = genrule {
    name = "computepipe_grpc_graph_proto_h";
    tools = [
        "aprotoc"
        "protoc-gen-grpc-cpp-plugin"
    ];
    cmd = "$(location aprotoc) -I$$(dirname $(in)) -Iexternal/protobuf/src --plugin=protoc-gen-grpc=$(location protoc-gen-grpc-cpp-plugin) $(in) --grpc_out=$(genDir) --cpp_out=$(genDir)";
    srcs = [
        "GrpcPrebuiltGraphService.proto"
    ];
    out = [
        "GrpcPrebuiltGraphService.grpc.pb.h"
        "GrpcPrebuiltGraphService.pb.h"
    ];
};

computepipe_grpc_graph_proto_cc = genrule {
    name = "computepipe_grpc_graph_proto_cc";
    tools = [
        "aprotoc"
        "protoc-gen-grpc-cpp-plugin"
    ];
    cmd = "$(location aprotoc) -I$$(dirname $(in)) -Iexternal/protobuf/src --plugin=protoc-gen-grpc=$(location protoc-gen-grpc-cpp-plugin) $(in) --grpc_out=$(genDir) --cpp_out=$(genDir)";
    srcs = [
        "GrpcPrebuiltGraphService.proto"
    ];
    out = [
        "GrpcPrebuiltGraphService.grpc.pb.cc"
        "GrpcPrebuiltGraphService.pb.cc"
    ];
};

computepipe_grpc_graph_proto = cc_library {
    name = "computepipe_grpc_graph_proto";
    proto = {
        type = "lite";
        export_proto_headers = true;
    };
    include_dirs = [
        "external/protobuf/src"
    ];
    generated_headers = [
        "computepipe_grpc_graph_proto_h"
    ];
    export_generated_headers = [
        "computepipe_grpc_graph_proto_h"
    ];
    generated_sources = [
        "computepipe_grpc_graph_proto_cc"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    host_supported = false;
    vendor_available = true;
    target = {
        android = {
            proto = {
                type = "lite";
            };
            shared_libs = [
                "libprotobuf-cpp-full"
                "libgrpc++"
            ];
        };
    };
};

in { inherit computepipe_grpc_graph_proto computepipe_grpc_graph_proto_cc computepipe_grpc_graph_proto_h; }
