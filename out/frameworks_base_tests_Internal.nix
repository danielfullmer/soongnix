{ android_test }:
let

InternalTests = android_test {
    name = "InternalTests";
    proto = {
        type = "nano";
    };
    #  Include some source files directly to be able to access package members
    srcs = ["src/**/*.java"];
    libs = ["android.test.runner"];
    static_libs = [
        "junit"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
    ];
    java_resource_dirs = ["res"];
    certificate = "platform";
    platform_apis = true;
    test_suites = ["device-tests"];
};

in { inherit InternalTests; }
