{ cc_library_static, java_library_static }:
let

mediaplayer2-protos = java_library_static {
    name = "mediaplayer2-protos";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = ["mediaplayer2.proto"];
    no_framework_libs = true;
    jarjar_rules = "jarjar-rules.txt";
    sdk_version = "28";
};

libmediaplayer2-protos = cc_library_static {
    name = "libmediaplayer2-protos";
    host_supported = true;
    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    srcs = ["mediaplayer2.proto"];
};

in { inherit libmediaplayer2-protos mediaplayer2-protos; }
