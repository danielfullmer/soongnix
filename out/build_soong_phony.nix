{ bootstrap_go_package }:
let

soong-phony = bootstrap_go_package {
    name = "soong-phony";
    pkgPath = "android/soong/phony";
    deps = [
        "blueprint"
        "soong-android"
    ];
    srcs = [
        "phony.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-phony; }
