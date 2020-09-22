{ android_test }:
let

mediatunertest = android_test {
    name = "mediatunertest";

    srcs = ["src/com/android/mediatunertest/TunerTest.java"];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    static_libs = [
        "android-support-test"
        "testng"
    ];

    platform_apis = true;
    certificate = "platform";
};

in { inherit mediatunertest; }
