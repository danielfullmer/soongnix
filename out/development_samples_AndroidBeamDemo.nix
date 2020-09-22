{ android_test }:
let

AndroidBeamDemo = android_test {
    name = "AndroidBeamDemo";
    #  Only compile source java files in this apk.
    srcs = ["src/com/example/android/beam/Beam.java"];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit AndroidBeamDemo; }
