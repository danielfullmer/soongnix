{ android_test }:
let

DensityTest = android_test {
    name = "DensityTest";
    srcs = [
        "src/com/google/android/test/dpi/DpiTestActivity.java"
        "src/com/google/android/test/dpi/DpiTestNoCompatActivity.java"
    ];
    platform_apis = true;
    aaptflags = [
        "-c"
        "120dpi,240dpi,160dpi,nodpi"
    ];
};

in { inherit DensityTest; }
