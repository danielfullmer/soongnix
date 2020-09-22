{ android_app }:
let

FixedGridLayout = android_app {
    name = "FixedGridLayout";
    srcs = [
        "src/com/example/android/fixedgridlayout/FixedGridLayout.java"
        "src/com/example/android/fixedgridlayout/FixedGridLayoutTest.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit FixedGridLayout; }
