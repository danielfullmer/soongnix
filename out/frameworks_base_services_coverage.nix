{ java_library_static }:
let

"services.coverage" = java_library_static {
    name = "services.coverage";
    srcs = ["java/**/*.java"];
    libs = ["jacocoagent"];
};

in { inherit "services.coverage"; }
