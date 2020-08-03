{ java_library_static }:
let

"services.backup" = java_library_static {
    name = "services.backup";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.backup"; }
