{ android_test }:
let

FrameworksCoreSystemPropertiesTests = android_test {
    name = "FrameworksCoreSystemPropertiesTests";
    #  Include all test java files.
    srcs = [
        "src/android/os/PropertyInvalidatedCacheTest.java"
        "src/android/os/SystemPropertiesTest.java"
    ];
    dxflags = ["--core-library"];
    static_libs = [
        "android-common"
        "frameworks-core-util-lib"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    platform_apis = true;
    certificate = "platform";
};

in { inherit FrameworksCoreSystemPropertiesTests; }
