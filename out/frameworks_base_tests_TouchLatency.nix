{ android_test }:
let

TouchLatency = android_test {
    name = "TouchLatency";
    manifest = "app/src/main/AndroidManifest.xml";
    #  omit gradle 'build' dir
    srcs = ["app/src/main/java/com/prefabulated/touchlatency/TouchLatencyActivity.java"];
    resource_dirs = ["app/src/main/res"];
    aaptflags = ["--auto-add-overlay"];
    sdk_version = "current";
    test_suites = ["device-tests"];
};

in { inherit TouchLatency; }
