{ android_test }:
let

NinePatchLab = android_test {
    name = "NinePatchLab";
    srcs = ["src/com/android/ninepatch/NinePatchLab.java"];
    sdk_version = "current";
};

in { inherit NinePatchLab; }
