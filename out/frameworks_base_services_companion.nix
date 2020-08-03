{ java_library_static }:
let

"services.companion" = java_library_static {
    name = "services.companion";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.companion"; }
