{ android_app }:
let

MediaDump = android_app {
    name = "MediaDump";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    sdk_version = "current";
};

in { inherit MediaDump; }
