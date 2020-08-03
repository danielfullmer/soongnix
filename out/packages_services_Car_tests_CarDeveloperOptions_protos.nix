{ java_library_static }:
let

carsettings-contextual-card-protos-lite = java_library_static {
    name = "carsettings-contextual-card-protos-lite";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = ["contextual_card_list.proto"];
};

carsettings-log-bridge-protos-lite = java_library_static {
    name = "carsettings-log-bridge-protos-lite";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = ["settings_log_bridge.proto"];
};

in { inherit carsettings-contextual-card-protos-lite carsettings-log-bridge-protos-lite; }
