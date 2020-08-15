{ java_library_static }:
let

"services.coverage" = java_library_static {
    name = "services.coverage";
    srcs = ["java/com/android/server/coverage/CoverageService.java"];
    libs = ["jacocoagent"];
};

in { inherit "services.coverage"; }
