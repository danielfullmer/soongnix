{ bootstrap_go_package }:
let

soong-ca-certificates = bootstrap_go_package {
    name = "soong-ca-certificates";
    pkgPath = "android/soong/system/ca-certificates";
    deps = [
        "soong-android"
        "soong-phony"
    ];
    srcs = [
        "ca_certificates.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-ca-certificates; }
