{ java_library }:
let

apct-perftests-utils = java_library {
    name = "apct-perftests-utils";
    static_libs = [
        "androidx.test.rules"
        "androidx.annotation_annotation"
    ];
    #  Build all java files in the java subdirectory
    srcs = ["**/*.java"];
};

in { inherit apct-perftests-utils; }
