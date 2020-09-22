{ android_test }:
let

BrokenKeyDerivationTests = android_test {
    name = "BrokenKeyDerivationTests";
    srcs = ["src/com/example/android/brokenkeyderivation/BrokenKeyDerivationTest.java"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = ["junit"];
    instrumentation_for = "BrokenKeyDerivation";
    sdk_version = "current";
};

in { inherit BrokenKeyDerivationTests; }
