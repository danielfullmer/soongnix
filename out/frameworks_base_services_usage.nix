{ java_library_static }:
let

"services.usage" = java_library_static {
    name = "services.usage";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.usage"; }
