{ java_genrule, java_library }:
let

hidl_partial_java_test_gen = java_genrule {
    name = "hidl_partial_java_test_gen";
    tools = [
        "hidl-gen"
    ];
    srcs = [
        "1.0/types.hal"
    ];
    cmd = "$(location hidl-gen) -o $(genDir) -Ljava " +
        "-r hidl_java_partial_test:system/tools/hidl/test/java_partial_test " +
        "hidl_java_partial_test@1.0 && " +
        "[ \"$(genDir)/hidl_java_partial_test/V1_0/ExistsInJava.java\" == " +
        "\"$$(find $(genDir) -type f)\" ]";
    out = [
        "hidl_java_partial_test/V1_0/ExistsInJava.java"
    ];
};

hidl_partial_java_test = java_library {
    name = "hidl_partial_java_test";
    srcs = [
        ":hidl_partial_java_test_gen"
    ];
};

in { inherit hidl_partial_java_test hidl_partial_java_test_gen; }
