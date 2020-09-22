{ bootstrap_go_package }:
let

soong-etc = bootstrap_go_package {
    name = "soong-etc";
    pkgPath = "android/soong/etc";
    deps = [
        "blueprint"
        "soong"
        "soong-android"
    ];
    srcs = [
        "prebuilt_etc.go"
    ];
    testSrcs = [
        "prebuilt_etc_test.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-etc; }
