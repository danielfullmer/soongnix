{ java_library_host, java_test_host }:
let

powermodel = java_library_host {
    name = "powermodel";
    srcs = [
        "src/**/*.java"
    ];
    static_libs = [
        "guava"
    ];
};

powermodel-test = java_test_host {
    name = "powermodel-test";

    test_suites = ["general-tests"];

    srcs = ["test/**/*.java"];
    java_resource_dirs = ["test-resource"];

    static_libs = [
        "powermodel"
        "junit"
        "mockito"
    ];
};

in { inherit powermodel powermodel-test; }
