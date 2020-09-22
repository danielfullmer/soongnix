{ bootstrap_go_package }:
let

soong-tradefed = bootstrap_go_package {
    name = "soong-tradefed";
    pkgPath = "android/soong/tradefed";
    deps = [
        "blueprint"
        "soong-android"
    ];
    srcs = [
        "autogen.go"
        "config.go"
        "makevars.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-tradefed; }
