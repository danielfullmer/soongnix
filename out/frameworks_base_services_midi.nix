{ java_library_static }:
let

"services.midi" = java_library_static {
    name = "services.midi";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.midi"; }
