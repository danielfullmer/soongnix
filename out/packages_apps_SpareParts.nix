{ android_app }:
let

SpareParts = android_app {
    name = "SpareParts";
    srcs = [
        "src/com/android/spare_parts/Enabler.java"
        "src/com/android/spare_parts/SpareParts.java"
    ];
    platform_apis = true;
};

in { inherit SpareParts; }
