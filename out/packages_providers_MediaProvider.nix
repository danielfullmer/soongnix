{ android_app }:
let

MediaProvider = android_app {
    name = "MediaProvider";

    manifest = "AndroidManifest.xml";

    resource_dirs = [
        "res"
    ];

    srcs = [
        "src/**/*.aidl"
        "src/**/*.java"
    ];

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

    platform_apis = true;

    certificate = "media";

    privileged = true;
};

in { inherit MediaProvider; }
