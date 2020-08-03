{ java_library_static }:
let

"services.print" = java_library_static {
    name = "services.print";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.print"; }
