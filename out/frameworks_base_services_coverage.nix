{ filegroup, java_library_static }:
let

"services.coverage-sources" = filegroup {
    name = "services.coverage-sources";
    srcs = ["java/com/android/server/coverage/CoverageService.java"];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.coverage" = java_library_static {
    name = "services.coverage";
    defaults = ["services_defaults"];
    srcs = [":services.coverage-sources"];
    libs = ["jacocoagent"];
};

in { inherit "services.coverage" "services.coverage-sources"; }
