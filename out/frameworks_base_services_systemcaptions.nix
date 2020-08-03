{ java_library_static }:
let

"services.systemcaptions" = java_library_static {
    name = "services.systemcaptions";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.systemcaptions"; }
