{ bootstrap_go_package }:
let

soong-llvm = bootstrap_go_package {
    name = "soong-llvm";
    pkgPath = "android/soong/external/llvm";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-cc"
        "soong-genrule"
    ];
    srcs = [
        "llvm.go"
        "tblgen.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-llvm; }
