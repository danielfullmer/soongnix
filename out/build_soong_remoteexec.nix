{ bootstrap_go_package }:
let

soong-remoteexec = bootstrap_go_package {
    name = "soong-remoteexec";
    pkgPath = "android/soong/remoteexec";
    deps = [
        "blueprint"
        "soong-android"
    ];
    srcs = [
        "remoteexec.go"
    ];
    testSrcs = [
        "remoteexec_test.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-remoteexec; }
