{ bootstrap_go_package }:
let

soong-suite-harness = bootstrap_go_package {
    name = "soong-suite-harness";
    pkgPath = "android/soong/suite_harness";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "blueprint-proptools"
        "soong"
        "soong-android"
        "soong-java"
    ];
    srcs = [
        "tradefed_binary.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-suite-harness; }
