{ java_library_static }:
let

settings-contextual-card-protos-lite = java_library_static {
    name = "settings-contextual-card-protos-lite";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = ["contextual_card_list.proto"];
};

settings-log-bridge-protos-lite = java_library_static {
    name = "settings-log-bridge-protos-lite";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = ["settings_log_bridge.proto"];
};

in { inherit settings-contextual-card-protos-lite settings-log-bridge-protos-lite; }
