{ android_app }:
let

OneMedia = android_app {
    name = "OneMedia";
    srcs = [
        "**/*.java"
        "src/**/I*.aidl"
    ];
    platform_apis = true;
    certificate = "platform";
    libs = ["org.apache.http.legacy"];
    optimize = {
        enabled = false;
    };
};

in { inherit OneMedia; }
