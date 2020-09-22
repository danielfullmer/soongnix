{ java_library_static }:
let

game-driver-protos = java_library_static {
    name = "game-driver-protos";
    host_supported = true;
    proto = {
        type = "lite";
    };
    srcs = ["game_driver.proto"];
    jarjar_rules = "jarjar-rules.txt";
    sdk_version = "28";
};

in { inherit game-driver-protos; }
