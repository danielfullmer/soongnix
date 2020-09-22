{ bootstrap_go_package }:
let

soong-java-config = bootstrap_go_package {
    name = "soong-java-config";
    pkgPath = "android/soong/java/config";
    deps = [
        "blueprint-proptools"
        "soong-android"
        "soong-remoteexec"
    ];
    srcs = [
        "config.go"
        "error_prone.go"
        "kotlin.go"
        "makevars.go"
    ];
};

in { inherit soong-java-config; }
