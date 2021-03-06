{ java_library_static }:
let

framework-protos = java_library_static {
    name = "framework-protos";
    host_supported = true;
    proto = {
        type = "nano";
    };
    srcs = [
        "src/gnss.proto"
        "src/ipconnectivity.proto"
        "src/system_messages.proto"
        "src/task_snapshot.proto"
        "src/wifi.proto"
        "src/metrics_constants/metrics_constants.proto"
    ];
    no_framework_libs = true;
    sdk_version = "9";
    #  Pin java_version until jarjar is certified to support later versions. http://b/72703434
    java_version = "1.8";
    target = {
        android = {
            jarjar_rules = "jarjar-rules.txt";
        };
        host = {
            static_libs = ["libprotobuf-java-nano"];
        };
    };
};

metrics-constants-protos = java_library_static {
    name = "metrics-constants-protos";
    host_supported = true;
    proto = {
        type = "nano";
    };
    srcs = ["src/metrics_constants/metrics_constants.proto"];
    no_framework_libs = true;
    sdk_version = "system_current";
};

in { inherit framework-protos metrics-constants-protos; }
