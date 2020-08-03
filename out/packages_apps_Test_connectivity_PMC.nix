{ android_app }:
let

PMC = android_app {
    name = "PMC";
    platform_apis = true;
    certificate = "platform";
    dex_preopt = {
        enabled = false;
    };
    srcs = ["src/**/*.java"];
    resource_dirs = ["res"];
    privileged = true;
    optimize = {
        enabled = false;
    };
};

in { inherit PMC; }
