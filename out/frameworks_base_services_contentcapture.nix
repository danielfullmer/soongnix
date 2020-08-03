{ java_library_static }:
let

"services.contentcapture" = java_library_static {
    name = "services.contentcapture";
    srcs = ["java/**/*.java"];
    libs = ["services.core"];
};

in { inherit "services.contentcapture"; }
