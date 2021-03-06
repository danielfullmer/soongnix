{ android_test }:
let

PermissionTestAppMV1 = android_test {
    name = "PermissionTestAppMV1";

    #  omit gradle 'build' dir
    srcs = ["src/com/android/permissontestappmv1/MainActivity.java"];

    static_libs = ["androidx.legacy_legacy-support-v4"];
    resource_dirs = ["res"];
    sdk_version = "current";
    certificate = "platform";

    test_suites = ["device-tests"];
};

in { inherit PermissionTestAppMV1; }
