{ bootstrap_go_package }:
let

soong-dexpreopt = bootstrap_go_package {
    name = "soong-dexpreopt";
    pkgPath = "android/soong/dexpreopt";
    srcs = [
        "config.go"
        "dexpreopt.go"
    ];
    testSrcs = [
        "dexpreopt_test.go"
    ];
    deps = [
        "blueprint-pathtools"
        "soong-android"
    ];
};

in { inherit soong-dexpreopt; }
