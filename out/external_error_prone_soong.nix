{ bootstrap_go_package }:
let

soong-java-config-error_prone = bootstrap_go_package {
    name = "soong-java-config-error_prone";
    pkgPath = "android/soong/java/config/error_prone";
    deps = [
        "soong-android"
        "soong-java-config"
    ];
    srcs = [
        "error_prone.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-java-config-error_prone; }
