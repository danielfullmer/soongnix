{ bootstrap_go_package }:
let

soong-sh = bootstrap_go_package {
    name = "soong-sh";
    pkgPath = "android/soong/sh";
    deps = [
        "blueprint"
        "soong"
        "soong-android"
        "soong-tradefed"
    ];
    srcs = [
        "sh_binary.go"
    ];
    testSrcs = [
        "sh_binary_test.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-sh; }
