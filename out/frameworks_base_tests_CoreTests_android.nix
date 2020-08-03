{ android_test }:
let

LegacyCoreTests = android_test {
    name = "LegacyCoreTests";
    srcs = ["**/*.java"];
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    sdk_version = "current";
    static_libs = ["junit"];
};

in { inherit LegacyCoreTests; }
