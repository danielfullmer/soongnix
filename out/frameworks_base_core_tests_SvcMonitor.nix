{ android_app }:
let

svcmonitor = android_app {
    name = "svcmonitor";
    srcs = ["src/com/android/google/experimental/svcmoniter/SvcMonitor.java"];
    resource_dirs = ["res"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit svcmonitor; }
