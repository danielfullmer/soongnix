{ bootstrap_go_package }:
let

soong-libchrome = bootstrap_go_package {
    name = "soong-libchrome";
    pkgPath = "android/soong/external/libchrome";
    deps = [
        "blueprint"
        "soong"
        "soong-android"
        "soong-genrule"
    ];
    srcs = [
        "bindings_generator.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-libchrome; }
