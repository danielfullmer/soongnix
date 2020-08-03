{ cc_library_static }:
let

libtrace_proto = cc_library_static {
    name = "libtrace_proto";
    srcs = [
        "src/trace.proto"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    proto = {
        type = "lite";
        export_proto_headers = true;
    };
};

in { inherit libtrace_proto; }
