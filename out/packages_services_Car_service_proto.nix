{ java_library_static }:
let

blestream-protos = java_library_static {
    name = "blestream-protos";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = [
        "ble_device_message.proto"
        "ble_message.proto"
        "ble_packet.proto"
        "ble_version_exchange.proto"
        "operation_type.proto"
        "phone_auth.proto"
    ];
    jarjar_rules = "jarjar-rules.txt";
    sdk_version = "28";
};

in { inherit blestream-protos; }
