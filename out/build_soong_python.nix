{ bootstrap_go_package }:
let

soong-python = bootstrap_go_package {
    name = "soong-python";
    pkgPath = "android/soong/python";
    deps = [
        "blueprint"
        "soong-android"
        "soong-tradefed"
    ];
    srcs = [
        "androidmk.go"
        "binary.go"
        "builder.go"
        "defaults.go"
        "installer.go"
        "library.go"
        "proto.go"
        "python.go"
        "test.go"
    ];
    testSrcs = [
        "python_test.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-python; }
