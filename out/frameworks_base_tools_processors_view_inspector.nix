{ java_plugin, java_test_host }:
let

view-inspector-annotation-processor = java_plugin {
    name = "view-inspector-annotation-processor";

    processor_class = "android.processor.view.inspector.PlatformInspectableProcessor";

    srcs = ["src/java/**/*.java"];
    java_resource_dirs = ["src/resources"];

    static_libs = [
        "javapoet"
        "stub-annotations"
    ];

    use_tools_jar = true;
};

view-inspector-annotation-processor-test = java_test_host {
    name = "view-inspector-annotation-processor-test";

    srcs = ["test/java/**/*.java"];
    java_resource_dirs = ["test/resources"];

    static_libs = [
        "junit"
        "guava"
        "view-inspector-annotation-processor"
    ];

    test_suites = ["general-tests"];
};

in { inherit view-inspector-annotation-processor view-inspector-annotation-processor-test; }
