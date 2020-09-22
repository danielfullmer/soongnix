{ bootstrap_go_package }:
let

soong-android-soongconfig = bootstrap_go_package {
    name = "soong-android-soongconfig";
    pkgPath = "android/soong/android/soongconfig";
    deps = [
        "blueprint"
        "blueprint-parser"
        "blueprint-proptools"
    ];
    srcs = [
        "config.go"
        "modules.go"
    ];
};

in { inherit soong-android-soongconfig; }
