{ java_library_static }:
let

"services.accessibility" = java_library_static {
    name = "services.accessibility";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.accessibility"; }
