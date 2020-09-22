{ bootstrap_go_package }:
let

soong-env = bootstrap_go_package {
    name = "soong-env";
    pkgPath = "android/soong/env";
    srcs = [
        "env.go"
    ];
};

in { inherit soong-env; }
