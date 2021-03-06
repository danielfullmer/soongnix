{ android_test }:
let

FrameworksSaxTests = android_test {
    name = "FrameworksSaxTests";
    #  Include all test java files.
    srcs = ["src/android/sax/SafeSaxTest.java"];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    static_libs = ["junit"];
    platform_apis = true;
};

in { inherit FrameworksSaxTests; }
