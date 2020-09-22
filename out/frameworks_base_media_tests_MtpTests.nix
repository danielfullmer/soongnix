{ android_test }:
let

MtpTests = android_test {
    name = "MtpTests";
    srcs = [
        "src/android/mtp/MtpDatabaseTest.java"
        "src/android/mtp/MtpStorageManagerTest.java"
    ];
    static_libs = ["androidx.test.rules"];
    platform_apis = true;
};

in { inherit MtpTests; }
