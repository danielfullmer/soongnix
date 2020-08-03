{ bootstrap_go_package }:
let

soong-clang = bootstrap_go_package {
    name = "soong-clang";
    pkgPath = "android/soong/external/clang";
    deps = [
        "blueprint"
        "blueprint-proptools"
        "soong-android"
        "soong-cc"
        "soong-genrule"
    ];
    srcs = [
        "clang.go"
        "tblgen.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-clang; }
