{ android_test }:
let

DynamicSystemInstallationServiceTests = android_test {
    name = "DynamicSystemInstallationServiceTests";

    srcs = ["src/com/android/dynsystem/KeyRevocationListTest.java"];
    static_libs = [
        "androidx.test.runner"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
    ];

    resource_dirs = ["res"];
    platform_apis = true;
    instrumentation_for = "DynamicSystemInstallationService";
    certificate = "platform";
};

in { inherit DynamicSystemInstallationServiceTests; }
