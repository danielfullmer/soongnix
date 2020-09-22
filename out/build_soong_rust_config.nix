{ bootstrap_go_package }:
let

soong-rust-config = bootstrap_go_package {
    name = "soong-rust-config";
    pkgPath = "android/soong/rust/config";
    deps = [
        "soong-android"
        "soong-cc-config"
    ];
    srcs = [
        "arm_device.go"
        "arm64_device.go"
        "global.go"
        "toolchain.go"
        "allowed_list.go"
        "x86_darwin_host.go"
        "x86_linux_host.go"
        "x86_device.go"
        "x86_64_device.go"
    ];
};

in { inherit soong-rust-config; }
