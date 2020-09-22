{ bootstrap_go_package }:
let

soong-shared = bootstrap_go_package {
    name = "soong-shared";
    pkgPath = "android/soong/shared";
    srcs = [
        "paths.go"
    ];
};

in { inherit soong-shared; }
