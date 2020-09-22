{ android_app }:
let

bttraffic = android_app {
    name = "bttraffic";
    srcs = ["src/com/android/google/experimental/bttraffic/BTtraffic.java"];
    resource_dirs = ["res"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit bttraffic; }
