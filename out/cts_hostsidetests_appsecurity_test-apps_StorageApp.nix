{ java_library }:
let

CtsStorageAppLib = java_library {
    name = "CtsStorageAppLib";
    srcs = ["src/**/*.java"];
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    libs = [
        "android.test.base.stubs"
        "ub-uiautomator"
    ];
};

in { inherit CtsStorageAppLib; }
