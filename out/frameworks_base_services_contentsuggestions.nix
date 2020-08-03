{ java_library_static }:
let

"services.contentsuggestions" = java_library_static {
    name = "services.contentsuggestions";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.contentsuggestions"; }
