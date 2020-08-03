{ android_app }:
let

ExternalStorageProvider = android_app {
    name = "ExternalStorageProvider";

    manifest = "AndroidManifest.xml";

    resource_dirs = [
        "res"
    ];

    srcs = [
        "src/**/*.java"
    ];

    platform_apis = true;

    certificate = "platform";

    privileged = true;
};

in { inherit ExternalStorageProvider; }
