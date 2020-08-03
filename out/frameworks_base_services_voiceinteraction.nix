{ java_library_static }:
let

"services.voiceinteraction" = java_library_static {
    name = "services.voiceinteraction";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.voiceinteraction"; }
