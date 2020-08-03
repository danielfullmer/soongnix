{ android_test }:
let

MtpTests = android_test {
    name = "MtpTests";
    srcs = ["**/*.java"];
    static_libs = ["androidx.test.rules"];
    platform_apis = true;
};

in { inherit MtpTests; }
