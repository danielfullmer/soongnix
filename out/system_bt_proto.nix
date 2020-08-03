{ cc_library_static, java_library_static }:
let

bluetooth-protos-lite = java_library_static {
    name = "bluetooth-protos-lite";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = ["bluetooth/metrics/bluetooth.proto"];
};

libbt-protos-lite = cc_library_static {
    name = "libbt-protos-lite";
    host_supported = true;
    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    srcs = ["bluetooth/metrics/bluetooth.proto"];
};

in { inherit bluetooth-protos-lite libbt-protos-lite; }
