{ android_test }:
let

LunarLanderTests = android_test {
    name = "LunarLanderTests";
    srcs = ["src/com/example/android/lunarlander/LunarLanderTest.java"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = ["junit"];
    instrumentation_for = "LunarLander";
    sdk_version = "current";
};

in { inherit LunarLanderTests; }
