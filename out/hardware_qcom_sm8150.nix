{ bootstrap_go_package }:
let

# hardware/qcom/sm8150/Android.bp links to this file
soong-display_defaults = bootstrap_go_package {
    name = "soong-display_defaults";
    pkgPath = "android/soong/hardware/qcom/sm8150/display";
    deps = [
        "blueprint"
        "blueprint-pathtools"
        "soong"
        "soong-android"
        "soong-cc"
        "soong-genrule"
    ];
    srcs = [
        "display/display_defaults.go"
    ];
    pluginFor = ["soong_build"];
};

in { inherit soong-display_defaults; }
